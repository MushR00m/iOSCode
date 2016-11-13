//
//  QFImageDataPacket.m
//  照片传输客户端
//
//  Created by chen cheng on 14-9-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFImageDataPacket.h"

#import "QFImageDataPacket.h"

#import <UIKit/UIKit.h>

#import "QFAssetsTool.h"
#import "QFImageDataAckPacket.h"


@implementation QFImageDataPacket

- (void)dealloc
{
    if (_data != nil)
    {
        free(_data);
    }
    [super dealloc];
}

- (id)initWithIndex:(int)index data:(NSData *)imageData
{
    _dateLen = [imageData length];
    uint32_t length = (uint32_t)([super length] + sizeof(_index) + sizeof(_dateLen) + _dateLen);
    
    self = [super initWithType:PACKET_TYPE_IMAGE_DATA length:length];
    if (self != nil)
    {
        _index = index;
        _dateLen = [imageData length];
        _data = malloc(_dateLen);
        
        [imageData getBytes:_data length:_dateLen];
    }
    
    return self;
}

- (int)length
{
    return [super length] + sizeof(index) + sizeof(_index) + sizeof(_dateLen) + _dateLen;
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
    
    
    step = sizeof(_dateLen);
    uint32_t dateLen = htonl(_dateLen);
    [mutableData appendBytes:&dateLen length:step];
    offset += step;
    
    
    step = _dateLen;
    [mutableData appendBytes:_data length:step];
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
    
    
    step = sizeof(_dateLen);
    if (offset + step > [data length])
    {
        return NO;
    }
    [data getBytes:&_dateLen range:NSMakeRange(offset, step)];
    _dateLen = ntohl(_dateLen);
    offset += step;
    
    
    step = _dateLen;
    if (offset + step > [data length])
    {
        return NO;
    }
    _data = malloc(_dateLen);
    [data getBytes:_data range:NSMakeRange(offset, step)];
    offset += step;
    
    return YES;
}

- (BOOL)processPacketWithSocket:(int)socketfd
{
    
    UIImage  *image = [UIImage imageWithData:[NSData dataWithBytes:_data length:_dateLen]];
    
   // NSLog(@"服务收到一张照片 image = %@", image);
    
    [QFAssetsTool synchronousWriteToSavedPhotosAlbum:image];
    
    QFImageDataAckPacket *imageDataAckPacket = [[QFImageDataAckPacket alloc] initWithIndex:_index];
    
    NSData  *data = nil;
    
    [imageDataAckPacket encodeToData:&data];
    
    sendPacket_timeout(socketfd, [data bytes], [data length], YES, 10);
    
    [imageDataAckPacket release];
    
    return YES;
}

@end
