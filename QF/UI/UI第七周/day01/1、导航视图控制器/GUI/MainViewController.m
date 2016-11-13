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

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
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

- (void)showView2WithAnimated:(BOOL)animated
{
    [_navigationController pushViewController:_view2Controller animated:animated];
}

- (void)backWithAnimated:(BOOL)animated
{
    [_navigationController popViewControllerAnimated:animated];
}


@end
