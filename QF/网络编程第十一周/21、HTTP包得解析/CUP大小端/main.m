//
//  main.m
//  CUP大小端
//
//  Created by chen cheng on 14-9-23.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#import "SocketTool.h"


void clientThreadMain(int connectSocketfd)
{
    uint8_t  recvBuf[1024];
    
    
    CFHTTPMessageRef  httpMessageRequest =  CFHTTPMessageCreateEmpty(kCFAllocatorDefault, YES);
    
    //收包  1、 先收包头
    while (1)
    {
       ssize_t nbytes = readLine(connectSocketfd, recvBuf, sizeof(recvBuf));
        if (nbytes < 0)
        {
            NSLog(@"收取失败");
            return;
        }
        else if (nbytes == 0)
        {
            NSLog(@"成功收到一个包");
            break;
        }
        
        
        CFHTTPMessageAppendBytes(httpMessageRequest, recvBuf, nbytes);
        
        //包头收完
        if (CFHTTPMessageIsHeaderComplete(httpMessageRequest))
        {
            break;
        }
    }
    
    //查看包体的大小
    //取得包头信息
    NSDictionary  *headerFieldsDictionary = (NSDictionary *)CFHTTPMessageCopyAllHeaderFields(httpMessageRequest);
    
    NSString *contentLength = [headerFieldsDictionary valueForKey:@"Content-Length"];
    
    NSLog(@"首部 = %@", headerFieldsDictionary);
    
    NSLog(@"[contentLength intValue] = %d", [contentLength intValue]);
    
    
    //收包  1、 先收包体
    ssize_t nbytes = readN(connectSocketfd, recvBuf, [contentLength intValue]);
    
    NSLog(@"收包体 nbytes = %ld", nbytes);
    
    CFHTTPMessageAppendBytes(httpMessageRequest, recvBuf, [contentLength intValue]);
    
    
    //解析HTTP请求包
    
    //获得请求的方法
    NSString *requestMethod = (NSString *)CFHTTPMessageCopyRequestMethod(httpMessageRequest);
    
    NSLog(@"方法 = %@", requestMethod);
    
    NSURL *url = (NSURL *)CFHTTPMessageCopyRequestURL(httpMessageRequest);
    
    NSLog(@"路径 = %@", url);
    
    
    NSString *httpVersion = (NSString *)CFHTTPMessageCopyVersion(httpMessageRequest);
    
    NSLog(@"版本号 = %@", httpVersion);
    
    
    NSData *bodyData = (NSData *)CFHTTPMessageCopyBody(httpMessageRequest);
    
    NSLog(@"包体:%@", bodyData);
    
    
}


int main(int argc, const char * argv[])
{
    int  listenSocketfd = -1;
    
    
    listenSocketfd = openListenSocket(8080);
    
    NSLog(@"listenSocketfd = %d", listenSocketfd);
    
    
    while (1)
    {
        int connectSocketfd = accept(listenSocketfd, NULL, NULL);
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            clientThreadMain(connectSocketfd);
            
        });
    }
    
    
    return 0;
}

