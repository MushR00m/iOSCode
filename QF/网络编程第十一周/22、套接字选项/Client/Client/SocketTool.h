//
//  SocketTool.h
//  Server
//
//  Created by chen cheng on 14-5-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#ifndef Server_SocketTool_h
#define Server_SocketTool_h

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


int openSocket(const char *ip, uint16_t port);

int openListenSocket(uint16_t port);

ssize_t readN(int fildes, void *buf, size_t nbyte);

ssize_t readN_timeout(int fildes, void *buf, size_t nbyte, long sec);

ssize_t writeN(int fildes, const void *buf, size_t nbyte);

ssize_t writeN_timeout(int fildes, const void *buf, size_t nbyte, long sec);


ssize_t readLine(int fildes, void *buf, size_t nbyte);

ssize_t readLine_timeout(int fildes, void *buf, size_t nbyte, long sec);

#endif
