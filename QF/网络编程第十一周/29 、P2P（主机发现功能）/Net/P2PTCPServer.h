//
//  P2PTCPServer.h
//  P2P
//
//  Created by chen cheng on 14-07-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "P2P.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <netdb.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <net/ethernet.h>
#import "CC_Thread.h"

@class P2PTCPServer;

@protocol P2PTCPServerDelegate <NSObject>

- (void)p2pTCPServer:(P2PTCPServer *)p2pTCPServer confirmWhetherToAcceptFromHostName:(NSString *)hostName;

- (void)p2pTCPServer:(P2PTCPServer *)p2pTCPServer updateTransferState:(int)transferState;

- (void)p2pTCPServer:(P2PTCPServer *)p2pTCPServer updateTransferProgressWithIndex:(int)index numberOfImage:(int)numberOfImage;

@end


@interface P2PTCPServer : NSObject
{
    int        _listenSocket;
    int        _connectSocket;
    uint16_t   _listenPort;

    int        _errno;
    
    CC_Thread   *_thread;
    
    
    NSCondition  *_waitUserResponseCondition;
    int         _accept; //-1未输入、0不接受文件、1接受文件.
    int         _albumType;
    NSString    *_saveAsAlbumName;
    
   
    
    id<P2PTCPServerDelegate>  _delegate;
    
    BOOL    _isBusy;
}


@property(copy, nonatomic)NSString    *saveAsAlbumName;
@property(readonly, nonatomic)uint16_t listenPort;
@property(assign, nonatomic)id<P2PTCPServerDelegate>  delegate;
@property(assign)BOOL    isBusy;

+ (P2PTCPServer *)shareP2PTCPServer;

- (void)start;
- (void)stop;


@end
