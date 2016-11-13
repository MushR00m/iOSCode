//
//  B.m
//  通知中心
//
//  Created by chen cheng on 14-8-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "B.h"

@implementation B

- (void)recvData:(int)data
{
    _data = data;
    NSLog(@"_data = %d", _data);
}

@end
