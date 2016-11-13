//
//  P2PUDPClient.h
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


@interface PointInfo : NSObject
{
    NSString   *_hostName;
    uint32_t   _ip; //主机字节序
    uint16_t   _tcpPort;
    int        _deviceType;
}

@property(retain, nonatomic)NSString   *hostName;
@property(assign, nonatomic)uint32_t   ip;
@property(assign, nonatomic)uint16_t   tcpPort;
@property(assign, nonatomic)int   deviceType;


@end

@class P2PUDPClient;

@protocol P2PUDPClient <NSObject>

- (void)p2pUDPClient:(P2PUDPClient *)p2pUDPClient refreshPoints:(NSArray *)pointInfos;

@end

@interface P2PUDPClient : NSObject
{
    int _socket;
    int  _errno;
    int _port;
    
    CC_Thread   *_sendThread;
    CC_Thread   *_recvThread;
    
    uint32_t  _subnetmask;//主机字节序
    uint32_t  _selfIp;//主机字节序
    
    id<P2PUDPClient>  _delegate;
    
    NSMutableArray   *_pointInfoMutableArray;
    
    NSCondition    *_condition;
}
@property(assign, nonatomic)id delegate;
@property(readonly, nonatomic)int socket;
@property(readonly, nonatomic)int port;

- (void)start;
- (void)stop;

@end