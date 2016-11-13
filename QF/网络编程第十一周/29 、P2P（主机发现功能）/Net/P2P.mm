//
//  P2P.mm
//  P2P
//
//  Created by chen cheng on 14-07-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#include <stdio.h>
#include <arpa/inet.h>

#import "P2P.h"


int en_scanning(const ST_SCANNING *scanning, void *buf, int *bufLen)
{
    int step = 0;
    int offset = 0;
    
    
    uint8_t *out_buf = (uint8_t *)buf;
    
    step = sizeof(scanning->type);
    if (offset + step > *bufLen)
    {
        return -1;
    }
    memcpy(out_buf + offset, &(scanning->type), step);
    offset += step;
    
    
    step = sizeof(scanning->len);
    if (offset + step > *bufLen)
    {
        return -1;
    }
    uint32_t len = htonl(scanning->len);
    memcpy(out_buf + offset, &(len), step);
    offset += step;
    
    *bufLen = offset;
    
    return 0;
}

int de_scanning(ST_SCANNING *scanning, const void *buf, int bufLen)
{
    int step = 0;
    int offset = 0;
    
    const uint8_t *in_buf = (const uint8_t *)buf;
    
    step = sizeof(scanning->type);
    if (offset + step > bufLen)
    {
        return -1;
    }
    memcpy(&(scanning->type), in_buf + offset, step);
    offset += step;
    
    
    step = sizeof(scanning->len);
    if (offset + step > bufLen)
    {
        return -1;
    }
    uint32_t len;
    memcpy(&(len), in_buf + offset, step);
    scanning->len = ntohl(len);
    offset += step;
    
    return 0;
}



int en_scanning_ack(const ST_SCANNING_ACK *scanningAck, void *buf, int *bufLen)
{
    int step = 0;
    int offset = 0;
    
    
    uint8_t *out_buf = (uint8_t *)buf;
    
    step = sizeof(scanningAck->type);
    if (offset + step > *bufLen)
    {
        return -1;
    }
    memcpy(out_buf + offset, &(scanningAck->type), step);
    offset += step;
    
    
    step = sizeof(scanningAck->len);
    if (offset + step > *bufLen)
    {
        return -2;
    }
    uint32_t len = htonl(scanningAck->len);
    memcpy(out_buf + offset, &(len), step);
    offset += step;
    
    
    step = sizeof(scanningAck->deviceType);
    if (offset + step > *bufLen)
    {
        return -3;
    }
    memcpy(out_buf + offset, &(scanningAck->deviceType), step);
    offset += step;
    
    step = sizeof(scanningAck->tcpServerPort);
    if (offset + step > *bufLen)
    {
        return -4;
    }
    uint16_t tcpServerPort = htons(scanningAck->tcpServerPort);
    memcpy(out_buf + offset, &(tcpServerPort), step);
    offset += step;


    
    
    step = sizeof(scanningAck->hostNameLen);
    if (offset + step > *bufLen)
    {
        return -4;
    }
    uint16_t hostNameLen = htons(scanningAck->hostNameLen);
    memcpy(out_buf + offset, &(hostNameLen), step);
    offset += step;
    
    
    step = scanningAck->hostNameLen;
    if (offset + step > *bufLen)
    {
        return -5;
    }
    memcpy(out_buf + offset, scanningAck->hostName, step);
    offset += step;

    *bufLen = offset;
    
    return 0;
}

