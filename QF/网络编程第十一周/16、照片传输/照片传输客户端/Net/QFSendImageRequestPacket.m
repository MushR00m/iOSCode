//
//  QFSendImageRequestPacket.m
//  TCPServer
//
//  Created by chen cheng on 14-9-26.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFSendImageRequestPacket.h"
#import "Packet.h"

@implementation QFSendImageRequestPacket



- (id)initWithNumberOfImage:(uint32_t)numberOfImage
{
    uint32_t length = (uint32_t)([super length] + sizeof(_numberOfImage));
    
    self = [super initWithType:PACKET_TYPE_SEND_IMAGE_REQUEST length:length];
    if (self != nil)
    {
        _numberOfImage = numberOfImage;
    }
    return self;
}

- (int)length
{
    return [super length] + sizeof(_numberOfImage);
}


- (BOOL)encodeToData:(NSData **)data
{
    NSMutableData  *mutableData = nil;
    //先把包头打包到data中去
    [super encodeToData:&mutableData];
    
    mutableData = [mutableData mutableCopy];

    
    ssize_t offset = 0;
    ssize_t step = 0;
    
    step = sizeof(_numberOfImage);
    uint32_t numberOfImage = htonl(_numberOfImage);
    [mutableData appendBytes:&numberOfImage length:step];
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
    
    step = sizeof(_numberOfImage);
    if (offset + step > [data length])
    {
        return NO;
    }
    [data getBytes:&_numberOfImage range:NSMakeRange(offset, step)];
    _numberOfImage = ntohl(_numberOfImage);
    offset += step;

    return YES;
}

- (BOOL)processPacketWithSocket:(int)socketfd
{
    NSLog(@"客户端想要给你发送%d张照片", _numberOfImage);
    return YES;
}


@end
