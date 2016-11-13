//
//  MainViewController.m
//  标签栏视图控制器
//
//  Created by chen cheng on 14-9-3.
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
    
    [_view3Controller release];
    _view3Controller = nil;
    
    
    [_view4Controller release];
    _view4Controller = nil;
    
    [_view5Controller release];
    _view5Controller = nil;
    
    [_view6Controller release];
    _view6Controller = nil;
    
    
    [_tabBarController release];
    _tabBarController = nil;
    
    
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
    _view2Controller = [[View2Controller alloc] init];
    _view3Controller = [[View3Controller alloc] init];
    _view4Controller = [[View4Controller alloc] init];
    _view5Controller = [[View5Controller alloc] init];
    _view6Controller = [[View6Controller alloc] init];
    
    _tabBarController = [[UITabBarController alloc] init];
    
    _tabBarController.viewControllers = [NSArray arrayWithObjects:_view1Controller, _view2Controller, _view3Controller, _view4Controller, _view5Controller, nil];
    
    //设置风格颜色
    _tabBarController.tabBar.tintColor = [UIColor blackColor];
    //标签栏是否透明(>= iOS7)
    _tabBarController.tabBar.translucent = NO;

    //设置bar的外观颜色 (>=iOS7)
    _tabBarController.tabBar.barTintColor = [UIColor redColor];
    
    //设置背景图片(>= iOS5)
    //_tabBarController.tabBar.backgroundImage = [UIImage imageNamed:@"backgroundImage.png"];
    
    //设置选择后的颜色 (>=iOS7)
    _tabBarController.tabBar.selectedImageTintColor = [UIColor whiteColor];
    
    [self.view addSubview:_tabBarController.view];
}


@end
