//
//  TCPClient.m
//  照片传输客户端
//
//  Created by chen cheng on 14-9-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "TCPClient.h"
#import "QFSendImageRequestPacket.h"
#import "QFPacket.h"
#import "Packet.h"
#import "QFImageDataPacket.h"
#import "QFAssetsTool.h"

@interface TCPClient ()

@end

@implementation TCPClient

- (id)initWithServerIp:(NSString *)ip serverPort:(uint16_t )port
{
    self = [super init];
    if (self != nil)
    {
        _ip = [ip retain];
        _port = port;
    }
    
    return self;
}

- (void)connectCompletion:(void (^)(BOOL flag)) completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        _socketfd = openClientSocket([_ip UTF8String], _port);
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (_socketfd >= 0)
            {
                completion(YES);
            }
            else
            {
                completion(NO);
            }
            
        });
    });
}



- (void)sendSendImageRequestPacketWithNumber:(uint32_t)numberOfImage completion:(void (^)(QFPacket *returningPacket)) completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        QFSendImageRequestPacket  *sendImageRequestPacket = [[QFSendImageRequestPacket alloc] initWithNumberOfImage:numberOfImage];
        
        NSData  *data = nil;
        [sendImageRequestPacket encodeToData:&data];
        
        sendPacket_timeout(_socketfd, [data bytes], [data length], YES, 10);
        
        [QFPacket recvPacketWithSocket:_socketfd data:&data atomically:YES];
        
        NSLog(@"收到的应答包 data = %@", data);
        
        
        QFPacket   *packet = [QFPacket packetWithData:data];

        if (completion != nil)
        { 
            dispatch_async(dispatch_get_main_queue(), ^{
                completion([[packet retain] autorelease]);
            });
            
        }
    });
}

- (void)sendImagesWithImagURLArray:(NSArray *)imageURLArray updateProgress:(void (^)(int index))updateProgress
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        for (int i = 0; i<[imageURLArray count]; i++)
        {
            @autoreleasepool
            {
                NSURL *imageURL = [imageURLArray objectAtIndex:i];
                
                UIImage *image = [QFAssetsTool synchronousImageWithURL:imageURL];
                
                NSData *imageData = UIImagePNGRepresentation(image);
                
                // NSLog(@"图片数据 imageData = %@", imageData);
                
                QFImageDataPacket  *imageDataPacket = [[QFImageDataPacket alloc] initWithIndex:i data:imageData];
                
                NSData  *data = nil;
                
                [imageDataPacket encodeToData:&data];
                
                //NSLog(@"图片数据包 data = %@", data);
                
                sendPacket(_socketfd, [data bytes], [data length], YES);
                
                [QFPacket recvPacketWithSocket:_socketfd data:&data atomically:YES];
                
                NSLog(@"收到图片数据包得应答包 data = %@", data);
                
                
                
                if (updateProgress != nil)
                {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        updateProgress(i);
                    });
                }
            }
        }
        
    });
}

@end
