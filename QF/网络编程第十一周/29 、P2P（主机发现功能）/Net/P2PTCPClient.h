//
//  P2PTCPClient.h
//  P2P
//
//  Created by chen cheng on 14-07-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

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

#import "P2P.h"

@class P2PTCPClient;


@protocol P2PTCPClientDelegate <NSObject>

- (void)p2pTCPClient:(P2PTCPClient *)p2pTCPClient updateTransferState:(int)transferState;

- (void)p2pTCPClient:(P2PTCPClient *)p2pTCPClient updateTransferProgressWithIndex:(int)index numberOfImage:(int)numberOfImage;



@end


@interface P2PTCPClient : NSObject
{
    int         _socket;
    
    int         _errno;
    
    
    uint32_t    _serverIp; //主机字节序
    uint16_t    _serverPort; //主机字节序
    
    int _albumType;  // 0x01 本地相册 、0x02 系统相册
    NSString   *_waitingSendAlbumName;
    NSArray  *_waitingSendImageNameArray;
    
    NSURL  *_waitingSendGroupURL;
    NSArray  *_waitingSendImageURLArray;

    
    CC_Thread   *_thread;
    
    id<P2PTCPClientDelegate> _delegate;
}
@property(assign, nonatomic)id<P2PTCPClientDelegate> delegate;
@property(assign, nonatomic)uint32_t serverIp;
@property(assign, nonatomic)uint16_t serverPort;

@property(assign, nonatomic)int albumType;

@property(retain, nonatomic)NSString   *waitingSendAlbumName;
@property(retain, nonatomic)NSArray   *waitingSendImageNameArray;

@property(retain, nonatomic)NSURL   *waitingSendGroupURL;
@property(retain, nonatomic)NSArray   *waitingSendImageURLArray;


- (void)startSendImage;

@end
