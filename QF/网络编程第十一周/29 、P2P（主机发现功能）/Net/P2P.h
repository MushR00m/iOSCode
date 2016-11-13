//
//  P2P.h
//  P2P
//
//  Created by chen cheng on 14-07-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#ifndef P2P_P2P_h
#define P2P_P2P_h

#define PACKET_TYPE_SCANNING 0x01
#define PACKET_TYPE_SCANNING_ACK 0x02
#define PACKET_TYPE_SEND_IMAGE_REQUEST 0x03
#define PACKET_TYPE_SEND_IMAGE_RESPONSE 0x04
#define PACKET_TYPE_SEND_IMAGE 0x05
#define PACKET_TYPE_SEND_IMAGE_ACK 0x06

#define ACCEPT_UNKNOW 0x00
#define ACCEPT_YES 0x01
#define ACCEPT_NO 0x02
#define ACCEPT_BUSY 0x03


#define TRANSFER_STATE_WAIT_ACCEPT  0x00  //等待对方接受
#define TRANSFER_STATE_ACCEPT       0x01  //接受 开始传送
#define TRANSFER_STATE_REFUSED      0x02  //对方拒绝接受
#define TRANSFER_STATE_BUSY         0x03  //对方拒绝接受
#define TRANSFER_STATE_NO_ACK       0x04  //对方无应答
#define TRANSFER_STATE_FAILURE      0x05  //传送失败
#define TRANSFER_STATE_SUCCESS      0x06  //传送成功

#pragma pack(1)


typedef struct st_head
{
    uint8_t  type;
    uint32_t len;
} ST_HEAD;

typedef struct st_scanning
{
    uint8_t  type;
    uint32_t len;
} ST_SCANNING;

typedef struct st_scanning_ack
{
    uint8_t  type;
    uint32_t len;
    uint8_t  deviceType;
    uint16_t tcpServerPort;
    uint16_t hostNameLen;
    char     *hostName;
} ST_SCANNING_ACK;



typedef struct st_send_image_request
{
    uint8_t  type;
    uint32_t len;
    uint16_t hostNameLen;
    char     *hostName;
} ST_SEND_IMAGE_REQUEST;

typedef struct st_send_image_response
{
    uint8_t  type;
    uint32_t len;
    uint8_t  accept;
} ST_SEND_IMAGE_RESPONSE;

typedef struct st_send_image
{
    uint8_t  type;
    uint32_t len;
    uint32_t index;
    uint32_t numberOfImage;
    uint32_t imageDataLen;
    uint8_t  *imageData;
} ST_SEND_IMAGE;

typedef struct st_send_image_ack
{
    uint8_t  type;
    uint32_t len;
    uint32_t index;
} ST_SEND_IMAGE_ACK;


#pragma pack(0)


int en_scanning(const ST_SCANNING *scanning, void *buf, int *bufLen);
int de_scanning(ST_SCANNING *scanning, const void *buf, int bufLen);

int en_scanning_ack(const ST_SCANNING_ACK *scanningAck, void *buf, int *bufLen);
int de_scanning_ack(ST_SCANNING_ACK *scanningAck, const void *buf, int bufLen);
void free_scanning_ack(ST_SCANNING_ACK *scanningAck);


int en_send_image_request(const ST_SEND_IMAGE_REQUEST *sendImageRequest, void *buf, int *bufLen);
int de_send_image_request(ST_SEND_IMAGE_REQUEST *sendImageRequest, const void *buf, int bufLen);
void free_send_image_request(ST_SEND_IMAGE_REQUEST *sendImageRequest);

int en_send_image_response(const ST_SEND_IMAGE_RESPONSE *sendImageRespose, void *buf, int *bufLen);
int de_send_image_response(ST_SEND_IMAGE_RESPONSE *sendImageRespose, const void *buf, int bufLen);

int en_send_image(const ST_SEND_IMAGE *sendImage, void *buf, int *bufLen);
int de_send_image(ST_SEND_IMAGE *sendImage, const void *buf, int bufLen);
void free_send_image(ST_SEND_IMAGE *sendImage);

int en_send_image_ack(const ST_SEND_IMAGE_ACK *sendImageAck, void *buf, int *bufLen);
int de_send_image_ack(ST_SEND_IMAGE_ACK *sendImageAck, const void *buf, int bufLen);


#endif
