//
//  P2PUDPServer.h
//  P2P
//
//  Created by chen cheng on 14-07-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <inttypes.h>

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


@interface P2PUDPServer : NSObject
{
    int _socket;
    int  _errno;
    int _port;
    
    CC_Thread   *_thread;
}

@property(readonly, nonatomic)int socket;
@property(readonly, nonatomic)int port;

- (void)start;
- (void)stop;

@end
