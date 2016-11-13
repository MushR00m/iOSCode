//
//  MainView.m
//  LoginDemo
//
//  Created by chen cheng on 14-8-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        LoginView  *loginView = [[LoginView alloc] initWithFrame:CGRectMake(10, 30, 300, 400)];
        
        loginView.layer.borderColor = [UIColor blackColor].CGColor;
        loginView.layer.borderWidth = 1;
        
        [self addSubview:loginView];
        
        [loginView release];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
