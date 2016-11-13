//
//  main.m
//  demo
//
//  Created by chen cheng on 14-6-6.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sys/socket.h>
#import <netinet/in.h>
#include <arpa/inet.h>


int main(int argc, const char * argv[])
{
    int socketfd = -1;
    
    ssize_t ret = -1;
    
    struct sockaddr_in serverAddr;
    serverAddr.sin_family = AF_INET;
    serverAddr.sin_port = htons(2048);
    inet_pton(AF_INET, "239.215.235.245", &(serverAddr.sin_addr.s_addr));
    
    socketfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (socketfd < 0)
    {
        perror("socket err");
        return 0;
    }
    
    
    char sendBuf[1024];
    char recvBuf[1024];
    
    while (1)
    {
        memset(sendBuf, 0, sizeof(sendBuf));
        ret = read(0, sendBuf, sizeof(sendBuf));
        if (ret <= 0)
        {
            break;
        }
        
        ret = sendto(socketfd, sendBuf, ret, 0, (struct sockaddr *)&serverAddr, sizeof(serverAddr));
        NSLog(@"sendto ret = %lu", ret);
        if (ret <= 0)
        {
            perror("sendto err");
            break;
        }
        
        ret = recvfrom(socketfd, recvBuf, sizeof(recvBuf), 0, NULL, NULL);
        NSLog(@"recvfrom ret = %lu", ret);
        if (ret <= 0)
        {
            break;
        }

        write(1, recvBuf, ret);
    }

    close(socketfd);
    
    return 0;
}

