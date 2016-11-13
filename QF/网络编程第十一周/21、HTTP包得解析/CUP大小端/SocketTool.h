//
//  SocketTool.h
//  TCPServer
//
//  Created by chen cheng on 14-9-24.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>



/**
 *  创建一个监听套接字
 *
 *  @param port  服务端的端口
 *
 *  @return 大于等于表示创建成功、否则失败。
 */
int openListenSocket(uint16_t port);



/**
 *  打开一个连接服务器的客户端的TCP套接字
 *
 *  @param hostName 服务端的域名
 *  @param port  服务端的端口
 *
 *  @return 大于等于表示创建成功、否则失败。
 */
int openClientSocket(char *hostName, uint16_t port);


/**
 *  该函数一定能够读出nbyte字节的数据、除非两种情况：1、读取失败。2、遇到文件结尾。
 *
 *  @param fildes 文件描述符
 *  @param buf    输出参数——带出读出的数据
 *  @param nbyte  指定要多多少个字节
 *
 *  @return n 1、nbyte = n 表示成功读取nbyte个字节 2、nbyte>n>=0 表示成功读取nbyte个字节、同时遇到了文件结尾 3、n<0 表示读书失败
 */
ssize_t readN(int fildes, void *buf, size_t nbyte);



/**
 *  该函数一定能够读出nbyte字节的数据、除非三种情况：1、读取时出现错误。2、遇到文件结尾。3、超时。
 *
 *  @param fildes 文件描述符
 *  @param buf    输出参数——带出读出的数据
 *  @param nbyte  指定要多多少个字节
 *  @param timeoutSec  超时时间
 *
 *  @return n 1、nbyte = n 表示成功读取nbyte个字节 2、nbyte>n>=0 表示成功读取nbyte个字节、同时遇到了文件结尾 3、n<0 表示读书失败
 */
ssize_t readN_timeout(int fildes, void *buf, size_t nbyte,  long timeoutSec);


/**
 *  该函数一定能够读出一行数据、除非两种情况：1、出现错误。 2、遇到文件结尾。3、buf的容量不够大、装不下一行数据。
 *
 *  @param fildes 文件描述符
 *  @param buf    输出参数——带出读出数据
 *  @param nbyte  指定了buf得最大大小。
 *
 *  @return 1、nbyte>= n >=0、表示成功写入n个字节。2、n<0 表示写入失败
 */
ssize_t readLine(int fildes, void *buf, size_t nbyte);


/**
 *  该函数一定能够写入nbyte字节的数据。除非一种情况：写入时出现错误。
 *
 *  @param fildes 文件描述符
 *  @param buf    输入参数——即将要写入的数据
 *  @param nbyte  指定要写入的字节数。
 *
 *  @return 1、nbyte>= n >=0、表示成功写入n个字节。2、n<0 表示写入失败
 */
ssize_t writeN(int fildes, const void *buf, size_t nbyte);


/**
 *  该函数一定能够写入nbyte字节的数据。除非两种种情况：1、写入时出现错误。2、超时
 *
 *  @param fildes 文件描述符
 *  @param buf    输入参数——即将要写入的数据
 *  @param nbyte  指定要写入的字节数。
 *  @param timeoutSec  超时时间
 *
 *  @return 1、nbyte>= n >=0、表示成功写入n个字节。2、n<0 表示写入失败
 */
ssize_t writeN_timeout(int fildes, const void *buf, size_t nbyte, long timeoutSec);




