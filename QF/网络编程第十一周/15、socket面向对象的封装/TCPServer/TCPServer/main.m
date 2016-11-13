//
//  main.m
//  TCPServer
//
//  Created by chen cheng on 14-9-23.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SocketTool.h"
#import "Packet.h"

#include <sys/socket.h>
#import "QFPacket.h"
#import "QFHeartBeatPacket.h"
#import "QFFileDownloadRequestPacket.h"

void clientThread(int connectSocketfd)
{
    while (1)
    {
        //1、收包
        NSData  *data;
        BOOL ret = [QFPacket recvPacketWithSocket:connectSocketfd data:&data atomically:NO timeout:10];
        if (!ret)
        {
            NSLog(@"收包失败、结束对这个客户的服务");
            break;
        }
        //为了便于测试先打印
        NSLog(@"data = %@", data);//
        //工厂方法
        QFPacket  *packet = [QFPacket packetWithData:data];
        
        //处理包（利用多态处理包）
        [packet processPacketWithSocket:connectSocketfd];
    }
    
    close(connectSocketfd);
}


void listenThread(int listenSocketfd)
{
    while (1)
    {
        int connectSocketfd = accept(listenSocketfd, NULL, NULL);
        if (connectSocketfd < 0)
        {
            perror("accept err");
            continue;
        }
        
        NSLog(@"connectSocketfd = %d", connectSocketfd);
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            clientThread(connectSocketfd);
        });
    }
    
    close(listenSocketfd);
}

int main(int argc, const char * argv[])
{
    int listenSocketfd = -1;
    
    listenSocketfd = openListenSocket("127.0.0.1", 8090);
    if (listenSocketfd < 0)
    {
        perror("socket err");
        return 0;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        listenThread(listenSocketfd);
    });
    

    while (1)
    {
        [[NSRunLoop currentRunLoop] run];
    }
    
    return 0;
}

