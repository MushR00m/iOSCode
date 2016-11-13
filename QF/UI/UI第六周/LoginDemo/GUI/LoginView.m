//
//  LoginView.m
//  LoginDemo
//
//  Created by chen cheng on 14-8-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (void)dealloc
{
    [_swichLabel1 release];
    _swichLabel1 = nil;
    [_swich1 release];
    _swich1 = nil;
    
    [_swichLabel2 release];
    _swichLabel2 = nil;
    [_swich2 release];
    _swich2 = nil;
    
    [_swichLabel3 release];
    _swichLabel3 = nil;
    [_swich3 release];
    _swich3 = nil;

    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _swichLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 140, 40)];
        _swichLabel1.text = @"记住用户名";
        [self addSubview:_swichLabel1];
        _swich1 = [[UISwitch alloc] initWithFrame:CGRectMake(140, 100, 0, 0)];
        
        [_swich1 addTarget:self action:@selector(swichControl1EventValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:_swich1];
        
        
        _swichLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 140, 40)];
        _swichLabel2.text = @"记住密码";
        [self addSubview:_swichLabel2];
        _swich2 = [[UISwitch alloc] initWithFrame:CGRectMake(140, 150, 0, 0)];
        [_swich2 addTarget:self action:@selector(swichControl2EventValueChanged:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_swich2];
        
        
        
        _swichLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 140, 40)];
        _swichLabel3.text = @"自动登录";
        [self addSubview:_swichLabel3];
        _swich3 = [[UISwitch alloc] initWithFrame:CGRectMake(140, 200, 0, 0)];
        [_swich3 addTarget:self action:@selector(swichControl3EventValueChanged:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_swich3];


        
    }
    return self;
}

- (void)swichControl1EventValueChanged:(UISwitch *)switchControl
{
    if (!_swich1.on)
    {
        _swich2.on = NO;
        _swich3.on = NO;
    }
}

- (void)swichControl2EventValueChanged:(UISwitch *)switchControl
{
    if (_swich2.on)
    {
        _swich1.on = YES;
    }
    else
    {
        _swich3.on = NO;
    }
}

- (void)swichControl3EventValueChanged:(UISwitch *)switchControl
{
    if (_swich3.on)
    {
        _swich1.on = YES;
        _swich2.on = YES;
    }
}



@end
