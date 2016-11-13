//
//  QFSendImageRequestPacket.h
//  TCPServer
//
//  Created by chen cheng on 14-9-26.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFPacket.h"

@interface QFSendImageRequestPacket : QFPacket
{
    uint32_t  _numberOfImage;//照片的数量
}

- (id)initWithNumberOfImage:(uint32_t)numberOfImage;

@end
