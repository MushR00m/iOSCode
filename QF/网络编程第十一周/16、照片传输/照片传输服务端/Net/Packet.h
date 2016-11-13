//
//  Packet.h
//  TCPClient
//
//  Created by chen cheng on 14-9-25.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <stdint.h>
#import <Foundation/Foundation.h>

#define PACKET_TYPE_SEND_IMAGE_REQUEST 0x00
#define PACKET_TYPE_SEND_IMAGE_RESPONSE 0x01
#define PACKET_TYPE_IMAGE_DATA 0x02
#define PACKET_TYPE_IMAGE_DATA_ACK 0x03

#define FILE_DOWNLOAD_RESPONSE_ERROR_CODE_OK 0x00;
#define FILE_DOWNLOAD_RESPONSE_ERROR_CODE_ERR 0x01;


#pragma pack(1)

typedef struct st_head
{
    uint8_t   type;//包得类型
    uint32_t  length;//包得长度（整个包得长度、包含包头）
} ST_HEAD;


typedef struct st_send_image_request
{
    uint8_t   type;//包得类型
    uint32_t  length;//包得长度（整个包得长度、包含包头）
    uint32_t  numberOfImage;//照片的数量
} ST_SEND_IMAGE_REQUEST;

//00 | 00 00 00 0E | 00 00 00 05 | a . t x t


typedef struct st_send_image_response
{
    uint8_t   type;//包得类型
    uint32_t  length;//包得长度（整个包得长度、包含包头）
    uint8_t   errorCode;//错误代码
} ST_SEND_IMAGE_RESPONSE;


typedef struct st_file_info
{
    uint8_t   type;//包得类型
    uint32_t  length;//包得长度（整个包得长度、包含包头）
    uint32_t  fileSize;//文件的大小
} ST_FILE_INFO;


typedef struct st_file_data
{
    uint8_t   type;//包得类型
    uint32_t  length;//包得长度（整个包得长度、包含包头）
    uint32_t  dateLen;//数据的长度
    uint8_t   *data;//文件的数据
} ST_FILE_DOWNLOAD_DATA;

#pragma pack()



void printPackt(const void *buf, size_t bufLen);


ssize_t recvPacket(int socketfd, void *buf, size_t bufLen, BOOL atomically);

ssize_t recvPacket_timeout(int socketfd, void *buf, size_t bufLen, BOOL atomically, long timeoutSec);

ssize_t sendPacket(int socketfd, const void *buf, size_t bufLen, BOOL atomically);

ssize_t sendPacket_timeout(int socketfd, const void *buf, size_t bufLen, BOOL atomically, long timeoutSec);


#pragma mark 文件请求包得代码

/*ST_FILE_DOWNLOAD_REQUEST *init_file_download_request(ST_FILE_DOWNLOAD_REQUEST *fileDownloadRequest, char *fileName);

ssize_t encode_file_download_request(const ST_FILE_DOWNLOAD_REQUEST *fileDownloadRequest, void *buf, size_t bufLen);

ssize_t decode_file_download_request(ST_FILE_DOWNLOAD_REQUEST *fileDownloadRequest, const void *buf, size_t bufLen);

int process_file_download_request(const ST_FILE_DOWNLOAD_REQUEST *fileDownloadRequest, int socketfd);

void dealloc_file_download_request(ST_FILE_DOWNLOAD_REQUEST *fileDownloadRequest);


#pragma mark 心跳包得代码

ST_HEART_BEAT  *init_heart_beat(ST_HEART_BEAT *heartBeat, uint32_t number);

ssize_t encode_heart_beat(const ST_HEART_BEAT *heartBeat, void *buf, size_t bufLen);

ssize_t decode_heart_beat(ST_HEART_BEAT *heartBeat, const void *buf, size_t bufLen);


int process_heart_beat(const ST_HEART_BEAT *heartBeat, int socketfd);*/