int de_scanning_ack(ST_SCANNING_ACK *scanningAck, const void *buf, int bufLen)
{
    int step = 0;
    int offset = 0;
    
    const uint8_t *in_buf = (const uint8_t *)buf;
    
    step = sizeof(scanningAck->type);
    if (offset + step > bufLen)
    {
        return -1;
    }
    memcpy(&(scanningAck->type), in_buf + offset, step);
    offset += step;
    
    
    step = sizeof(scanningAck->len);
    if (offset + step > bufLen)
    {
        return -1;
    }
    uint32_t len;
    memcpy(&(len), in_buf + offset, step);
    scanningAck->len = ntohl(len);
    offset += step;
    
    step = sizeof(scanningAck->deviceType);
    if (offset + step > bufLen)
    {
        return -1;
    }
    memcpy(&(scanningAck->deviceType), in_buf + offset, step);
    offset += step;
    
    step = sizeof(scanningAck->tcpServerPort);
    if (offset + step > bufLen)
    {
        return -1;
    }
    uint16_t tcpServerPort;
    memcpy(&(tcpServerPort), in_buf + offset, step);
    scanningAck->tcpServerPort = ntohs(tcpServerPort);
    offset += step;


    step = sizeof(scanningAck->hostNameLen);
    if (offset + step > bufLen)
    {
        return -1;
    }
    uint16_t hostNameLen;
    memcpy(&(hostNameLen), in_buf + offset, step);
    scanningAck->hostNameLen = ntohs(hostNameLen);
    offset += step;
    
    
    step = scanningAck->hostNameLen;
    if (offset + step > bufLen)
    {
        return -1;
    }
    scanningAck->hostName = (char *)malloc(step);
    memcpy(scanningAck->hostName, in_buf + offset, step);
    offset += step;
    
    return 0;
}

void free_scanning_ack(ST_SCANNING_ACK *scanningAck)
{
    if (scanningAck->hostName != NULL)
    {
        free(scanningAck->hostName);
        scanningAck->hostName = NULL;
    }
}


int en_send_image_request(const ST_SEND_IMAGE_REQUEST *sendImageRequest, void *buf, int *bufLen)
{
    int step = 0;
    int offset = 0;
    
    
    uint8_t *out_buf = (uint8_t *)buf;
    
    step = sizeof(sendImageRequest->type);
    if (offset + step > *bufLen)
    {
        return -1;
    }
    memcpy(out_buf + offset, &(sendImageRequest->type), step);
    offset += step;
    
    
    step = sizeof(sendImageRequest->len);
    if (offset + step > *bufLen)
    {
        return -2;
    }
    uint32_t len = htonl(sendImageRequest->len);
    memcpy(out_buf + offset, &(len), step);
    offset += step;
    
    
    
    step = sizeof(sendImageRequest->hostNameLen);
    if (offset + step > *bufLen)
    {
        return -4;
    }
    uint16_t hostNameLen = htons(sendImageRequest->hostNameLen);
    memcpy(out_buf + offset, &(hostNameLen), step);
    offset += step;
    
    
    step = sendImageRequest->hostNameLen;
    if (offset + step > *bufLen)
    {
        return -5;
    }
    memcpy(out_buf + offset, sendImageRequest->hostName, step);
    offset += step;
    
    *bufLen = offset;
    
    return 0;
}

int de_send_image_request(ST_SEND_IMAGE_REQUEST *sendImageRequest, const void *buf, int bufLen)
{
    int step = 0;
    int offset = 0;
    
    const uint8_t *in_buf = (const uint8_t *)buf;
    
    step = sizeof(sendImageRequest->type);
    if (offset + step > bufLen)
    {
        return -1;
    }
    memcpy(&(sendImageRequest->type), in_buf + offset, step);
    offset += step;
    
    
    step = sizeof(sendImageRequest->len);
    if (offset + step > bufLen)
    {
        return -1;
    }
    uint32_t len;
    memcpy(&(len), in_buf + offset, step);
    sendImageRequest->len = ntohl(len);
    offset += step;
    
    step = sizeof(sendImageRequest->hostNameLen);
    if (offset + step > bufLen)
    {
        return -1;
    }
    uint16_t hostNameLen;
    memcpy(&(hostNameLen), in_buf + offset, step);
    sendImageRequest->hostNameLen = ntohs(hostNameLen);
    offset += step;
    
    
    step = sendImageRequest->hostNameLen;
    if (offset + step > bufLen)
    {
        return -1;
    }
    sendImageRequest->hostName = (char *)malloc(step);
    memcpy(sendImageRequest->hostName, in_buf + offset, step);
    offset += step;
    
    return 0;
}

