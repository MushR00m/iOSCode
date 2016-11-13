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


/**
 *   通过套接字socket连接服务器（该函数会阻塞、直到连接成功或失败）
 *
 *  @param socket      套接字
 *  @param address     服务端的套接字地址
 *  @param address_len 服务端的套接字地址的长度
 *
 *  @return 0表示连接成功否则失败
 */
int connect(int socket, const struct sockaddr *address,
        socklen_t address_len);

int main(int argc, const char * argv[])
{
    int socketfd = -1;
    int ret = -1;
    
    //一般情况下、我们会忽略管道信号、以减少app发生闪退的几率。
    signal(SIGPIPE, SIG_IGN);
    
    socketfd = socket(AF_INET, SOCK_STREAM, 0);
    if (socketfd < 0)
    {
        perror("socket err");
        return 0;
    }
    
    struct sockaddr_in severAddr;
    severAddr.sin_family = AF_INET;
    inet_pton(AF_INET, "127.0.0.1", &(severAddr.sin_addr));
    severAddr.sin_port = htons(8080);
    
    NSLog(@"connect 11");
    
    ret = connect(socketfd, (struct sockaddr *)&severAddr, sizeof(severAddr));
    if (ret < 0)
    {
        perror("connect err");
        close(socketfd);
        return 0;
    }
    
    NSLog(@"connect 22");
    
    char sendBuf[] = "hello world";
    
    getchar();
    
    NSLog(@"write 11");
    
    
    while (1)
    {
        //如果反复的对一个对方已经关闭了读操作套接字进行写、会导致系统给当前进程发送一个管道信号SIGPIPE。
        ssize_t nbytes = write(socketfd, sendBuf, strlen(sendBuf));
        if (nbytes < 0)
        {
            perror("write err");
            close(socketfd);
            return 0;
        }
        
        NSLog(@"成功的向服务器发送了%ld个字节的数据", nbytes);
        
        getchar();
    }

    
    
    getchar();
    
    close(socketfd);
    
    return 0;
}

