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


ssize_t sendto(int socket, const void *buffer, size_t length, int flags, const struct sockaddr *dest_addr, socklen_t dest_len);


int main(int argc, const char * argv[])
{
    int socketfd = -1;
    
    ssize_t ret = -1;
    
    struct sockaddr_in serverAddr;
    serverAddr.sin_family = AF_INET;
    serverAddr.sin_port = htons(2048);
    inet_pton(AF_INET, "127.0.0.1", &(serverAddr.sin_addr.s_addr));
    
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
        
        ret = sendto(socketfd, sendBuf, strlen(sendBuf), 0, (struct sockaddr *)&serverAddr, sizeof(serverAddr));
        if (ret <= 0)
        {
            break;
        }
        
        ret = recvfrom(socketfd, recvBuf, sizeof(recvBuf), 0, NULL, NULL);
        if (ret <= 0)
        {
            break;
        }

        write(1, recvBuf, ret);
    }

    close(socketfd);
    
    return 0;
}

