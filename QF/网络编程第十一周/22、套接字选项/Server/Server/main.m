//
//  main.m
//  Server
//
//  Created by chen cheng on 14-5-28.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
//
//  main.m
//  Demo1
//
//  Created by chen cheng on 14-5-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

//#import <Foundation/Foundation.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <stdint.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <sys/select.h>
#include <stdint.h>

#import "SocketTool.h"

int main(int argc, const char * argv[])
{
    int listenSocketfd = -1;
    int connectSocketfd = -1;
    
    struct sockaddr_in clientAddr;
    socklen_t clientAddrLen;
    
    
    listenSocketfd = openListenSocket(2048);
    if (listenSocketfd < 0)
    {
        printf("openListenSocket err");
        return 0;
    }
    
    while (1)
    {
        clientAddrLen = sizeof(clientAddr);
        connectSocketfd = accept(listenSocketfd, (struct sockaddr *)&clientAddr, &clientAddrLen);
        if (connectSocketfd < 0)
        {
            perror("accept err");
            close(listenSocketfd);
            return 0;
        }
        char clientIp[50];
        inet_ntop(PF_INET, &(clientAddr.sin_addr.s_addr), clientIp, sizeof(clientIp));
        printf("clientIp = %s\n", clientIp);
        pthread_t tid;
        
    }
    
    close(listenSocketfd);
    
    return 0;
}
