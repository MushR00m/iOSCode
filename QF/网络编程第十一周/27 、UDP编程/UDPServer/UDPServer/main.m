//
//  main.m
//  UDPServer
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
    
    ssize_t ret;
    
    struct sockaddr_in serverAddr;
    serverAddr.sin_family = AF_INET;
    serverAddr.sin_port = htons(2048);
    serverAddr.sin_addr.s_addr = htonl(INADDR_ANY);
    
    

    socketfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (socketfd < 0)
    {
        perror("socket err");
        return 0;
    }
    
    
    ret = bind(socketfd, (struct sockaddr *)&serverAddr, sizeof(serverAddr));
    if (ret < 0)
    {
        perror("bind err");
        close(socketfd);
        return 0;
    }
    
    
    
    char recBuf[100];
    
    struct sockaddr_in clientAddr;
    socklen_t clientAddrLen;
    
    while (1)
    {
        clientAddrLen = sizeof(clientAddr);
        ret = recvfrom(socketfd, recBuf, sizeof(recBuf), 0, (struct sockaddr *)&clientAddr, &clientAddrLen);
        if (ret < 0)
        {
            continue;
        }
        char   clientIp[50];
        inet_ntop(AF_INET, &(clientAddr.sin_addr.s_addr), clientIp, sizeof(clientIp));
        NSLog(@"clientIp = %s clientPort = %d", clientIp, ntohs(clientAddr.sin_port));
        sendto(socketfd, recBuf, ret, 0, (struct sockaddr *)&clientAddr, clientAddrLen);
    }

    close(socketfd);
    
    return 0;
}


