//
//  A.m
//  通知中心
//
//  Created by chen cheng on 14-8-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "A.h"

@implementation A

- (void)sendData:(int)data
{
    [self.delegate recvData:data];
}

@end