void free_send_image_request(ST_SEND_IMAGE_REQUEST *sendImageRequest)
{
    if (sendImageRequest->hostName != NULL)
    {
        free(sendImageRequest->hostName);
        sendImageRequest->hostName = NULL;
    }
}



int en_send_image_response(const ST_SEND_IMAGE_RESPONSE *sendImageRespose, void *buf, int *bufLen)
{
    int step = 0;
    int offset = 0;
    
    
    uint8_t *out_buf = (uint8_t *)buf;
    
    step = sizeof(sendImageRespose->type);
    if (offset + step > *bufLen)
    {
        return -1;
    }
    memcpy(out_buf + offset, &(sendImageRespose->type), step);
    offset += step;
    
    
    step = sizeof(sendImageRespose->len);
    if (offset + step > *bufLen)
    {
        return -2;
    }
    uint32_t len = htonl(sendImageRespose->len);
    memcpy(out_buf + offset, &(len), step);
    offset += step;
    
    
    step = sizeof(sendImageRespose->accept);
    if (offset + step > *bufLen)
    {
        return -3;
    }
    memcpy(out_buf + offset, &(sendImageRespose->accept), step);
    offset += step;
    
    *bufLen = offset;
    
    return 0;
}

int de_send_image_response(ST_SEND_IMAGE_RESPONSE *sendImageRespose, const void *buf, int bufLen)
{
    int step = 0;
    int offset = 0;
    
    const uint8_t *in_buf = (const uint8_t *)buf;
    
    step = sizeof(sendImageRespose->type);
    if (offset + step > bufLen)
    {
        return -1;
    }
    memcpy(&(sendImageRespose->type), in_buf + offset, step);
    offset += step;
    
    
    step = sizeof(sendImageRespose->len);
    if (offset + step > bufLen)
    {
        return -1;
    }
    uint32_t len;
    memcpy(&(len), in_buf + offset, step);
    sendImageRespose->len = ntohl(len);
    offset += step;
    
    step = sizeof(sendImageRespose->accept);
    if (offset + step > bufLen)
    {
        return -1;
    }
    memcpy(&(sendImageRespose->accept), in_buf + offset, step);
    offset += step;
    
    return 0;
}


int en_send_image(const ST_SEND_IMAGE *sendImage, void *buf, int *bufLen)
{
    int step = 0;
    int offset = 0;
    
    
    uint8_t *out_buf = (uint8_t *)buf;
    
    step = sizeof(sendImage->type);
    if (offset + step > *bufLen)
    {
        return -1;
    }
    memcpy(out_buf + offset, &(sendImage->type), step);
    offset += step;
    
    
    step = sizeof(sendImage->len);
    if (offset + step > *bufLen)
    {
        return -2;
    }
    uint32_t len = htonl(sendImage->len);
    memcpy(out_buf + offset, &(len), step);
    offset += step;
    
    
    step = sizeof(sendImage->index);
    if (offset + step > *bufLen)
    {
        return -2;
    }
    uint32_t index = htonl(sendImage->index);
    memcpy(out_buf + offset, &(index), step);
    offset += step;
    
    step = sizeof(sendImage->numberOfImage);
    if (offset + step > *bufLen)
    {
        return -2;
    }
    uint32_t numberOfImage = htonl(sendImage->numberOfImage);
    memcpy(out_buf + offset, &(numberOfImage), step);
    offset += step;


    
    
    step = sizeof(sendImage->imageDataLen);
    if (offset + step > *bufLen)
    {
        return -3;
    }
    uint32_t imageDataLen = htonl(sendImage->imageDataLen);
    memcpy(out_buf + offset, &(imageDataLen), step);
    offset += step;
    
    
    
    step = sendImage->imageDataLen;
    if (offset + step > *bufLen)
    {
        return -4;
    }
    memcpy(out_buf + offset, sendImage->imageData, step);
    offset += step;
    
    
    *bufLen = offset;
    
    return 0;
}

