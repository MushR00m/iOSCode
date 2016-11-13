//
//  TCPServer.m
//  照片传输服务端
//
//  Created by chen cheng on 14-9-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "TCPServer.h"
#import "SocketTool.h"
#import "QFPacket.h"
#include <sys/socket.h>

@implementation TCPServer


- (id)initWithListenPort:(uint16_t)port
{
    self = [super init];
    if (self != nil)
    {
        _port = port;
    }
    
    return self;
}


- (BOOL)start
{
    if (_isStarted)
    {
        return YES;
    }
    
    _isStarted = YES;
    
    _listenSocket = openListenSocket(_port);
    
    if (_listenSocket >= 0)
    {
        //启动监听线程
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            [self listenThreadMain];
        });
        
        
        return YES;
    }
    else
    {
        return NO;
    }
}

- (void)listenThreadMain
{
    while (1)
    {
        int connectSocketfd = accept(_listenSocket, NULL, NULL);
        if (connectSocketfd < 0)
        {
            perror("accept err");
            continue;
        }
        
        NSLog(@"connectSocketfd = %d", connectSocketfd);
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self clientThread:connectSocketfd];
        });
    }
}

- (void)clientThread:(int)connectSocketfd
{
    while (1)
    {
        @autoreleasepool
        {
            //1、收包
            NSData  *data;
            BOOL ret = [QFPacket recvPacketWithSocket:connectSocketfd data:&data atomically:NO];
            if (!ret)
            {
                NSLog(@"收包失败、结束对这个客户的服务");
                break;
            }
            //为了便于测试先打印
            //NSLog(@"data = %@", data);
            //工厂方法
            QFPacket  *packet = [QFPacket packetWithData:data];
            
            //处理包（利用多态处理包）
            [packet processPacketWithSocket:connectSocketfd];

        }
    }
    
    close(connectSocketfd);
}



@end
