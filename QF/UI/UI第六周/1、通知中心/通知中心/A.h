//
//  A.h
//  通知中心
//
//  Created by chen cheng on 14-8-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "B.h"

@interface A : NSObject
{
    B   *_delegate;
}

@property(assign, readwrite, nonatomic)B *delegate;

- (void)sendData:(int)data;

@end
