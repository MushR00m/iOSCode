//
//  Packet.m
//  TCPClient
//
//  Created by chen cheng on 14-9-25.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "Packet.h"
#import "SocketTool.h"


void printPackt(const void *buf, size_t bufLen)
{
    for (int i=0; i<bufLen; i++)
    {
        printf("%02X  ", *((uint8_t *)buf + i));
    }
    printf("\n");
}


ssize_t recvPacket(int socketfd, void *buf, size_t bufLen, BOOL atomically)
{
    ssize_t offset = 0;
    ssize_t step = 0;
    ssize_t nbytes = 0;
    
    
    static NSLock  *lock = nil;
    
    if (atomically)
    {
        if (lock == nil)
        {
            lock = [[NSLock alloc] init];
        }
        
        [lock lock];
    }

    
    //收包头
    step = sizeof(ST_HEAD);
    if (offset + step > bufLen)
    {
        [lock unlock];
        return -1;
    }
    nbytes = readN(socketfd, buf+offset, step);
    if (nbytes < 0)
    {
        [lock unlock];
        return -1;
    }
    else if (nbytes == 0)
    {
        [lock unlock];
        return 0;
    }
    offset += step;
    
    ST_HEAD *head = (ST_HEAD *)buf;
    
    //收包体
    step = ntohl(head->length) - sizeof(ST_HEAD);
    if (offset + step > bufLen)
    {
        [lock unlock];
        return -1;
    }
    nbytes = readN(socketfd, buf+offset, step);
    if (nbytes < 0)
    {
        [lock unlock];
        return -1;
    }
    else if (nbytes == 0)
    {
        [lock unlock];
        return 0;
    }

    offset += step;
    

    [lock unlock];
    return offset;
}


ssize_t recvPacket_timeout(int socketfd, void *buf, size_t bufLen, BOOL atomically, long timeoutSec)
{
    ssize_t offset = 0;
    ssize_t step = 0;
    ssize_t nbytes = 0;
    
    
    static NSLock  *lock = nil;
    
    if (atomically)
    {
        if (lock == nil)
        {
            lock = [[NSLock alloc] init];
        }
        
        [lock lock];
    }
    
    
    //收包头
    step = sizeof(ST_HEAD);
    if (offset + step > bufLen)
    {
        [lock unlock];
        return -1;
    }
    time_t  time1 = time(NULL);
    
    nbytes = readN_timeout(socketfd, buf+offset, step, timeoutSec);
    
    time_t  time2 = time(NULL);
    
    timeoutSec = timeoutSec - (time2 - time1);
    
    if (nbytes != step)//收包头失败
    {
        [lock unlock];
        return -1;
    }
    offset += step;
    
    if (timeoutSec <= 0)//没有时间收包体了
    {
        return -1;
    }
    
    ST_HEAD *head = (ST_HEAD *)buf;
    
    //收包体
    step = ntohl(head->length) - sizeof(ST_HEAD);
    if (offset + step > bufLen)
    {
        [lock unlock];
        return -1;
    }
    nbytes = readN_timeout(socketfd, buf+offset, step, timeoutSec);
    if (nbytes != step)//收包体失败
    {
        [lock unlock];
        return -1;
    }
    
    offset += step;
    
    
    [lock unlock];
    return offset;
}


ssize_t sendPacket(int socketfd, const void *buf, size_t bufLen, BOOL atomically)
{
    static NSLock  *lock = nil;
    
    if (atomically)
    {
        if (lock == nil)
        {
            lock = [[NSLock alloc] init];
        }
        
        [lock lock];
    }
    
    ssize_t nbytes = writeN(socketfd, buf, bufLen);
    
    if (atomically)
    {
        [lock unlock];
    }

    return nbytes;
}


ssize_t sendPacket_timeout(int socketfd, const void *buf, size_t bufLen, BOOL atomically, long timeoutSec)
{
    static NSLock  *lock = nil;
    
    if (atomically)
    {
        if (lock == nil)
        {
            lock = [[NSLock alloc] init];
        }
        
        [lock lock];
    }
    
    ssize_t nbytes = writeN_timeout(socketfd, buf, bufLen, timeoutSec);
    
    if (atomically)
    {
        [lock unlock];
    }
    
    return nbytes;
}



#pragma mark 文件请求包得代码

ST_FILE_DOWNLOAD_REQUEST *init_file_download_request(ST_FILE_DOWNLOAD_REQUEST *fileDownloadRequest, char *fileName)
{
    size_t fileNameLen = strlen(fileName);
    fileDownloadRequest->type = PACKET_TYPE_FILE_DOWNLOAD_REQUEST;
    fileDownloadRequest->length = (uint32_t)(sizeof(fileDownloadRequest->type) + sizeof(fileDownloadRequest->length) + sizeof(fileDownloadRequest->fileNameLength) + fileNameLen);
    fileDownloadRequest->fileNameLength = (uint32_t)fileNameLen;
    fileDownloadRequest->fileName = malloc(fileNameLen);
    memcpy(fileDownloadRequest->fileName, fileName, fileNameLen);
    
    return fileDownloadRequest;
}

ssize_t encode_file_download_request(const ST_FILE_DOWNLOAD_REQUEST *fileDownloadRequest, void *buf, size_t bufLen)
{
    ssize_t offset = 0;
    ssize_t step = 0;
    
    
    //包得类型线性化到buf
    step = sizeof(fileDownloadRequest->type);
    if (offset + step > bufLen)
    {
        return -1;
    }
    memcpy(buf+offset, &(fileDownloadRequest->type), step);
    offset += step;
    
    
    step = sizeof(fileDownloadRequest->length);
    if (offset + step > bufLen)
    {
        return -1;
    }
    uint32_t length = htonl(fileDownloadRequest->length);
    memcpy(buf+offset, &length, step);
    offset += step;
    
    
    step = sizeof(fileDownloadRequest->fileNameLength);
    if (offset + step > bufLen)
    {
        return -1;
    }
    uint32_t fileNameLength = htonl(fileDownloadRequest->fileNameLength);
    memcpy(buf+offset, &fileNameLength, step);
    offset += step;
    
    
    step = fileDownloadRequest->fileNameLength;
    if (offset + step > bufLen)
    {
        return -1;
    }
    memcpy(buf+offset, fileDownloadRequest->fileName, step);
    offset += step;
    
    return offset;
}

