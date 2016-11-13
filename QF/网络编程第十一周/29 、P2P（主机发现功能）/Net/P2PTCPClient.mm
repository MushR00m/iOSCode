//
//  P2PTCPClient.m
//  P2P
//
//  Created by chen cheng on 14-07-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "P2PTCPClient.h"
#import "P2P.h"
#import "NetPublic.h"


@implementation P2PTCPClient

@synthesize delegate = _delegate;

@synthesize serverIp = _serverIp;
@synthesize serverPort = _serverPort;

@synthesize albumType = _albumType;

@synthesize waitingSendAlbumName = _waitingSendAlbumName;
@synthesize waitingSendImageNameArray = _waitingSendImageNameArray;


@synthesize waitingSendGroupURL = _waitingSendGroupURL;
@synthesize waitingSendImageURLArray = _waitingSendImageURLArray;


- (void)dealloc
{
    [self stop];
    
    self.waitingSendAlbumName = nil;
    self.waitingSendImageNameArray = nil;
    
    self.waitingSendGroupURL = nil;
    self.waitingSendImageURLArray = nil;
    
    [super dealloc];
}

- (void)openSocket
{
    int ret = -1;
    
    close(_socket);
    
	_socket = socket(AF_INET, SOCK_STREAM, 0);
	if (_socket < 0)
	{
        _errno = errno;
  		return ;
	}
    
    struct	sockaddr_in		serverAddr;
    
    serverAddr.sin_family = AF_INET;
    serverAddr.sin_addr.s_addr = htonl(self.serverIp);
    serverAddr.sin_port = htons(self.serverPort);
    
    ret = connect(_socket, (struct sockaddr *)&serverAddr, sizeof(struct sockaddr_in));
    if (ret < 0)
    {
        perror("connect err");
        close(_socket);
        _errno = errno;
  		return ;
    }
    
    _errno = 0;
}

- (void)startSendImage
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
    _thread.main_selector = @selector(startSendImageThreadFun);
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

- (void)startSendImageThreadFun
{
    
}
















@end
