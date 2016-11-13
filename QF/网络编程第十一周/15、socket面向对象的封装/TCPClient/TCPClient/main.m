//
//  main.m
//  TCPClient
//
//  Created by chen cheng on 14-9-23.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <sys/types.h>
#include <sys/socket.h>
#import <netinet/in.h>
#include <arpa/inet.h>

#import "SocketTool.h"
#import "Packet.h"


void sendPacketThread(int socketfd)
{
    char sendBuf[1024] ;
    
    ST_FILE_DOWNLOAD_REQUEST  fileDownloadRequest;
    
    //初始化包
    if (init_file_download_request(&fileDownloadRequest, "a.txt") == NULL)
    {
        NSLog(@"初始化失败");
        return;
    }
    
    //打包
    ssize_t nbytes = encode_file_download_request(&fileDownloadRequest, sendBuf, sizeof(sendBuf));
    if (nbytes < 0)
    {
        NSLog(@"打包失败");
        return;
    }
    
    //为了便于测试  先打印出数据
    printPackt(sendBuf, nbytes);
    
    
    //发包
    sendPacket(socketfd, sendBuf, nbytes, YES);
    
    //销毁包
    dealloc_file_download_request(&fileDownloadRequest);
}

void heartBeatThread(int socketfd)
{
    uint32_t   number = 0;
    
    ST_HEART_BEAT  heartBeat;
    uint8_t   sendBuf[10];
    
    while (1)
    {
        number++;
        
        init_heart_beat(&heartBeat, number);
        
        ssize_t nbytes = encode_heart_beat(&heartBeat, sendBuf, sizeof(sendBuf));
        
        sendPacket(socketfd, sendBuf, nbytes, YES);
        
        sleep(3);
    }
}

void recvPacketThread(int socketfd)
{
    char recvBuf[1024];
    while (1)
    {
        //1、收包
        ssize_t nbytes = recvPacket_timeout(socketfd, recvBuf, sizeof(recvBuf), NO, 10);
        if (nbytes < 0)
        {
            NSLog(@"收包失败");
            break;
        }
        
        //为了便于测试先打印
        printPackt(recvBuf, nbytes);
        
        
        ST_HEAD *head = (ST_HEAD *)recvBuf;
        if (head->type == PACKET_TYPE_FILE_DOWNLOAD_RESPONSE)
        {
            //2、解包
            
            
            //3、处理包
            
            
            //4、销毁包
            
        }
        else if (head->type == PACKET_TYPE_HEART_BEAT)
        {
            ST_HEART_BEAT   heartBeat;
            
            //解包
            nbytes = decode_heart_beat(&heartBeat, recvBuf, nbytes);
            if (nbytes < 0)
            {
                NSLog(@"解文心跳包失败");
                continue;
            }
            
            //处理包
            process_heart_beat(&heartBeat, socketfd);
        }
    }
}


int main(int argc, const char * argv[])
{
    int socketfd = -1;
    
    socketfd = openClientSocket("127.0.0.1", 8090);
    if (socketfd < 0)
    {
        perror("socket err");
        return 0;
    }
    NSLog(@"连接服务器成功");
    
    
    //收包线程
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        recvPacketThread(socketfd);
    });

    
    //发包线程
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sendPacketThread(socketfd);
    });
    
    //心跳线程
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        heartBeatThread(socketfd);
    });

    
    while (1)
    {
        [[NSRunLoop currentRunLoop] run];
    }
    

    return 0;
}