ssize_t decode_file_download_request(ST_FILE_DOWNLOAD_REQUEST *fileDownloadRequest, const void *buf, size_t bufLen)
{
    ssize_t offset = 0;
    ssize_t step = 0;
    
    
    //包得类型线性化到buf
    step = sizeof(fileDownloadRequest->type);
    if (offset + step > bufLen)
    {
        return -1;
    }
    memcpy(&(fileDownloadRequest->type), buf+offset, step);
    offset += step;
    
    
    step = sizeof(fileDownloadRequest->length);
    if (offset + step > bufLen)
    {
        return -1;
    }
    memcpy(&(fileDownloadRequest->length), buf+offset, step);
    fileDownloadRequest->length = ntohl(fileDownloadRequest->length);
    offset += step;
    
    
    step = sizeof(fileDownloadRequest->fileNameLength);
    if (offset + step > bufLen)
    {
        return -1;
    }
    memcpy(&(fileDownloadRequest->fileNameLength), buf+offset, step);
    fileDownloadRequest->fileNameLength = ntohl(fileDownloadRequest->fileNameLength);
    offset += step;
    
    
    step = fileDownloadRequest->fileNameLength;
    if (offset + step > bufLen)
    {
        return -1;
    }
    fileDownloadRequest->fileName = malloc(fileDownloadRequest->fileNameLength);
    memcpy(fileDownloadRequest->fileName, buf+offset, step);
    offset += step;
    
    return offset;
}


int process_file_download_request(const ST_FILE_DOWNLOAD_REQUEST *fileDownloadRequest, int socketfd)
{
    //3、处理包
    NSString  *fileName = [[NSString alloc] initWithBytes:fileDownloadRequest->fileName length:(NSUInteger)(fileDownloadRequest->fileNameLength) encoding:NSUTF8StringEncoding];
    
    NSLog(@"客户端想要下载文件:%@", fileName);
    
    //如果允许下载 创建一个新的线程、发送应答包、文件信息包、文件数据包
    //如果不允许下载发送应答包
    
    return 0;
}

void dealloc_file_download_request(ST_FILE_DOWNLOAD_REQUEST *fileDownloadRequest)
{
    if (fileDownloadRequest->fileName != NULL)
    {
        free(fileDownloadRequest->fileName);
        fileDownloadRequest->fileName = NULL;
    }
}

#pragma mark 心跳包得代码

ST_HEART_BEAT  *init_heart_beat(ST_HEART_BEAT *heartBeat, uint32_t number)
{
    heartBeat->type = PACKET_TYPE_HEART_BEAT;
    heartBeat->length = sizeof(ST_HEART_BEAT);
    heartBeat->number = number;
    
    return heartBeat;
}

ssize_t encode_heart_beat(const ST_HEART_BEAT *heartBeat, void *buf, size_t bufLen)
{
    ssize_t offset = 0;
    ssize_t step = 0;
    
    
    //包得类型线性化到buf
    step = sizeof(heartBeat->type);
    if (offset + step > bufLen)
    {
        return -1;
    }
    memcpy(buf+offset, &(heartBeat->type), step);
    offset += step;
    
    
    step = sizeof(heartBeat->length);
    if (offset + step > bufLen)
    {
        return -1;
    }
    uint32_t length = htonl(heartBeat->length);
    memcpy(buf+offset, &length, step);
    offset += step;
    
    
    step = sizeof(heartBeat->number);
    if (offset + step > bufLen)
    {
        return -1;
    }
    uint32_t number = htonl(heartBeat->number);
    memcpy(buf+offset, &number, step);
    offset += step;

    return offset;
}



ssize_t decode_heart_beat(ST_HEART_BEAT *heartBeat, const void *buf, size_t bufLen)
{
    ssize_t offset = 0;
    ssize_t step = 0;
    
    
    //包得类型线性化到buf
    step = sizeof(heartBeat->type);
    if (offset + step > bufLen)
    {
        return -1;
    }
    memcpy(&(heartBeat->type), buf+offset, step);
    offset += step;
    
    
    step = sizeof(heartBeat->length);
    if (offset + step > bufLen)
    {
        return -1;
    }
    memcpy(&(heartBeat->length), buf+offset, step);
    heartBeat->length = ntohl(heartBeat->length);
    offset += step;
    
    
    step = sizeof(heartBeat->number);
    if (offset + step > bufLen)
    {
        return -1;
    }
    memcpy(&(heartBeat->number), buf+offset, step);
    heartBeat->number = ntohl(heartBeat->number);
    offset += step;
    
    return offset;
}

int process_heart_beat(const ST_HEART_BEAT *heartBeat, int socketfd)
{
    NSLog(@"收到客户端第%d次心跳", heartBeat->number);
    
    uint8_t sendBuf[50];
    ssize_t nbytes = encode_heart_beat(heartBeat, sendBuf, sizeof(sendBuf));
    
    ssize_t sendNbytes = sendPacket_timeout(socketfd, sendBuf, nbytes, YES, 10);
    if (sendNbytes != nbytes)//发包失败
    {
        [NSThread exit];
    }
    
    return 0;
}



