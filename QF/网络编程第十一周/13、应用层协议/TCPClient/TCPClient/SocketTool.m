//
//  SocketTool.m
//  TCPServer
//
//  Created by chen cheng on 14-9-24.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "SocketTool.h"
#include <sys/types.h>
#include <sys/socket.h>
#import <netinet/in.h>
#include <arpa/inet.h>

/**
 *  创建一个监听套接字
 *
 *  @param ipstr 服务端的ip地址
 *  @param port  服务端的端口
 *
 *  @return 大于等于表示创建成功、否则失败。
 */
int openListenSocket(char *ipstr, uint16_t port)
{
    int listenSocketfd = socket(AF_INET, SOCK_STREAM, 0);
    if (listenSocketfd < 0)
    {
        perror("socket err");
        return -1;
    }

    struct sockaddr_in severAddr;
    
    severAddr.sin_family = AF_INET;
    inet_pton(AF_INET, ipstr, &(severAddr.sin_addr));
    severAddr.sin_port = htons(port);
    
    
    int ret = bind(listenSocketfd, (struct sockaddr *)&severAddr, sizeof(severAddr));
    if (ret < 0)
    {
        perror("bind err");
        close(listenSocketfd);//关掉套接字
        return -1;
    }

    
    
    
    ret = listen(listenSocketfd, 5);
    if (ret < 0)
    {
        perror("listen err");
        close(listenSocketfd);//关掉套接字
        return -1;
    }
    
    return listenSocketfd;

}

/**
 *  打开一个连接服务器的客户端的TCP套接字
 *
 *  @param ipstr 服务端的ip地址
 *  @param port  服务端的端口
 *
 *  @return 大于等于表示创建成功、否则失败。
 */
int openClientSocket(char *ipstr, uint16_t port)
{
    int socketfd = socket(AF_INET, SOCK_STREAM, 0);
    if (socketfd < 0)
    {
        perror("socket err");
        return 0;
    }
    
    struct sockaddr_in severAddr;
    severAddr.sin_family = AF_INET;
    inet_pton(AF_INET, ipstr, &(severAddr.sin_addr));
    severAddr.sin_port = htons(port);
    
    
    int ret = connect(socketfd, (struct sockaddr *)&severAddr, sizeof(severAddr));
    if (ret < 0)
    {
        perror("connect err");
        close(socketfd);
        return -1;
    }

    return socketfd;
}


/**
 *  该函数一定能够读出nbyte字节的数据、除非两种情况：1、读取失败。2、遇到文件结尾。
 *
 *  @param fildes 文件描述符
 *  @param buf    输出参数——带出读出的数据
 *  @param nbyte  指定要多多少个字节
 *
 *  @return n 1、nbyte = n 表示成功读取nbyte个字节 2、nbyte>n>=0 表示成功读取nbyte个字节、同时遇到了文件结尾 3、n<0 表示读书失败
 */
ssize_t readN(int fildes, void *buf, size_t nbyte)
{
    ssize_t offset = 0;
    
    while (nbyte > offset)
    {
        ssize_t ret = read(fildes, buf+offset, (nbyte - offset));
        if (ret < 0)
        {
            return -1;
        }
        else if (ret == 0)
        {
            break;
        }
        else
        {
            offset += ret;
        }
    }
    
    return offset;
}


/**
 *  该函数一定能够写入nbyte字节的数据。除非一种情况：写入时出现错误。
 *
 *  @param fildes 文件描述符
 *  @param buf    输入参数——即将要写入的数据
 *  @param nbyte  指定要写入的字节数。
 *
 *  @return 1、nbyte>= n >=0、表示成功写入n个字节。2、n<0 表示写入失败
 */
ssize_t writeN(int fildes, const void *buf, size_t nbyte)
{
    ssize_t offset = 0;
    
    while (nbyte > offset)
    {
        ssize_t ret = write(fildes, buf+offset, nbyte-offset);
        if (ret < 0)
        {
            return -1;
        }
        else
        {
            offset += ret;
        }
    }
    return offset;
}

/**
 *  该函数一定能够读出一行数据、除非两种情况：1、出现错误。 2、遇到文件结尾。3、buf的容量不够大、装不下一行数据。
 *
 *  @param fildes 文件描述符
 *  @param buf    输出参数——带出读出数据
 *  @param nbyte  指定了buf得最大大小。
 *
 *  @return 1、nbyte>= n >=0、表示成功写入n个字节。2、n<0 表示写入失败
 */
ssize_t readLine(int fildes, void *buf, size_t nbyte)
{
    ssize_t offset = 0;
    
    while (nbyte > offset)
    {
        ssize_t ret = read(fildes, buf+offset, 1);
        if (ret < 0)
        {
            return -1;
        }
        else if (ret == 0)
        {
            break;
        }
        else
        {
            offset += ret;
            if (*(char *)(buf+offset-1) == '\n')
            {
                break;
            }
        }
    }
    
    return offset;
}




