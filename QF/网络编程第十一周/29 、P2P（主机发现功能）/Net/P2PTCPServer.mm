//
//  P2PTCPServer.m
//  P2P
//
//  Created by chen cheng on 14-07-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "P2PTCPServer.h"
#import "NetPublic.h"
#import "SocketTool.h"


static  P2PTCPServer *g_p2pTCPServer = nil;

@implementation P2PTCPServer

@synthesize listenPort = _listenPort;

@synthesize delegate = _delegate;

@synthesize saveAsAlbumName = _saveAsAlbumName;

@synthesize isBusy = _isBusy;

+ (P2PTCPServer *)shareP2PTCPServer
{
    return g_p2pTCPServer;
}

- (id) init
{
    self = [super init];
    if (self != nil)
    {
        _listenSocket = -1;
        _listenPort = 5555;
        _errno = 0;
        
        _waitUserResponseCondition = [[NSCondition alloc] init];
        
    }
    
    g_p2pTCPServer = self;
    
    return self;
}

- (void)dealloc
{
    g_p2pTCPServer = nil;
    
    [self stop];
    
    [_waitUserResponseCondition release];
    _waitUserResponseCondition = nil;
    
    [super dealloc];
}

- (void)openListenSocket
{
	int						reuseAddr;
	int						ret;
	
	struct	sockaddr_in		serverAddr;
	
	
	_listenSocket = socket(AF_INET, SOCK_STREAM, 0);
	if (_listenSocket < 0)
	{
        _errno = errno;
  		return ;
	}
    
    reuseAddr = 1;
	ret = setsockopt(_listenSocket, SOL_SOCKET, SO_REUSEADDR, (void *)&reuseAddr, sizeof(reuseAddr));
	if (ret < 0)
	{
		if (_listenSocket > 0)
		{
			close(_listenSocket);
            _listenSocket = -1;
            _errno = errno;
		}
  		return;
	}
    
    _listenPort = 5555;
    memset(&serverAddr, 0, sizeof(serverAddr));
	serverAddr.sin_family = AF_INET;
	serverAddr.sin_port = htons(_listenPort);
	serverAddr.sin_addr.s_addr = htonl(INADDR_ANY);
    
    while (1)
    {
        serverAddr.sin_port = htons(_listenPort);
        ret = bind(_listenSocket, (struct sockaddr *)&serverAddr, sizeof(serverAddr));
        if (ret == 0)
        {
            break;
        }
        _listenPort++;
    }
    
    NSLog(@"%s : %d TCP Server _listenSocket = %d\n", __FILE__, __LINE__, _listenPort);
	
    ret = listen(_listenSocket, 10);
    if (ret < 0)
	{
		if (_listenSocket > 0)
		{
			close(_listenSocket);
            _listenSocket = -1;
            _errno = errno;
		}
  		return;
	}
    
    _errno = 0;
}

- (void)start
{
    if (_thread != nil)
    {
        [self stop];
    }
    
    [self openListenSocket];
    
    if (_errno > 0)
    {
        return;
    }
    
    _thread = [[CC_Thread alloc] init];
    _thread.main_selector = @selector(startThreadFun);
    _thread.target = self;
    
    [_thread start];
}

- (void)startThreadFun
{
    
    _connectSocket = accept(_listenSocket, NULL, NULL);
    if (_connectSocket < 0)
    {
        _errno = errno;
        return;
    }

    //之后循环收包和处理包
}



- (void)stop
{
    if (_thread != nil)
    {
        [_thread cancel];
        [_thread release];
        _thread = nil;
    }
    close(_listenSocket);
    close(_connectSocket);
}


@end
