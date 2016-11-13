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
    char  recvBuf[1024];
    
    //循环的收到包头
    while (1)
    {
       ssize_t nbytes = readLine(connectSocketfd, recvBuf, sizeof(recvBuf));
        if (nbytes <= 0)
        {
            NSLog(@"收取失败");
            break;
        }
        else if(nbytes == 2)
        {
            NSLog(@"包头收取完成");
            break;
        }
        writeN(STDOUT_FILENO, recvBuf, nbytes);
    }
    
    
    //1、第一方法直接根据HTTP协议构造包
    //会一个http协议的应答包
  /*  NSMutableString  *http = [[NSMutableString alloc] init];
    
    NSString *html = @"<html><body><p>hello world</p><body></html>";
    
    [http appendString:@"HTTP/1.1 200 OK\r\n"];
    [http appendString:[NSString stringWithFormat:@"content-length: %ld\r\n", strlen([html UTF8String])]];
    
    [http appendString:@"\r\n"];
    [http appendString:html];
    
    
    writeN(connectSocketfd, [http UTF8String], strlen([http UTF8String]));
    
    close(connectSocketfd);*/
    
    
    //1、第一方法 使用 CFHTTPMessageRef
   CFHTTPMessageRef httpMessage = CFHTTPMessageCreateResponse(kCFAllocatorDefault, 200, CFSTR("OK"), CFSTR("HTTP/1.1"));//内存分配策略 一般使用默认的分配策略即可
    
    
    NSString *html = @"<html><body><p>hello world</p><body></html>";
    
    NSString   *contentLength = [NSString stringWithFormat:@"%ld", strlen([html UTF8String])];
    
    CFHTTPMessageSetHeaderFieldValue(httpMessage, CFSTR("content-length"), (CFStringRef)contentLength);
    
    NSData  *htmlData = [NSData dataWithBytes:[html UTF8String] length:strlen([html UTF8String])];
    
    CFHTTPMessageSetBody(httpMessage, (CFDataRef)htmlData);
    
    CFDataRef cfdata = CFHTTPMessageCopySerializedMessage(httpMessage);
    
    writeN(connectSocketfd, CFDataGetBytePtr(cfdata), CFDataGetLength(cfdata));
    
 
    
    NSString  *messageString = [[NSString alloc] initWithData:(NSData *)cfdata encoding:NSUTF8StringEncoding];
    
    //NSLog(@"CFDataGetLength(cfdata) = %d", CFDataGetLength(cfdata));
    
    NSLog(@"messageString = %@", messageString);
    
    close(connectSocketfd);
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

