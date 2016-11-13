//
//  QFWindow.m
//  多个窗口
//
//  Created by chen cheng on 14-8-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFWindow.h"

@implementation QFWindow

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
    }
    return self;
}

- (void)sendEvent:(UIEvent *)event
{
    NSLog(@"QFWindow sendEvent ");
    [super sendEvent:event];
    
    
}


@end
