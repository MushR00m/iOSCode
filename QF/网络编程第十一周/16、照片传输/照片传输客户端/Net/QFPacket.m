//
//  QFPacket.m
//  TCPServer
//
//  Created by chen cheng on 14-9-26.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFPacket.h"
#include <arpa/inet.h>
#import "Packet.h"
#import "SocketTool.h"


static NSString *g_classNameString[] = {
    @"QFSendImageRequestPacket",
    @"QFSendImageResponse",
};

@implementation QFPacket


+ (QFPacket *)packetWithData:(NSData *)data
{
    QFPacket *packetHead = [[QFPacket alloc] init];
    
    [packetHead decodeFromData:data];
    
    NSString * className = g_classNameString[packetHead.type];
    
    [packetHead release];
    
    QFPacket *packet = [[NSClassFromString(className) alloc] init];
    
    [packet decodeFromData:data];
    
    return [packet autorelease];
}

- (id)initWithType:(uint8_t)type length:(uint32_t)length
{
    self = [super init];
    if (self != nil)
    {
        _type = type;
        _length = length;
    }
    
    return self;
}


+ (BOOL)recvPacketWithSocket:(int)socketfd data:(NSData **)data atomically:(BOOL)atomically
{
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
    
    NSMutableData  *mutableData = [[NSMutableData alloc] init];
    
    //收包头
    step = sizeof(ST_HEAD);
    
    char  *recvBuf = malloc(step);
    nbytes = readN(socketfd, recvBuf, step);
    if (nbytes < 0)
    {
        [lock unlock];
        [mutableData release];
        *data = nil;
        free(recvBuf);
        return NO;
    }
    else if (nbytes == 0)
    {
        [lock unlock];
        [mutableData release];
        *data = nil;
        free(recvBuf);
        return NO;
    }
    [mutableData appendBytes:recvBuf length:nbytes];
    
    ST_HEAD *head = (ST_HEAD *)recvBuf;
    
    //收包体
    step = ntohl(head->length) - sizeof(ST_HEAD);
    recvBuf = realloc(recvBuf, step);
    nbytes = readN(socketfd, recvBuf, step);
    if (nbytes < 0)
    {
        [lock unlock];
        [mutableData release];
        *data = nil;
        free(recvBuf);
        return NO;
    }
    else if (nbytes == 0)
    {
        [lock unlock];
        [mutableData release];
        *data = nil;
        free(recvBuf);
        return NO;
    }
    [mutableData appendBytes:recvBuf length:nbytes];
    
    [lock unlock];
    
    *data = [[mutableData copy] autorelease];
    
    [mutableData release];
    free(recvBuf);

    return YES;
}


+ (BOOL)recvPacketWithSocket:(int)socketfd data:(NSData **)data atomically:(BOOL)atomically timeout:(long) timeoutSec
{
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
    
    
    NSMutableData  *mutableData = [[NSMutableData alloc] init];
    
    //收包头
    step = sizeof(ST_HEAD);
    time_t  time1 = time(NULL);
    char  *recvBuf = malloc(step);
    nbytes = readN_timeout(socketfd, recvBuf, step, timeoutSec);
    time_t  time2 = time(NULL);
    
    timeoutSec = timeoutSec - (time2 - time1);
    
    if (nbytes != step)//收包头失败
    {
        [lock unlock];
        [mutableData release];
        *data = nil;
        return NO;
    }
    [mutableData appendBytes:recvBuf length:nbytes];
    
    
    if (timeoutSec <= 0)//没有时间收包体了
    {
        [mutableData release];
        *data = nil;
        free(recvBuf);
        return NO;
    }
    
    ST_HEAD *head = (ST_HEAD *)recvBuf;
    
    //收包体
    step = ntohl(head->length) - sizeof(ST_HEAD);
    recvBuf = realloc(recvBuf, step);
    nbytes = readN_timeout(socketfd, recvBuf, step, timeoutSec);
    if (nbytes != step)//收包体失败
    {
        [lock unlock];
        [mutableData release];
        *data = nil;
        free(recvBuf);
        return -1;
    }
    [mutableData appendBytes:recvBuf length:nbytes];
    
    

    [lock unlock];
    
    *data = [[mutableData copy] autorelease];
    
    [mutableData release];
    free(recvBuf);
    
    return YES;
}


- (int)length
{
    return sizeof(_type) + sizeof(_length);
}

- (BOOL)encodeToData:(NSData **)data
{
    ssize_t offset = 0;
    ssize_t step = 0;
    
    NSMutableData  *mutableData = [[NSMutableData alloc] init];
    
    
    //包得类型线性化到buf
    step = sizeof(_type);
    [mutableData appendBytes:&_type length:step];
    offset += step;
    
    
    step = sizeof(_length);
    uint32_t length = htonl(_length);
    [mutableData appendBytes:&length length:step];
    offset += step;

    *data = [[mutableData copy] autorelease];
    
    [mutableData release];
    
    return YES;
}

- (BOOL)decodeFromData:(NSData *)data
{
    ssize_t offset = 0;
    ssize_t step = 0;
    
    
    //包得类型线性化到buf
    step = sizeof(_type);
    if (offset + step > [data length])
    {
        return NO;
    }
    [data getBytes:&_type range:NSMakeRange(offset, step)];
    offset += step;
    
    
    step = sizeof(_length);
    if (offset + step > [data length])
    {
        return NO;
    }
    [data getBytes:&_length range:NSMakeRange(offset, step)];
    _length = ntohl(_length);
    offset += step;
    
    return YES;
}

- (BOOL)processPacketWithSocket:(int)socketfd
{
    return NO;
}

@end
