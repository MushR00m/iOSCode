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


/**
 *  对套接字的读操作或写操作进行关闭。（对套接字写操作的关闭和读写操作都关闭导致的TCP传输控制层行为是一样的，即给对方发一个FIN。在只关闭读操作的时候、不会导致TCP传输控制层给对方发送任何信息）
 *
 *  @param socket 套接字
 *  @param how    1、SHUT_RD：只关闭读得一方 2、SHUT_WR：只关闭写的一方 3、SHUT_RDWR把读写段都关闭、相当于close函数。
 *
 *  @return 0关闭成功否则失败
 */
//int shutdown(int socket, int how);


void sendPacketThread(int socketfd)
{
    char sendBuf[100];
    
    while (1)
    {
        //从标准输入读数据
        ssize_t nbytes = read(STDIN_FILENO, sendBuf, sizeof(sendBuf));
        if (nbytes == 0)//结束了标准输入
        {
            NSLog(@"结束标准输入");
            break;
        }
        else if (nbytes < 0)
        {
            NSLog(@"从准输入读取失败");
            break;
        }
        
        nbytes = write(socketfd, sendBuf, nbytes);
        if (nbytes < 0)
        {
            NSLog(@"发送失败");
            break;
        }
    }
    
    //关闭写入端。
    shutdown(socketfd, SHUT_WR);
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
    int ret = -1;
    
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

    
    ret = connect(socketfd, (struct sockaddr *)&severAddr, sizeof(severAddr));
    if (ret < 0)
    {
        perror("connect err");
        close(socketfd);
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

