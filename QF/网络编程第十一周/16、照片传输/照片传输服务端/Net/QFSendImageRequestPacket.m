//
//  QFSendImageRequestPacket.m
//  TCPServer
//
//  Created by chen cheng on 14-9-26.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFSendImageRequestPacket.h"
#import "Packet.h"

#import "QFSendImageResponse.h"

#import <UIKit/UIKit.h>

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
    
    
    if (_condition == nil)
    {
        _condition  = [[NSCondition alloc] init];
    }
    
    _accept = -1;
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        UIAlertView  *alertView = [[UIAlertView alloc] initWithTitle:@"是否接受照片" message:nil delegate:self cancelButtonTitle:@"拒绝" otherButtonTitles:@"接受", nil];
        
        
        [alertView show];
        
        [alertView release];
    });
    
    [_condition lock];
    
    while (_accept == -1)
    {
        [_condition wait];
    }
    
    [_condition unlock];
    
    QFSendImageResponse *sendImageResponse = [[QFSendImageResponse alloc] initWithErrorCode:_accept];
    
    NSData  *data = nil;
    
    [sendImageResponse encodeToData:&data];
    
    NSLog(@"给客户端发应答包 data = %@", data);
    
    sendPacket_timeout(socketfd, [data bytes], [data length], YES, 10);
    
    [sendImageResponse release];
    
    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [_condition lock];
    
    if (buttonIndex == 0)
    {
        _accept = 0;
    }
    else
    {
        _accept = 1;
    }
    
    [_condition signal];
    
    [_condition unlock];
}


@end
