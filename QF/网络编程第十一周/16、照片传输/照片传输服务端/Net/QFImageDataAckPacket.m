//
//  QFImageDataAckPacket.m
//  照片传输服务端
//
//  Created by chen cheng on 14-9-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFImageDataAckPacket.h"
#import "Packet.h"

@implementation QFImageDataAckPacket


- (id)initWithIndex:(int)index
{
    uint32_t length = (uint32_t)([super length] + sizeof(_index));
    
    self = [super initWithType:PACKET_TYPE_IMAGE_DATA_ACK length:length];
    if (self != nil)
    {
        _index = index;
    }
    
    return self;
}


- (int)length
{
    return [super length] + sizeof(index) + sizeof(_index);
}

- (BOOL)encodeToData:(NSData **)data
{
    NSMutableData  *mutableData = nil;
    //先把包头打包到data中去
    [super encodeToData:&mutableData];
    
    mutableData = [mutableData mutableCopy];
    
    
    ssize_t offset = 0;
    ssize_t step = 0;
    
    step = sizeof(_index);
    uint32_t index = htonl(_index);
    [mutableData appendBytes:&index length:step];
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
    
    step = sizeof(_index);
    if (offset + step > [data length])
    {
        return NO;
    }
    [data getBytes:&_index range:NSMakeRange(offset, step)];
    _index = ntohl(_index);
    offset += step;

    return YES;
}



@end
