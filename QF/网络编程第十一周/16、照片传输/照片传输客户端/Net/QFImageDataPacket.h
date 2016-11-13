//
//  QFImageDataPacket.h
//  照片传输客户端
//
//  Created by chen cheng on 14-9-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFPacket.h"
#import "Packet.h"

@interface QFImageDataPacket : QFPacket
{
    uint32_t  _index;//第几张照片
    uint32_t  _dateLen;//数据的长度
    uint8_t   *_data;//文件的数据
}

- (id)initWithIndex:(int)index data:(NSData *)imageData;

@end
