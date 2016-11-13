//
//  QFHeartBeatPacket.m
//  TCPServer
//
//  Created by chen cheng on 14-9-26.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFHeartBeatPacket.h"
#import "Packet.h"

@implementation QFHeartBeatPacket

- (id)initWithNumber:(uint32_t)number
{
    self = [super initWithType:PACKET_TYPE_HEART_BEAT length:[self length]];
    
    if (self != nil)
    {
        _number = number;
    }
    
    return self;
}


- (int)length
{
    return [super length] + sizeof(_number);
}


- (BOOL)encodeToData:(NSData **)data
{
    NSMutableData  *mutableData = nil;
    //先把包头打包到data中去
    [super encodeToData:&mutableData];
    
    mutableData = [mutableData mutableCopy];
    
    ssize_t offset = 0;
    ssize_t step = 0;
    
    step = sizeof(_number);
    uint32_t number = htonl(_number);
    [mutableData appendBytes:&number length:step];
    offset += step;
    
    *data = [[mutableData copy] autorelease];

    [mutableData release];
    
    return YES;
}

- (BOOL)decodeFromData:(NSData *)data
{
    [super decodeFromData:data];
    
    ssize_t offset = [super length];
    ssize_t step = 0;
    
    step = sizeof(_number);
    if (offset + step > [data length])
    {
        return NO;
    }
    [data getBytes:&_number range:NSMakeRange(offset, step)];
    _number = ntohl(_number);
    offset += step;

    
    
    return YES;
}

- (BOOL)processPacketWithSocket:(int)socketfd
{
    NSLog(@"收到第%d次心跳", _number);
    return YES;
}

@end
