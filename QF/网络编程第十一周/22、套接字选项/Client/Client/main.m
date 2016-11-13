//
//  main.m
//  Client
//
//  Created by chen cheng on 14-5-28.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <stdint.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <signal.h>
#import <pthread.h>

#include <sys/select.h>
#import "SocketTool.h"




int main(int argc, const char * argv[])
{

    int socketfd = openSocket("127.0.0.1", 2048);
    if (socketfd < 0)
    {
        printf("openSocket err");
        return 0;
    }
    getchar();
   
    close(socketfd);
    
    return 0;
}