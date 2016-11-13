//
//  MainViewController.m
//  导航视图控制器
//
//  Created by chen cheng on 14-8-26.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
- (void)dealloc
{
    [_view1Controller release];
    _view1Controller = nil;
    
    [_view2Controller release];
    _view2Controller = nil;
    
    [_navigationController release];
    _navigationController = nil;
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self)
    {
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _view1Controller = [[View1Controller alloc] init];
    _view1Controller.delegate = self;
    
    
    _view2Controller = [[View2Controller alloc] init];
    _view2Controller.delegate = self;
    
    _navigationController = [[UINavigationController alloc] initWithRootViewController:_view1Controller];

    
    _navigationController.view.frame = self.view.bounds;
    [self.view addSubview:_navigationController.view];
}

- (void)setView1BackgroundColor:(UIColor *)backgroundColor
{
    //先保存颜色信息、方便以后画面重建的时候能够使用
    _view1Controller.backgroundColor = backgroundColor;
    
    //如果视图已经被加载 现在就更改背景颜色
    if ([_view1Controller isViewLoaded])
    {
        _view1Controller.view.backgroundColor = backgroundColor;
    }
}

- (void)showView2WithAnimated:(BOOL)animated
{
    [_navigationController pushViewController:_view2Controller animated:animated];
}

- (void)backWithAnimated:(BOOL)animated
{
    [_navigationController popViewControllerAnimated:animated];
    
    //直接回到根视图
    [_navigationController popToRootViewControllerAnimated:YES];
    
    //回到指定的视图
    //[_navigationController popToViewController:<#(UIViewController *)#> animated:<#(BOOL)#>]
}

- (void)didReceiveMemoryWarning
{
    if (_navigationController.topViewController != _view1Controller)
    {
        [_view1Controller QF_viewDidUnload];
    }
    
    if (_navigationController.topViewController != _view2Controller)
    {
        [_view2Controller QF_viewDidUnload];
    }
}


@end
