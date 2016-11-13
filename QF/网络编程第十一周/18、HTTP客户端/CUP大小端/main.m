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
    /*int socketfd = openClientSocket("iappfree.candou.com", 8080);
    
    NSLog(@"socketfd = %d", socketfd);
    
    
    NSMutableString  *httpRequestpacket = [[NSMutableString alloc] init];
    
    [httpRequestpacket appendString:@"GET /free/applications/limited?page=1&number=1 HTTP/1.1\r\n"];
    [httpRequestpacket appendString:@"Host: iappfree.candou.com\r\n"];
    [httpRequestpacket appendString:@"\r\n"];
    
    
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
    
    
    NSURLRequest   *urlRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    
    
    NSURLResponse  *response = nil;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    
    NSLog(@"response = %@", response);
    
    
    NSString  *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"html = %@", html);
    
    
    
    return 0;
}

