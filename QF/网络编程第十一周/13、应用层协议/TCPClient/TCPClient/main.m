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
    char sendBuf[1024];
    
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
    writeN(socketfd, sendBuf, nbytes);
    
    //销毁包
    dealloc_file_download_request(&fileDownloadRequest);
}

void recvPacketThread(int socketfd)
{
    char recvBuf[100];
    
    while (1)
    {
        ssize_t nbytes = read(socketfd, recvBuf, sizeof(recvBuf));
        if (nbytes == 0)
        {
            NSLog(@"服务端已经关闭");
            break;
        }
        else if (nbytes < 0)
        {
            NSLog(@"从服务器读取失败");
            break;
        }
        
        //把数据打印到标准输出文件
        write(STDOUT_FILENO, recvBuf, nbytes);
    }
    
    //关闭读取段
    shutdown(socketfd, SHUT_RD);
    
    
    exit(0);//结束客户端进程
}


int main(int argc, const char * argv[])
{
    int socketfd = -1;
    
    socketfd = openClientSocket("127.0.0.1", 8080);
    if (socketfd < 0)
    {
        perror("socket err");
        return 0;
    }
    
    NSLog(@"连接服务器成功");
    

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sendPacketThread(socketfd);
    });
    

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        recvPacketThread(socketfd);
    });
    
    
    while (1)
    {
        [[NSRunLoop currentRunLoop] run];
    }
    
    return 0;
}

