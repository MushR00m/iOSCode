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
    [_navigationController release];
    _navigationController = nil;
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    View1Controller *view1Controller = [[View1Controller alloc] init];
    view1Controller.delegate = self;
    
    
    _navigationController = [[UINavigationController alloc] initWithRootViewController:view1Controller];
    
    //设置导航栏的背景颜色
    //_navigationController.navigationBar.barTintColor = [UIColor greenColor];
    
    //设置导航栏字体的颜色
    _navigationController.navigationBar.tintColor = [UIColor greenColor];
    //NSLog(@"_navigationController.navigationBar.frame.size.height = %f", _navigationController.navigationBar.frame.size.height);
    
    //设置导航栏的背景图片
    //UIBarMetricsDefault 设置竖向的导航栏的背景图片 （320 * 64 and 640 * 128）
    //UIBarMetricsLandscapePhone设置横向的导航栏的背景图片 （3.5 英寸 480 * 64 and 560 * 128  4.0英寸 518 * 64 and 1036 * 128）
    [_navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBarBg.png"] forBarMetrics:UIBarMetricsDefault];
    
    //让导航栏隐藏
    //_navigationController.navigationBar.hidden = YES;
    //_navigationController.navigationBarHidden = YES;
    
    [view1Controller release];
    
    _navigationController.view.frame = self.view.bounds;
    [self.view addSubview:_navigationController.view];
}

- (void)showView2WithAnimated:(BOOL)animated
{
    //这种管理策略：是把所有试图控制器分散到各个函数的局部变量中、不便于集中管理、不推荐使用
    View2Controller *view2Controller = [[View2Controller alloc] init];
    view2Controller.delegate = self;
    
    NSLog(@"11 view2Controller.navigationController = %@", view2Controller.navigationController);
    
    NSLog(@"_navigationController = %@", _navigationController);
    
    //在view2Controller被push时、该属性会被自动设置。
    //view2Controller.navigationController = _navigationController;
    
    [_navigationController pushViewController:view2Controller animated:animated];
    
    
    
    NSLog(@"22 view2Controller.navigationController = %@", view2Controller.navigationController);
    
    [view2Controller release];
}

- (void)backWithAnimated:(BOOL)animated
{
    [_navigationController popViewControllerAnimated:animated];
}


@end
