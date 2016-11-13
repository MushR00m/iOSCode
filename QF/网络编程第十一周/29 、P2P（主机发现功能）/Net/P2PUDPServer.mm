//
//  P2PUDPServer.m
//  P2P
//
//  Created by chen cheng on 14-07-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "P2PUDPServer.h"
#import "UIDevice+UIDeviceCategory.h"
#import "P2PTCPServer.h"


@implementation P2PUDPServer

@synthesize socket = _socket;
@synthesize port = _port;


- (void)dealloc
{
    [self stop];
    
    [super dealloc];
}

- (void)start
{
    if (_thread != nil)
    {
        [self stop];
    }
    
    [self openSocket];
    
    if (_errno > 0)
    {
        return;
    }
    
    _thread = [[CC_Thread alloc] init];
    _thread.main_selector = @selector(startThreadFun);
    _thread.target = self;
    
    [_thread start];
}

- (void)stop
{
    if (_thread != nil)
    {
        [_thread cancel];
        [_thread release];
        _thread = nil;
    }
    close(_socket);
}

- (void) openSocket
{
    int						reuseAddr;
	int						ret;

    struct	sockaddr_in		serverAddr;
    
    _socket = socket(AF_INET, SOCK_DGRAM, 0);
	if (_socket < 0)
	{
        _errno = errno;
  		return ;
	}
    
    reuseAddr = 1;
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
    
    _port = 1234;
    memset(&serverAddr, 0, sizeof(serverAddr));
	serverAddr.sin_family = AF_INET;
	serverAddr.sin_port = htons(_port);
	serverAddr.sin_addr.s_addr = htonl(INADDR_ANY);
    
    while (1)
    {
        serverAddr.sin_port = htons(_port);
        ret = bind(_socket, (struct sockaddr *)&serverAddr, sizeof(serverAddr));
        if (ret == 0)
        {
            break;
        }
        _port++;
    }
    
    NSLog(@"%s : %d UDP Server _port = %d\n", __FILE__, __LINE__, _port);
}

- (void)startThreadFun
{
    ssize_t          ret;
    
    ST_SCANNING      recvPacket;
    ST_SCANNING_ACK  sendPacket;
    
    
    sendPacket.type = PACKET_TYPE_SCANNING_ACK;
    sendPacket.len = (uint32_t)(sizeof(sendPacket.len) + sizeof(sendPacket.hostNameLen) + strlen([[UIDevice currentDevice].name UTF8String]));
    
    if ([UIDevice modelId] == DEVICE_MODELID_IPAD)
    {
        sendPacket.deviceType = 0x02;
    }
    else
    {
        sendPacket.deviceType = 0x01;
    }
    
    
    struct	sockaddr_in		clientAddr;
    socklen_t clientAddrLen;
    
    while (1)
    {
        clientAddrLen = sizeof(clientAddr);
        
        ret = recvfrom(_socket, &recvPacket, sizeof(recvPacket), 0, (struct sockaddr*)&clientAddr, &clientAddrLen);
        
        //NSLog(@"收到一个主机探测包\n");
        
        if (ret < 0)
        {
            printf("%s : %d recvfrom err\n", __FILE__, __LINE__);
            perror("recvfrom err");
            break;
        }
        
        if (recvPacket.type == PACKET_TYPE_SCANNING)
        {
            sendPacket.hostNameLen = strlen([[UIDevice currentDevice].name UTF8String]);
            sendPacket.hostName = (char *)malloc(sendPacket.hostNameLen);
            sendPacket.tcpServerPort = [P2PTCPServer shareP2PTCPServer].listenPort;
            memcpy(sendPacket.hostName, [[UIDevice currentDevice].name UTF8String], sendPacket.hostNameLen);
            
            
            char sendBuf[100];
            int  sendBufLen = sizeof(sendBuf);
            
            ret = en_scanning_ack(&sendPacket, sendBuf, &sendBufLen);
            if (ret < 0)
            {
                printf("en_scanning_ack err ret = %ld\n", ret);
            }
            
            free_scanning_ack(&sendPacket);

            sendto(_socket, sendBuf, sendBufLen, 0, (struct	sockaddr*)&clientAddr, clientAddrLen);
        }
    }
}


@end
