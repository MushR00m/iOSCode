//
//  QFHeartBeatPacket.h
//  TCPServer
//
//  Created by chen cheng on 14-9-26.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFPacket.h"

@interface QFHeartBeatPacket : QFPacket
{
    uint32_t  _number;//心跳次数
}

- (id)initWithNumber:(uint32_t)number;

@end
