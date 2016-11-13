//
//  MainViewController.m
//  视图切换(视图控制器)
//
//  Created by chen cheng on 14-8-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"


static MainViewController *g_mainViewController = nil;

@interface MainViewController ()

@end

@implementation MainViewController

+ (MainViewController *)shareMainViewController
{
    return g_mainViewController;
}

- (void)dealloc
{
    [_view1Controller release];
    _view1Controller = nil;
    
    [_view2Controller release];
    _view2Controller = nil;

    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        g_mainViewController = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _view1Controller  = [[View1Controller alloc] init];
    
    _view2Controller = [[View2Controller alloc] init];
    
    _currentPage = 1;
    _view1Controller.view.frame = self.view.bounds;
    [self.view addSubview:_view1Controller.view];
}

//当发生内存警告信息后、window的根视图控制器的didReceiveMemoryWarning函数是百分百会被回调
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    NSLog(@"MainViewController didReceiveMemoryWarning");
    
    
    if (_currentPage == 1)
    {
        //把视图二的内存给卸载掉
        [_view2Controller QF_viewDidUnload];
    }
    else if (_currentPage == 2)
    {
        //把视图一的内存给卸载掉
        [_view1Controller QF_viewDidUnload];
    }
    
}

- (void)showView2WithAnimated:(BOOL)animated
{
    _currentPage = 2;
    
    NSLog(@"showView2WithAnimated");
    
    _view2Controller.view.layer.transform = CATransform3DIdentity;
    _view2Controller.view.frame = self.view.bounds;
    
    
    if (!animated)
    {
        [self.view addSubview:_view2Controller.view];
        [_view1Controller.view removeFromSuperview];
    }
    else
    {
        _view2Controller.view.layer.transform = CATransform3DTranslate(_view2Controller.view.layer.transform, 320, 0, 0);
        
        [self.view addSubview:_view2Controller.view];
        
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            _view2Controller.view.layer.transform = CATransform3DIdentity;
            
        } completion:^(BOOL finished) {
            
            [_view1Controller.view removeFromSuperview];
            
        }];
    }
}

- (void)backView1WithAnimated:(BOOL)animated
{
    _currentPage = 1;
    _view1Controller.view.layer.transform = CATransform3DIdentity;
    [self.view insertSubview:_view1Controller.view atIndex:0];
    
    if (!animated)
    {
        [_view2Controller.view removeFromSuperview];
    }
    else
    {
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            _view2Controller.view.layer.transform = CATransform3DTranslate(_view2Controller.view.layer.transform, 320, 0, 0);
            
        } completion:^(BOOL finished) {
            [_view2Controller.view removeFromSuperview];
        }];
    }
}


@end
