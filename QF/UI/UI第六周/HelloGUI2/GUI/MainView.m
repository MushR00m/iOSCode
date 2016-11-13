//
//  MainView.m
//  HelloGUI
//
//  Created by chen cheng on 14-8-18.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        self.backgroundColor = [UIColor redColor];
        
        UIView  *subView = [[UIView alloc] initWithFrame:CGRectMake(30, 100, 260, 100)];
        
        subView.backgroundColor = [UIColor greenColor];
        
        [self addSubview:subView];
        
        [subView release];
        
    }
    return self;
}


@end
