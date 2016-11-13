//
//  QFSocketTool.h
//  TCPClient
//
//  Created by chen cheng on 14-7-8.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QFSocketTool : NSObject


/**
 *  一定能从文件fildes中读取nbyte个字节的数据 除非两种情况 1、遇到文件结尾（如果是套接字文件结尾表示的是对方已经关闭）2、读取失败
 *
 *  @param fildes 文件描述符——套接字也是文件描述符
 *  @param buf    输出参数、存放从文件中读出数据
 *  @param nbyte  表示要读取的字节数
 *
 *  @return ret 1:ret == nbyte 表示成功读取ret个字节的数据2: 0 =< ret < nbyte 表示成功读取ret个字节的数据同时遇到文件结尾 3:ret == 0 表示遇到文件结尾 3:ret < 0表示读取失败
 */
+ (ssize_t)readNFromFile:(int)fildes buf:(void *)buf nbyte:(size_t)nbyte;

/**
 *  一定能从文件fildes中读取nbyte个字节的数据 除非两种情况 1、遇到文件结尾（如果是套接字文件结尾表示的是对方已经关闭）2、超时 3、读取失败
 *
 *  @param fildes 文件描述符——套接字也是文件描述符
 *  @param buf    输出参数、存放从文件中读出数据
 *  @param nbyte  表示要读取的字节数
 *  @param sec    最大超时时间(单位为秒)
 *
 *  @return ret 1:ret == nbyte 表示成功读取ret个字节的数据2: 0 =< ret < nbyte 表示成功读取ret个字节的数据同时遇到文件结尾 3:ret == 0 表示遇到文件结尾 3:ret < 0表示读取失败
 */
+ (ssize_t)readNFromFile:(int)fildes buf:(void *)buf nbyte:(size_t)nbyte timeout:(unsigned int)sec;


/**
 *  一定能往文件fildes写如nbyte个字节的数据 除非写入失败
 *
 *  @param fildes 文件描述符——套接字也是文件描述符
 *  @param buf    输入参数、buf存放的时即将要写入文件的数据
 *  @param nbyte  表示要写入的字节数
 *
 *  @return ret 1:ret == nbyte 表示成功写入ret个字节的数据到文件中 2:ret < 0 表示写入失败
 */
+ (ssize_t)writeNToFile:(int)fildes buf:(const void *)buf nbyte:(size_t)nbyte;

/**
 *  一定能往文件fildes写如nbyte个字节的数据 除非两种情况 1 超时  2  写入失败
 *
 *  @param fildes 文件描述符——套接字也是文件描述符
 *  @param buf    输入参数、buf存放的时即将要写入文件的数据
 *  @param nbyte  表示要写入的字节数
 *
 *  @return ret 1:ret == nbyte 表示成功写入ret个字节的数据到文件中 2:ret < 0 表示写入失败
 */
+ (ssize_t)writeNToFile:(int)fildes buf:(const void *)buf nbyte:(size_t)nbyte timeout:(unsigned int)sec;

/**
 *  一定能从文件fildes中读取一行的数据 除非三种情况 1、遇到文件结尾（如果是套接字文件结尾表示的是对方已经关闭）2、buf容量太小 3、读取失败
 *
 *  @param fildes 文件描述符——套接字也是文件描述符
 *  @param buf    输出参数、存放从文件中读出数据
 *  @param nbyte  是为了防止内存越界的、它一般代表buf的最大大小
 *
 *  @return ret 1:ret > 0 表示成功读取ret个字节的数据(ret <= nbyte) 2:ret == 0 表示遇到文件结尾 3:ret < 0表示读取失败
 */
+ (ssize_t)readLineFromFile:(int)fildes buf:(void *)buf nbyte:(size_t)nbyte;



@end
