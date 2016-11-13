//
//  SocketTool.c
//  Server
//
//  Created by chen cheng on 14-5-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#include <stdio.h>
#import "SocketTool.h"

int openSocket(const char *ip, uint16_t port)
{
    int socketfd = -1;
    ssize_t ret = -1;
    
    struct sockaddr_in serverAddr;
    
    serverAddr.sin_family = PF_INET;
    serverAddr.sin_port = htons(port) ;
    inet_pton(PF_INET, ip, &(serverAddr.sin_addr.s_addr));
    
    socketfd = socket(PF_INET, SOCK_STREAM, 0);
    if (socketfd < 0)
    {
        perror("socket err");
        return -1;
    }
    printf("socketfd = %d\n", socketfd);
    
    ret = connect(socketfd, (struct sockaddr *)&serverAddr, sizeof(serverAddr));
    if (ret < 0)
    {
        perror("connect err");
        close(socketfd);
        return -1;
    }

    return socketfd;
}

int openListenSocket(uint16_t port)
{
    int listenSocketfd = -1;
    ssize_t ret = -1;
    
    struct sockaddr_in serverAddr;
    
    serverAddr.sin_family = PF_INET;
    serverAddr.sin_port = htons(port);
    serverAddr.sin_addr.s_addr = INADDR_ANY;
    
    
    listenSocketfd = socket(PF_INET, SOCK_STREAM, 0);
    if (listenSocketfd < 0)
    {
        perror("socket err");
        return -1;
    }
    
    
    ret = bind(listenSocketfd, (struct sockaddr *)&serverAddr, sizeof(serverAddr));
    if (ret < 0)
    {
        perror("bind err");
        close(listenSocketfd);
        return -1;
    }
    
    
    ret = listen(listenSocketfd, 5);
    if (ret < 0)
    {
        perror("listen err");
        close(listenSocketfd);
        return -1;
    }
    
    return listenSocketfd;
}


ssize_t readN(int fildes, void *buf, size_t nbyte)
{
    int     offset = 0;
    ssize_t ret = -1;
    
    while ((nbyte-offset) > 0)
    {
        ret = read(fildes, buf + offset, nbyte-offset);
        if (ret > 0)
        {
            offset += ret;
        }
        else if (ret == 0)
        {
            return offset;
        }
        else
        {
            return -1;
        }
    }
    
    return offset;
}

ssize_t readN_timeout(int fildes, void *buf, size_t nbyte, long sec)
{
    fd_set readFdSet;
    
    int     offset = 0;
    ssize_t ret = -1;
    
    struct timeval timeout;
    
    time_t time1 = time(NULL);
    time_t time2 = time1;
    time_t sumTime = 0;
    
    while ((nbyte-offset) > 0)
    {
        FD_ZERO(&readFdSet);
        FD_SET(fildes, &readFdSet);
        
        if (sec - sumTime <= 0)
        {
            break;
        }
        
        timeout.tv_sec = sec - sumTime;
        timeout.tv_usec = 0;
        
        time1 = time(NULL);
        ret = select(fildes+1, &readFdSet, NULL, NULL, &timeout);
        time2 = time(NULL);
        
        sumTime += (time2 - time1);
        
        if (ret == 1)
        {
            ret = read(fildes, buf + offset, nbyte-offset);
            if (ret > 0)
            {
                offset += ret;
            }
            else if (ret == 0)
            {
                break;
            }
            else
            {
                return -1;
            }
        }
        else
        {
            return -1;
        }
    }
    
    return offset;
}

ssize_t writeN(int fildes, const void *buf, size_t nbyte)
{
    int     offset = 0;
    ssize_t ret = -1;
    
    
    while ((nbyte - offset) > 0)
    {
        ret = write(fildes, buf + offset, nbyte - offset);
        if (ret < 0)
        {
            return -1;
        }
        
        offset += ret;
    }
    
    return offset;
}

ssize_t writeN_timeout(int fildes, const void *buf, size_t nbyte, long sec)
{
    fd_set writeFdSet;
    
    int     offset = 0;
    ssize_t ret = -1;
    
    struct timeval timeout;
    
    time_t time1 = time(NULL);
    time_t time2 = time1;
    time_t sumTime = 0;
    
    while ((nbyte-offset) > 0)
    {
        FD_ZERO(&writeFdSet);
        FD_SET(fildes, &writeFdSet);
        
        if (sec - sumTime <= 0)
        {
            break;
        }
        
        timeout.tv_sec = sec - sumTime;
        timeout.tv_usec = 0;
        
        time1 = time(NULL);
        ret = select(fildes+1, NULL, &writeFdSet, NULL, &timeout);
        time2 = time(NULL);
        
        sumTime += (time2 - time1);
        
        if (ret == 1)
        {
            ret = write(fildes, buf + offset, nbyte - offset);
            if (ret < 0)
            {
                return -1;
            }
            offset += ret;
        }
        else
        {
            return -1;
        }
    }
    
    return offset;
}


ssize_t readLine(int fildes, void *buf, size_t nbyte)
{
    int     offset = 0;
    ssize_t ret = -1;
    
    while ((nbyte-offset) > 0)
    {
        ret = read(fildes, buf + offset, 1);
        if (ret == 1)
        {
            offset++;
            char ch = *((char *)(buf + offset - 1));
            if (ch == '\n')
            {
                return offset;
            }
        }
        else if (ret == 0)
        {
            return offset;
        }
        else
        {
            return -1;
        }
    }
    
    return offset;
}

ssize_t readLine_timeout(int fildes, void *buf, size_t nbyte, long sec)
{
    fd_set readFdSet;
    
    int     offset = 0;
    ssize_t ret = -1;
    
    struct timeval timeout;
    
    time_t time1 = time(NULL);
    time_t time2 = time1;
    time_t sumTime = 0;
    
    while ((nbyte-offset) > 0)
    {
        FD_ZERO(&readFdSet);
        FD_SET(fildes, &readFdSet);
        
        if (sec - sumTime <= 0)
        {
            break;
        }
        
        timeout.tv_sec = sec - sumTime;
        timeout.tv_usec = 0;
        
        time1 = time(NULL);
        ret = select(fildes+1, &readFdSet, NULL, NULL, &timeout);
        time2 = time(NULL);
        
        sumTime += (time2 - time1);
        
        if (ret == 1)
        {
            ret = read(fildes, buf + offset, 1);
            if (ret == 1)
            {
                offset++;
                char ch = *((char *)(buf + offset - 1));
                if (ch == '\n')
                {
                    return offset;
                }
            }
            else if (ret == 0)
            {
                return offset;
            }
            else
            {
                return -1;
            }
        }
        else
        {
            return -1;
        }
    }
    
    return offset;
}
