//
//  main.m
//  TCPServer
//
//  Created by chen cheng on 14-9-23.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <sys/types.h>
#include <sys/socket.h>
#import <netinet/in.h>

/**
 *  创建一个套接字（套接字：它就是一个大于等于0的整数、他本质上是一个文件描述符。以后发送数据到网络上和从网络上收数据都是对套接字的操作来完成的）
 *
 *  @param domain   指定套接字适用的协议族（AF_INET 或 PF_INET 表示是适用于TCP/IP协议族）
 *  @param type     指定协议的类型（如果是TCP/IP协议族编程、这里特指传输控制层的协议类型:主要包括两种 1、SOCK_STREAM表示字节流类型传输控制策略 2、SOCK_DGRAM表示数据报类型传输控制策略）
 *  @param protocol 指定具体的协议名称（如果是TCP/IP协议族编程、这里特指传输控制层的具体协议名称。一般设为0.如果类型为SOCK_STREAM、则自动选择TCP作为传输控制层协议。如果类型为SOCK_DGRAM、则自动选择UDP作为传输控制层协议）
 *
 *  @return 大于等于0表示创建套接字成功、返回值即代表套接字。否则失败
 */
int socket(int domain, int type, int protocol);


/**
 *  给套接字绑定一个地址
 *
 *  @param socket      套接字
 *  @param address     通用套接字地址
 *  @param address_len 套接字地址的长度
 *
 *  @return 大于等于0表示绑定成功否则失败
 */
int bind(int socket, const struct sockaddr *address, socklen_t address_len);


/**
 *  把字符串形式的ip地址转化成网络字节序 的整数ip地址
 *
 *  @param af  ip地址使用的协议族
 *  @param src 字符串形式的ip地址
 *  @param dst 输出参数、带出网络字节序的ip地址
 *
 *  @return 等于1表示调用成功否则失败
 */
int inet_pton(int af, const char * restrict src, void * restrict dst);


/**
 *  把网络字节序的ip地址转化成字符串形式的ip地址
 *
 *  @param af   ip地址使用的协议族
 *  @param src  网络字节序的ip地址
 *  @param dst  输出参数、带出字符串形式的ip地址
 *  @param size 指针dst所指向的内存的大小、防止内存越界
 *
 *  @return 调用成功返回dst、否则失败
 */
const char * inet_ntop(int af, const void * restrict src, char * restrict dst,
          socklen_t size);

/**
 *  让一个套接字处于监听状态（即被动状态、只能被动的接受客户端的TCP连接请求、不能主动发起TCP连接、默认情况下、套接字是处于主动状态的）
 *
 *  @param socket  套接字
 *  @param backlog 队列的大小（队列里面保存正在连接和已经完成连接的TCP客户端的信息、整个连接过程即TCP连接的三路握手）
 *
 *  @return 大于等于0表示调用成功否则失败
 */
int listen(int socket, int backlog);



/**
 *  该函数实际上是一个出队函数、它从监听队列里面取出一个已经完成了TCP连接的客户（即完成了TCP连接的三路握手的客户）。如果监听队列里面没有一个已经完成了连接的客户、该函数会阻塞。
 *
 *  @param socket      监听队列所对应的套接字
 *  @param address     输出参数、带出客户端套接字地址
 *  @param address_len 输入输出参数、输入的是第二参数所指向内存的最大大小、输出的是实际使用了的二个参数所指向的内存的大小。
 *
 *  @return 大于等于0、表示调用成功、返回值代表的一个新的套接字、把它称之为连接套接字、以后和这个客户进行通信时、使用的就是这个连接套接字。小于0表示调用失败
 */
int accept(int socket, struct sockaddr *restrict address,
       socklen_t *restrict address_len);


/**
 *  对文件描述符进行读操作（套接字也是一个文件描述符）如果是对TCP套接字进行读、时间上是从TCP传输控制层的接受缓存取数据、如果TCP传输控制层的接受缓存为空、则读函数read会阻塞
 *
 *  @param fildes 文件描述符
 *  @param buf    输出参数、带出读出的数据
 *  @param nbyte  buf的最大大小、用来防止内存越界
 *
 *  @return n 1、nbyte>= n >0 表示成功读取n个字节 2、n==0 表示数据已经读完（即遇到了文件结尾）3、n<0 表示读书失败
 */
ssize_t read(int fildes, void *buf, size_t nbyte);


/**
 *  对文件描述符进行写操作（套接字也是一个文件描述符）、如果是对TCP套接字进行写、实际上是把数据交给TCP传输控制层的发送缓存、如果TCP传输控制层的发送缓存已满、则写函数write会阻塞。
 *
 *  @param fildes 文件描述符
 *  @param buf    输出参数、输入的是我即将要写入文件的数据
 *  @param nbyte  是希望写入的字节数
 *
 *  @return n 1、nbyte>= n >=0、表示成功写入n个字节。2、n<0 表示写入失败
 */
ssize_t write(int fildes, const void *buf, size_t nbyte);


int main(int argc, const char * argv[])
{
    int listenSocketfd = -1;
    int ret = -1;
    
    listenSocketfd = socket(AF_INET, SOCK_STREAM, 0);
    if (listenSocketfd < 0)
    {
        perror("socket err");
        return 0;
    }
    
    NSLog(@"socketfd = %d", listenSocketfd);
    
    
    struct sockaddr_in severAddr;
    
    severAddr.sin_family = AF_INET;
    inet_pton(AF_INET, "127.0.0.1", &(severAddr.sin_addr));
    severAddr.sin_port = htons(8080);
    
    
    ret = bind(listenSocketfd, (struct sockaddr *)&severAddr, sizeof(severAddr));
    if (ret < 0)
    {
        perror("bind err");
        close(listenSocketfd);//关掉套接字
        return 0;
    }
    
    NSLog(@"bind end");
    
    getchar();
    
    ret = listen(listenSocketfd, 5);
    if (ret < 0)
    {
        perror("listen err");
        close(listenSocketfd);//关掉套接字
        return 0;
    }
    
    NSLog(@"listen end");
    
    struct sockaddr_in clientAddr;
    socklen_t clientAddrLen = sizeof(clientAddr);
    
    getchar();
    
    NSLog(@"accept 11");
    
    int connectSocketfd = accept(listenSocketfd, (struct sockaddr *)&clientAddr, &clientAddrLen);
    if (connectSocketfd < 0)
    {
        perror("accept err");
        close(listenSocketfd);//关掉套接字
        return 0;
    }
    
    NSLog(@"accept 22");
    
    char ipStr[50];
    inet_ntop(AF_INET, &(clientAddr.sin_addr), ipStr, sizeof(ipStr));
    NSLog(@"客户端的ip地址:%s, 客户端的端口:%d", ipStr, ntohs(clientAddr.sin_port));
    
    
    getchar();
    char recvBuf[1024];
    memset(recvBuf, 0, sizeof(recvBuf));
    NSLog(@"read 11");
    
    
    while (1)
    {
        ssize_t nbytes = read(connectSocketfd, recvBuf, sizeof(recvBuf));
        
        NSLog(@"read nbytes = %ld", nbytes);
        
        if (nbytes == 0)// 表示客户端已经关闭
        {
            break;
        }
        else if (nbytes < 0)//表示读取失败
        {
            break;
        }
    }

    
    close(listenSocketfd);
    close(connectSocketfd);

    
    return 0;
}

