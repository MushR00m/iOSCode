//
//  QFSendImageResponse.m
//  照片传输服务端
//
//  Created by chen cheng on 14-9-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFSendImageResponse.h"

@implementation QFSendImageResponse


- (id)initWithErrorCode:(uint8_t)errorCode
{
    uint32_t length = (uint32_t)([super length] + sizeof(_errorCode));
    
    self = [super initWithType:PACKET_TYPE_SEND_IMAGE_RESPONSE length:length];
    if (self != nil)
    {
        _errorCode = errorCode;
    }
    return self;
}


- (BOOL)encodeToData:(NSData **)data
{
    NSMutableData  *mutableData = nil;
    //先把包头打包到data中去
    [super encodeToData:&mutableData];
    
    mutableData = [mutableData mutableCopy];
    
    
    ssize_t offset = 0;
    ssize_t step = 0;
    
    step = sizeof(_errorCode);
    [mutableData appendBytes:&_errorCode length:step];
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
    
    step = sizeof(_errorCode);
    if (offset + step > [data length])
    {
        return NO;
    }
    [data getBytes:&_errorCode range:NSMakeRange(offset, step)];
    offset += step;
    
    return YES;
}

- (BOOL)processPacketWithSocket:(int)socketfd
{
    if (_errorCode == 0)
    {
        NSLog(@"服务端拒绝接受照片");
    }
    else if (_errorCode == 1)
    {
        NSLog(@"服务端愿意接受照片");
    }
    return YES;
}



@end
