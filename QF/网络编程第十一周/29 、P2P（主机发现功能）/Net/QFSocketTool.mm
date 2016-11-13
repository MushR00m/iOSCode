//
//  QFSocketTool.m
//  TCPClient
//
//  Created by chen cheng on 14-7-8.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFSocketTool.h"

@implementation QFSocketTool

/**
 *  一定能从文件fildes中读取nbyte个字节的数据 除非两种情况 1、遇到文件结尾（如果是套接字文件结尾表示的是对方已经关闭）2、读取失败
 *
 *  @param fildes 文件描述符——套接字也是文件描述符
 *  @param buf    输出参数、存放从文件中读出数据
 *  @param nbyte  表示要读取的字节数
 *
 *  @return ret 1:ret == nbyte 表示成功读取ret个字节的数据2: 0 =< ret < nbyte 表示成功读取ret个字节的数据同时遇到文件结尾 3:ret == 0 表示遇到文件结尾 3:ret < 0表示读取失败
 */
+ (ssize_t)readNFromFile:(int)fildes buf:(void *)buf nbyte:(size_t)nbyte
{
    ssize_t offset = 0;
    ssize_t ret = 0;
    
    while (nbyte - offset > 0)
    {
        ret = read(fildes, (unsigned char *)buf + offset, nbyte - offset);
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
 *  一定能从文件fildes中读取nbyte个字节的数据 除非两种情况 1、遇到文件结尾（如果是套接字文件结尾表示的是对方已经关闭）2、超时 3、读取失败
 *
 *  @param fildes 文件描述符——套接字也是文件描述符
 *  @param buf    输出参数、存放从文件中读出数据
 *  @param nbyte  表示要读取的字节数
 *  @param sec    最大超时时间(单位为秒)
 *
 *  @return ret 1:ret == nbyte 表示成功读取ret个字节的数据2: 0 =< ret < nbyte 表示成功读取ret个字节的数据同时遇到文件结尾 3:ret == 0 表示遇到文件结尾 3:ret < 0表示读取失败
 */
+ (ssize_t)readNFromFile:(int)fildes buf:(void *)buf nbyte:(size_t)nbyte timeout:(unsigned int)sec
{
    ssize_t offset = 0;
    ssize_t ret = 0;
    
    fd_set readFdSet;
    
    struct timeval timeOut;
    
    time_t  time1 = 0;
    time_t  time2 = 0;
    
    while (nbyte - offset > 0
           && sec > 0)
    {
        FD_ZERO(&readFdSet);
        FD_SET(fildes, &readFdSet);
        
        timeOut.tv_sec = sec;
        timeOut.tv_usec = 0;
        
        time1 = time(NULL);
        ret = select(fildes + 1, &readFdSet, NULL, NULL, &timeOut);
        if (ret <= 0)
        {
            return -1;
        }
        
        time2 = time(NULL);
        
        sec = (unsigned int)(sec - (time2 - time1));
        
        ret = read(fildes, (unsigned char *)buf + offset, nbyte - offset);
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
 *  一定能往文件fildes写如nbyte个字节的数据 除非写入失败
 *
 *  @param fildes 文件描述符——套接字也是文件描述符
 *  @param buf    输入参数、buf存放的时即将要写入文件的数据
 *  @param nbyte  表示要写入的字节数
 *
 *  @return ret 1:ret == nbyte 表示成功写入ret个字节的数据到文件中 2:ret < 0 表示写入失败
 */
+ (ssize_t)writeNToFile:(int)fildes buf:(const void *)buf nbyte:(size_t)nbyte
{
    ssize_t offset = 0;
    ssize_t ret = 0;
    
    while (nbyte - offset > 0)
    {
        ret = write(fildes, (unsigned char *)buf + offset, nbyte - offset);
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
 *  一定能往文件fildes写如nbyte个字节的数据 除非两种情况 1 超时  2  写入失败
 *
 *  @param fildes 文件描述符——套接字也是文件描述符
 *  @param buf    输入参数、buf存放的时即将要写入文件的数据
 *  @param nbyte  表示要写入的字节数
 *
 *  @return ret 1:ret == nbyte 表示成功写入ret个字节的数据到文件中 2:ret < 0 表示写入失败
 */
+ (ssize_t)writeNToFile:(int)fildes buf:(const void *)buf nbyte:(size_t)nbyte timeout:(unsigned int)sec
{
    ssize_t offset = 0;
    ssize_t ret = 0;
    
    fd_set writeFdSet;
    
    struct timeval timeOut;
    
    time_t  time1 = 0;
    time_t  time2 = 0;
    
    while (nbyte - offset > 0
           && sec > 0)
    {
        FD_ZERO(&writeFdSet);
        FD_SET(fildes, &writeFdSet);
        
        timeOut.tv_sec = sec;
        timeOut.tv_usec = 0;
        
        time1 = time(NULL);
        
        ret = select(fildes + 1, NULL, &writeFdSet, NULL, &timeOut);
        if (ret <= 0)
        {
            return -1;
        }
        
        time2 = time(NULL);
        
        sec = (unsigned int)(sec - (time2 - time1));
        
        ret = write(fildes, (unsigned char *)buf + offset, nbyte - offset);
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
 *  一定能从文件fildes中读取一行的数据 除非三种情况 1、遇到文件结尾（如果是套接字文件结尾表示的是对方已经关闭）2、buf容量太小 3、读取失败
 *
 *  @param fildes 文件描述符——套接字也是文件描述符
 *  @param buf    输出参数、存放从文件中读出数据
 *  @param nbyte  是为了防止内存越界的、它一般代表buf的最大大小
 *
 *  @return ret 1:ret > 0 表示成功读取ret个字节的数据(ret <= nbyte) 2:ret == 0 表示遇到文件结尾 3:ret < 0表示读取失败
 */

+ (ssize_t)readLineFromFile:(int)fildes buf:(void *)buf nbyte:(size_t)nbyte
{
    ssize_t offset = 0;
    ssize_t ret = 0;
    
    while (nbyte - offset > 0)
    {
        ret = read(fildes, (unsigned char *)buf + offset, 1);
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
            
            if (*((char *)((unsigned char *)buf + offset - 1)) == '\n')
            {
                break;
            }
        }
    }
    
    return offset;
}

@end
