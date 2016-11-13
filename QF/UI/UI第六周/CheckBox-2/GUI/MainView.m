//
//  MainView.m
//  CheckBox
//
//  Created by chen cheng on 14-8-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainView.h"
#import "CheckBox.h"

@implementation MainView

- (void)dealloc
{
    [_checkBox1 release];
    _checkBox1 = nil;
    
    [_checkBox2 release];
    _checkBox2 = nil;
    
    [_checkBox3 release];
    _checkBox3 = nil;
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        _checkBox1 = [[CheckBox alloc] initWithFrame:CGRectMake(10, 100, 200, 40)];
        
         _checkBox1.title = @"记住用户名";
        _checkBox1.titleFont = [UIFont boldSystemFontOfSize:23];
        _checkBox1.titleColor = [UIColor redColor];
        
        
        //该函数只会执行一次、同时执行该函数的时候、并不代表函数checkBoxValueChange被执行
        [_checkBox1 addTarget:self action:@selector(checkBox1ValueChange:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:_checkBox1];
        
        
        
        _checkBox2 = [[CheckBox alloc] initWithFrame:CGRectMake(10, 140, 200, 40)];
        
        _checkBox2.title = @"记住密码";
    
        
        //该函数只会执行一次、同时执行该函数的时候、并不代表函数checkBoxValueChange被执行
        [_checkBox2 addTarget:self action:@selector(checkBox2ValueChange:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:_checkBox2];
        
        
        _checkBox3 = [[CheckBox alloc] initWithFrame:CGRectMake(10, 180, 200, 40)];
        
        _checkBox3.title = @"自动登录";
        
        
        //该函数只会执行一次、同时执行该函数的时候、并不代表函数checkBoxValueChange被执行
        [_checkBox3 addTarget:self action:@selector(checkBox3ValueChange:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:_checkBox3];
    }
    return self;
}

- (void)checkBox1ValueChange:(CheckBox *)checkBox
{
    NSLog(@"checkBoxValueChange checkBox.on = %d", checkBox.on);
    
    if (!_checkBox1.on)
    {
        _checkBox2.on = NO;
        _checkBox3.on = NO;
    }
}

- (void)checkBox2ValueChange:(CheckBox *)checkBox
{
    NSLog(@"checkBoxValueChange checkBox.on = %d", checkBox.on);
    
    if (!_checkBox2.on)
    {
        _checkBox3.on = NO;
    }
    else
    {
        _checkBox1.on = YES;
    }
}

- (void)checkBox3ValueChange:(CheckBox *)checkBox
{
    NSLog(@"checkBoxValueChange checkBox.on = %d", checkBox.on);
    
    if (_checkBox3.on)
    {
        _checkBox1.on = YES;
        _checkBox2.on = YES;
    }
}

- (void)checkBoxValueChanged:(CheckBox *)checkBox;
{
    NSLog(@"checkBoxValueChanged");
}


@end
