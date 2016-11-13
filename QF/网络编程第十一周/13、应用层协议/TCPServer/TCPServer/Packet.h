//
//  Packet.h
//  TCPClient
//
//  Created by chen cheng on 14-9-25.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//


#define PACKET_TYPE_FILE_DOWNLOAD_REQUEST 0x00
#define PACKET_TYPE_FILE_DOWNLOAD_RESPONSE 0x01
#define PACKET_TYPE_FILE_DATA 0x02

#define FILE_DOWNLOAD_RESPONSE_ERROR_CODE_OK 0x00;
#define FILE_DOWNLOAD_RESPONSE_ERROR_CODE_ERR 0x01;


#pragma pack(1)

typedef struct st_head
{
    uint8_t   type;//包得类型
    uint32_t  length;//包得长度（整个包得长度、包含包头）
} ST_HEAD;



typedef struct st_file_download_request
{
    uint8_t   type;//包得类型
    uint32_t  length;//包得长度（整个包得长度、包含包头）
    uint32_t  fileNameLength; //要下载的文件的文件名的长度
    char      *fileName;//文件名称(不包含'\0')
} ST_FILE_DOWNLOAD_REQUEST;

//00 | 00 00 00 0E | 00 00 00 05 | a . t x t


typedef struct st_file_download_response
{
    uint8_t   type;//包得类型
    uint32_t  length;//包得长度（整个包得长度、包含包头）
    uint8_t   errorCode;//错误代码
} ST_FILE_DOWNLOAD_RESPONSE;


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



ssize_t recvPacket(int socketfd, void *buf, size_t bufLen);



ST_FILE_DOWNLOAD_REQUEST *init_file_download_request(ST_FILE_DOWNLOAD_REQUEST *fileDownloadRequest, char *fileName);

ssize_t encode_file_download_request(const ST_FILE_DOWNLOAD_REQUEST *fileDownloadRequest, void *buf, size_t bufLen);

ssize_t decode_file_download_request(ST_FILE_DOWNLOAD_REQUEST *fileDownloadRequest, const void *buf, size_t bufLen);

void dealloc_file_download_request(ST_FILE_DOWNLOAD_REQUEST *fileDownloadRequest);