int de_send_image(ST_SEND_IMAGE *sendImage, const void *buf, int bufLen)
{
    int step = 0;
    int offset = 0;
    
    const uint8_t *in_buf = (const uint8_t *)buf;
    
    step = sizeof(sendImage->type);
    if (offset + step > bufLen)
    {
        return -1;
    }
    memcpy(&(sendImage->type), in_buf + offset, step);
    offset += step;
    
    
    step = sizeof(sendImage->len);
    if (offset + step > bufLen)
    {
        return -1;
    }
    uint32_t len;
    memcpy(&(len), in_buf + offset, step);
    sendImage->len = ntohl(len);
    offset += step;
    
    
    step = sizeof(sendImage->index);
    if (offset + step > bufLen)
    {
        return -1;
    }
    uint32_t index;
    memcpy(&(index), in_buf + offset, step);
    sendImage->index = ntohl(index);
    offset += step;
    
    step = sizeof(sendImage->numberOfImage);
    if (offset + step > bufLen)
    {
        return -1;
    }
    uint32_t numberOfImage;
    memcpy(&(numberOfImage), in_buf + offset, step);
    sendImage->numberOfImage = ntohl(numberOfImage);
    offset += step;
        
    step = sizeof(sendImage->imageDataLen);
    if (offset + step > bufLen)
    {
        return -1;
    }
    uint32_t imageDataLen;
    memcpy(&(imageDataLen), in_buf + offset, step);
    sendImage->imageDataLen = ntohl(imageDataLen);
    offset += step;
    
    
    step = sendImage->imageDataLen;
    if (offset + step > bufLen)
    {
        return -1;
    }
    sendImage->imageData = (uint8_t *)malloc(step);
    memcpy(sendImage->imageData, in_buf + offset, step);
    offset += step;
    
    return 0;
}

void free_send_image(ST_SEND_IMAGE *sendImage)
{
    if (sendImage->imageData != NULL)
    {
        free(sendImage->imageData);
        sendImage->imageData = NULL;
    }
}

int en_send_image_ack(const ST_SEND_IMAGE_ACK *sendImageAck, void *buf, int *bufLen)
{
    int step = 0;
    int offset = 0;
    
    
    uint8_t *out_buf = (uint8_t *)buf;
    
    step = sizeof(sendImageAck->type);
    if (offset + step > *bufLen)
    {
        return -1;
    }
    memcpy(out_buf + offset, &(sendImageAck->type), step);
    offset += step;
    
    
    step = sizeof(sendImageAck->len);
    if (offset + step > *bufLen)
    {
        return -2;
    }
    uint32_t len = htonl(sendImageAck->len);
    memcpy(out_buf + offset, &(len), step);
    offset += step;
    
    
    step = sizeof(sendImageAck->index);
    if (offset + step > *bufLen)
    {
        return -2;
    }
    uint32_t index = htonl(sendImageAck->index);
    memcpy(out_buf + offset, &(index), step);
    offset += step;
    
    
    *bufLen = offset;
    
    return 0;
}

int de_send_image_ack(ST_SEND_IMAGE_ACK *sendImageAck, const void *buf, int bufLen)
{
    int step = 0;
    int offset = 0;
    
    const uint8_t *in_buf = (const uint8_t *)buf;
    
    step = sizeof(sendImageAck->type);
    if (offset + step > bufLen)
    {
        return -1;
    }
    memcpy(&(sendImageAck->type), in_buf + offset, step);
    offset += step;
    
    
    step = sizeof(sendImageAck->len);
    if (offset + step > bufLen)
    {
        return -1;
    }
    uint32_t len;
    memcpy(&(len), in_buf + offset, step);
    sendImageAck->len = ntohl(len);
    offset += step;
    
    
    step = sizeof(sendImageAck->index);
    if (offset + step > bufLen)
    {
        return -1;
    }
    uint32_t index;
    memcpy(&(index), in_buf + offset, step);
    sendImageAck->index = ntohl(index);
    offset += step;
    

    return 0;
}


