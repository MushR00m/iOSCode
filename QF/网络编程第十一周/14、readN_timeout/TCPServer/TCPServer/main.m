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

void clientThread(int connectSocketfd)
{
    char recvBuf[1024];
    while (1)
    {
        //1、收包
        ssize_t nbytes = recvPacket_timeout(connectSocketfd, recvBuf, sizeof(recvBuf), NO, 10);
        if (nbytes < 0)
        {
            NSLog(@"收包失败、结束对这个客户的服务");
            break;
        }
        
        //为了便于测试先打印
        printPackt(recvBuf, nbytes);
        
        
        ST_HEAD *head = (ST_HEAD *)recvBuf;
        if (head->type == PACKET_TYPE_FILE_DOWNLOAD_REQUEST)
        {
            //2、解包
            ST_FILE_DOWNLOAD_REQUEST fileDownloadRequest;
            nbytes =  decode_file_download_request(&fileDownloadRequest, recvBuf, nbytes);
            if (nbytes < 0)
            {
                NSLog(@"解文件下载请求包失败");
                continue;
            }
            
            
            //3、处理包
            process_file_download_request(&fileDownloadRequest, connectSocketfd);
            
            //4、销毁包
            dealloc_file_download_request(&fileDownloadRequest);
        }
        else if (head->type == PACKET_TYPE_HEART_BEAT)
        {
            ST_HEART_BEAT   heartBeat;
            
            //解包
            nbytes = decode_heart_beat(&heartBeat, recvBuf, nbytes);
            if (nbytes < 0)
            {
                NSLog(@"解文件下载请求包失败");
                continue;
            }
            
            //处理包
            process_heart_beat(&heartBeat, connectSocketfd);
        }
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

