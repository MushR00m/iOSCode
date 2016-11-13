//
//  QFSendImageRequestPacket.h
//  TCPServer
//
//  Created by chen cheng on 14-9-26.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFPacket.h"
#import <UIKit/UIKit.h>

@interface QFSendImageRequestPacket : QFPacket<UIAlertViewDelegate>
{
    uint32_t  _numberOfImage;//照片的数量
    
    
    NSCondition  *_condition;
    int          _accept;// -1： 表示用户还没有点击拒绝按钮或者接受 0:用户已经点击了拒绝 1：用户已经点击了接受
}

- (id)initWithNumberOfImage:(uint32_t)numberOfImage;

@end
