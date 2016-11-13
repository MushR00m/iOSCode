//
//  QFWindow.m
//  触摸屏幕收回键盘
//
//  Created by chen cheng on 14-8-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFWindow.h"

@implementation QFWindow

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        _didShowKeyBoard = NO;
       
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    }
    
    return self;
}

- (void)keyboardWillShow:(NSNotification *)notification
{
   _didShowKeyBoard = YES;
}

- (void)keyboardDidHide:(NSNotification *)notification
{
    _didShowKeyBoard = YES;
    NSLog(@"键盘");
}

- (void)sendEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    
    //如果触摸的区域不是第一响应者、则收回键盘，拦截事件
    
    
    if (_currentFirstResponder != nil
        &&
        _didShowKeyBoard
        &&
        touch.view != _currentFirstResponder)
    {
        [_currentFirstResponder resignFirstResponder];
    }
    else
    {
        //保存当前第一响应者
       
        _currentFirstResponder = touch.view;

        [super sendEvent:event];//把事件正常分发下去
    }
}


@end
