//
//  QFFileDownloadRequestPacket.m
//  TCPServer
//
//  Created by chen cheng on 14-9-26.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFFileDownloadRequestPacket.h"
#import "Packet.h"

@implementation QFFileDownloadRequestPacket

- (void)dealloc
{
    free(_fileName);
    _fileName = nil;
    
    [super dealloc];
}

- (id)initWithFileName:(NSString *)fileName
{
    uint32_t length = (uint32_t)([super length] + sizeof(_fileNameLength)  + strlen([fileName UTF8String]));
    
    self = [super initWithType:PACKET_TYPE_FILE_DOWNLOAD_REQUEST length:length];
    if (self != nil)
    {
        _fileNameLength = (uint32_t)strlen([fileName UTF8String]);
        
        _fileName = malloc(_fileNameLength);
        
        memcpy(_fileName, [fileName UTF8String], _fileNameLength);
    }
    
    return self;
}

- (int)length
{
    return [super length] + sizeof(_fileNameLength) + _fileNameLength;
}


- (BOOL)encodeToData:(NSData **)data
{
    NSMutableData  *mutableData = nil;
    //先把包头打包到data中去
    [super encodeToData:&mutableData];
    
    mutableData = [mutableData mutableCopy];
    ssize_t offset = 0;
    ssize_t step = 0;
    
    step = sizeof(_fileNameLength);
    uint32_t fileNameLength = htonl(_fileNameLength);
    [mutableData appendBytes:&fileNameLength length:step];
    offset += step;
    
    
    step = _fileNameLength;
    [mutableData appendBytes:_fileName length:step];
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
    
    step = sizeof(_fileNameLength);
    if (offset + step > [data length])
    {
        return NO;
    }
    [data getBytes:&_fileNameLength range:NSMakeRange(offset, step)];
    _fileNameLength = ntohl(_fileNameLength);
    offset += step;
    
    
    
    step = _fileNameLength;
    if (offset + step > [data length])
    {
        return NO;
    }
    _fileName = malloc(_fileNameLength);
    [data getBytes:_fileName range:NSMakeRange(offset, step)];
    offset += step;


    return YES;
}

- (BOOL)processPacketWithSocket:(int)socketfd
{
    NSLog(@"客户端想要下载文件:%@", [[[NSString alloc] initWithBytes:_fileName length:_fileNameLength encoding:NSUTF8StringEncoding] autorelease]);
    return YES;
}


@end
