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


ssize_t recvPacket(int socketfd, void *buf, size_t bufLen)
{
    ssize_t offset = 0;
    ssize_t step = 0;
    ssize_t nbytes = 0;
    
    //收包头
    step = sizeof(ST_HEAD);
    if (offset + step > bufLen)
    {
        return -1;
    }
    nbytes = readN(socketfd, buf+offset, step);
    if (nbytes < 0)
    {
        return -1;
    }
    else if (nbytes == 0)
    {
        return 0;
    }
    offset += step;
    
    ST_HEAD *head = (ST_HEAD *)buf;
    
    //收包体
    step = ntohl(head->length) - sizeof(ST_HEAD);
    if (offset + step > bufLen)
    {
        return -1;
    }
    nbytes = readN(socketfd, buf+offset, step);
    if (nbytes < 0)
    {
        return -1;
    }
    else if (nbytes == 0)
    {
        return 0;
    }

    offset += step;
    

    return offset;
}

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

void dealloc_file_download_request(ST_FILE_DOWNLOAD_REQUEST *fileDownloadRequest)
{
    if (fileDownloadRequest->fileName != NULL)
    {
        free(fileDownloadRequest->fileName);
        fileDownloadRequest->fileName = NULL;
    }
}
