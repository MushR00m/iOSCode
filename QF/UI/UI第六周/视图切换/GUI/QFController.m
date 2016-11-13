//
//  QFController.m
//  视图切换
//
//  Created by chen cheng on 14-8-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFController.h"

static QFController *g_qfcontroller = nil;

@implementation QFController

+ (QFController *)shareQFController
{
    return g_qfcontroller;
}

- (void)dealloc
{
    g_qfcontroller = nil;
    
    
    [_view1 release];
    _view1 = nil;
    
    [_view2 release];
    _view2 = nil;
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        g_qfcontroller = self;
    }
    
    return self;
}

- (void)setWindow:(UIWindow *)window
{
    _window = window;
    if (_view1 == nil)
    {
        _view1 = [[View1 alloc] initWithFrame:window.bounds];
        
        [window addSubview:_view1];
    }
}

-(void)showViw2WithAnimated:(BOOL)animated
{
    if (_view2 == nil)
    {
        _view2 = [[View2 alloc] initWithFrame:self.window.bounds];
    }
    
    if (!animated)
    {
        [self.window addSubview:_view2];
        
        [_view1 removeFromSuperview];
        //下面两行代码可选
        [_view1 release];
        _view1 = nil;
    }
    else
    {
        _view2.layer.transform = CATransform3DTranslate(_view2.layer.transform, 320, 0, 0);
        [self.window addSubview:_view2];
        
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            _view2.layer.transform = CATransform3DIdentity;
            
        } completion:^(BOOL finished) {
            
            [_view1 removeFromSuperview];
            
            //下面两行代码可选
            [_view1 release];
            _view1 = nil;
        }];
    }
}
-(void)backView1WithAnimated:(BOOL)animated
{
    if (_view1 == nil)
    {
        _view1 = [[View1 alloc] initWithFrame:self.window.bounds];
    }
    
    [self.window insertSubview:_view1 atIndex:0];
    
    if (!animated)
    {
        
        [_view2 removeFromSuperview];
        [_view2 release];
        _view2 = nil;
    }
    else
    {
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            _view2.layer.transform = CATransform3DTranslate(_view2.layer.transform, 320, 0, 0);
            
        } completion:^(BOOL finished) {
            
            [_view2 removeFromSuperview];
            [_view2 release];
            _view2 = nil;

        }];
    }
}



@end
