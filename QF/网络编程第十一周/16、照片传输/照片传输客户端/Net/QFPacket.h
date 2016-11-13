//
//  QFPacket.h
//  TCPServer
//
//  Created by chen cheng on 14-9-26.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>



/**
 *  抽象的包得基类、任何具体的包都继承于它。
 */
@interface QFPacket : NSObject
{
    uint8_t   _type;//包得类型
    uint32_t  _length;//包得长度（整个包得长度、包含包头）
}

@property(assign, readonly, nonatomic)uint8_t type;

+ (QFPacket *)packetWithData:(NSData *)data;

- (id)initWithType:(uint8_t)type length:(uint32_t)length;

+ (BOOL)recvPacketWithSocket:(int)socketfd data:(NSData **)data atomically:(BOOL)atomically;

+ (BOOL)recvPacketWithSocket:(int)socketfd data:(NSData **)data atomically:(BOOL)atomically timeout:(long) timeoutSec;

- (int)length;

- (BOOL)encodeToData:(NSData **)data;

- (BOOL)decodeFromData:(NSData *)data;

- (BOOL)processPacketWithSocket:(int)socketfd;


@end
