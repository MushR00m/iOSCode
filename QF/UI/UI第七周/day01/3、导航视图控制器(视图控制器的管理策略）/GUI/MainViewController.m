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
    
    [view1Controller release];
    
    _navigationController.view.frame = self.view.bounds;
    [self.view addSubview:_navigationController.view];
}

- (void)showView2WithAnimated:(BOOL)animated
{
    //这种管理策略：是把所有试图控制器分散到各个函数的局部表中、不便于集中管理、不推荐使用
    View2Controller *view2Controller = [[View2Controller alloc] init];
    view2Controller.delegate = self;
    
    [_navigationController pushViewController:view2Controller animated:animated];
    
    [view2Controller release];
}

- (void)backWithAnimated:(BOOL)animated
{
    [_navigationController popViewControllerAnimated:animated];
}


@end
