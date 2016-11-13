//
//  QFSendImageResponse.h
//  照片传输服务端
//
//  Created by chen cheng on 14-9-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFPacket.h"
#import "Packet.h"

@interface QFSendImageResponse : QFPacket
{
    uint8_t   _errorCode;//错误代码
}
@property(assign, readonly, nonatomic)uint8_t errorCode;

- (id)initWithErrorCode:(uint8_t)errorCode;

@end
