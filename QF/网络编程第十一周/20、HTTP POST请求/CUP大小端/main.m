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



int main(int argc, const char * argv[])
{
    //1、直接使用套接字发送http协议的请求包
    //http://iappfree.candou.com:8080/free/applications/limited?page=%d&number=%d
    /*int socketfd = openClientSocket("127.0.0.1", 80);
    
    NSLog(@"socketfd = %d", socketfd);
    
    
    NSString  *bodyString = @"RumpusDestURL=&RumpusLoginUserName=stu&RumpusLoginPassword=1234";
    
    
    NSMutableString  *httpRequestpacket = [[NSMutableString alloc] init];
    
    [httpRequestpacket appendString:@"POST /Rumpus.clogin HTTP/1.1\r\n"];
    
    [httpRequestpacket appendString:@"Host: 127.0.0.1\r\n"];
    [httpRequestpacket appendString:@"Cache-Control: max-age=0\r\n"];
    
    [httpRequestpacket appendString:[NSString stringWithFormat:@"Content-Length: %ld\r\n", strlen([bodyString UTF8String])]];
    
    [httpRequestpacket appendString:@"\r\n"];
    
    
    [httpRequestpacket appendString:bodyString];
    
    writeN(socketfd, [httpRequestpacket UTF8String], strlen([httpRequestpacket UTF8String]));
    
    char recvBuf[1024];
    while (1)
    {
        ssize_t nbytes = read(socketfd, recvBuf, sizeof(recvBuf));
        if (nbytes <= 0)
        {
            break;
        }
        
        writeN(STDOUT_FILENO, recvBuf, nbytes);
    }*/
    
    
    NSMutableURLRequest  *mutableURLRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://127.0.0.1/Rumpus.clogin"]];

    [mutableURLRequest setHTTPMethod:@"POST"];
    
    
    NSString  *bodyString = @"RumpusDestURL=&RumpusLoginUserName=stu&RumpusLoginPassword=1234";
    
    NSData *bodyData = [[NSData alloc] initWithBytes:[bodyString UTF8String] length:strlen([bodyString UTF8String])];
    
    [mutableURLRequest setHTTPBody:bodyData];
    
    
    NSURLResponse  *response = nil;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:mutableURLRequest returningResponse:&response error:&error];
    
    NSLog(@"response = %@", response);
    
    
    NSString  *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"html = %@", html);
    
    
    
    return 0;
}

