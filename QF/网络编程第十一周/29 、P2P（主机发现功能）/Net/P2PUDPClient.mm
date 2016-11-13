//
//  P2PUDPClient.m
//  P2P
//
//  Created by chen cheng on 14-07-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "P2PUDPClient.h"
#import "NetPublic.h"
#import "UIDevice+UIDeviceCategory.h"

@implementation PointInfo

@synthesize hostName = _hostName;
@synthesize ip = _ip;
@synthesize tcpPort = _tcpPort;
@synthesize deviceType = _deviceType;

- (void)dealloc
{
    self.hostName = nil;
    
    [super dealloc];
}

@end

@implementation P2PUDPClient

@synthesize delegate = _delegate;
@synthesize socket = _socket;
@synthesize port = _port;


- (id)init
{
    self = [super init];
    if (self)
    {
        int ret = -1;
        ret = getSubnetMask(&_selfIp, &_subnetmask);
        if (ret < 0)
        {
            [super dealloc];
            
            self = nil;
            return nil;
        }
        
        //_selfIp = 0xC0A80164;
        //_subnetmask = 0xFFFFFF00;
        
        //CCLogMessage(CCLogLevelDebug, @"_selfIp = %08X\n", _selfIp);
        //CCLogMessage(CCLogLevelDebug, @"_subnetmask = %08X\n", _subnetmask);
        
        _pointInfoMutableArray = [[NSMutableArray alloc] init];

        _condition = [[NSCondition alloc] init];
    }
    
    return self;
}

- (void)dealloc
{
    [self stop];
    
    [_pointInfoMutableArray release];
    _pointInfoMutableArray = nil;
    
    
    [_condition release];
    _condition = nil;
    
    [super dealloc];
}


- (void)start
{
    if (_sendThread != nil)
    {
        [self stop];
    }
    
    [self openSocket];
    
    if (_errno > 0)
    {
        return;
    }
    
    _recvThread = [[CC_Thread alloc] init];
    _recvThread.main_selector = @selector(recvThreadFun);
    _recvThread.target = self;
    
    [_recvThread start];

    
    _sendThread = [[CC_Thread alloc] init];
    _sendThread.main_selector = @selector(sendThreadFun);
    _sendThread.target = self;
    
    [_sendThread start];
}

- (void)stop
{
    if (_sendThread != nil)
    {
        [_sendThread cancel];
        [_sendThread release];
        _sendThread = nil;
    }
    close(_socket);
}

- (void) openSocket
{
    int						reuseAddr;
	int						ret;
    
    _socket = socket(AF_INET, SOCK_DGRAM, 0);
	if (_socket < 0)
	{
        _errno = errno;
  		return ;
	}
    
    reuseAddr = SO_REUSEADDR;
	ret = setsockopt(_socket, SOL_SOCKET, SO_REUSEADDR, (void *)&reuseAddr, sizeof(reuseAddr));
	if (ret < 0)
	{
		if (_socket > 0)
		{
			close(_socket);
            _socket = -1;
            _errno = errno;
		}
  		return;
	}
}

- (void)sendThreadFun
{
    ST_SCANNING  sendPacket;
    
    sendPacket.type = PACKET_TYPE_SCANNING;
    sendPacket.len = 0;
    
    char sendBuf[100];
    int  sendBufLen = sizeof(sendBuf);
    en_scanning(&sendPacket, sendBuf, &sendBufLen);
    
    struct	sockaddr_in		ipAddr;
    
    ipAddr.sin_family = AF_INET;
    ipAddr.sin_port = htons(1234);
    
    
    while (1)
    {
        if (self.delegate != nil)
        {
            dispatch_sync(dispatch_get_main_queue(), ^{
                
                [_condition lock];
                
                [self.delegate p2pUDPClient:self refreshPoints:_pointInfoMutableArray];
                
                [_condition unlock];
            });

        }
        
        [_pointInfoMutableArray removeAllObjects];

        //可以用组播代替以下代码、但组播可能不支持笔记本热点上网的iOS终端
        uint32_t maxHostId = ~_subnetmask-1;
        uint32_t netId = _selfIp & _subnetmask;
        
        for (int i=1; i<=maxHostId; i++)
        {
            if (netId + i == _selfIp)
            {
                continue;//不允许发现自己
            }
            struct in_addr addr;
            addr.s_addr = htonl(netId + i);
            
            ipAddr.sin_addr.s_addr =  htonl(netId + i);
            sendto(_socket, sendBuf, sendBufLen, 0, (struct sockaddr *)&ipAddr, sizeof(ipAddr));
        }
        
        sleep(5);//每隔一秒扫描一次
    }
}

- (void)recvThreadFun
{
    NSLog(@"UDP的客户端的收包线程 已经启动");
    ssize_t ret;
    
    uint8_t  recvBuf[100];
    ST_SCANNING_ACK scanningAck;
    
    struct	sockaddr_in		clientAddr;
    socklen_t clientAddrLen;
    
    while (1)
    {
        clientAddrLen = sizeof(clientAddr);
        ret = recvfrom(_socket, recvBuf, sizeof(recvBuf), 0, (struct	sockaddr*)&clientAddr, &clientAddrLen);
        
        
        NSLog(@"UDP的客户端的收包线程 收到一个数据包 ret = %ld", ret);
        
        if (ret < 0)
        {
            printf("%s : %d recvfrom err:", __FILE__, __LINE__);
            perror("recvfrom err");
            break;
        }
        
        ST_HEAD  *head = (ST_HEAD*)recvBuf;
        
        if (head->type == PACKET_TYPE_SCANNING_ACK)
        {
            de_scanning_ack(&scanningAck, recvBuf, (int)ret);
            
            char    hostName[100];
            memset(hostName, 0, sizeof(hostName));
            memcpy(hostName, scanningAck.hostName, scanningAck.hostNameLen);
            
            uint32_t ip = (uint32_t)(clientAddr.sin_addr.s_addr);
            
            ip = ntohl(ip);
            
            PointInfo  *pointInfo = [[PointInfo alloc] init];
            pointInfo.hostName = [NSString stringWithUTF8String:hostName];
            pointInfo.ip = ip;
            pointInfo.tcpPort = scanningAck.tcpServerPort;
            pointInfo.deviceType = scanningAck.deviceType;
            
            
            [_condition lock];
                        
            [_pointInfoMutableArray addObject:pointInfo];
            
            [_condition unlock];
            
            [pointInfo release];
        }
    }
}



@end
