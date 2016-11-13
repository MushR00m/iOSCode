//
//  QFImageDataAckPacket.h
//  照片传输服务端
//
//  Created by chen cheng on 14-9-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFPacket.h"

@interface QFImageDataAckPacket : QFPacket
{
    uint32_t  _index;//第几张照片
}

- (id)initWithIndex:(int)index ;

@end
