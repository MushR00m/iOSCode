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
    NSLog(@"viewDidLoad");
    
    _view1Controller = [[View1Controller alloc] init];
    _view1Controller.delegate = self;
    
    _view2Controller = [[View2Controller alloc] init];
    _view2Controller.delegate = self;
    
    _navigationController = [[UINavigationController alloc] initWithRootViewController:_view1Controller];
    
    //NSLog(@"_navigationController.viewControllers = %@", _navigationController.viewControllers);
    
    _navigationController.view.frame = self.view.bounds;
    [self.view addSubview:_navigationController.view];
}

- (void)showView2WithAnimated:(BOOL)animated
{
    [_navigationController pushViewController:_view2Controller animated:animated];
    
   // NSLog(@"_navigationController.viewControllers = %@", _navigationController.viewControllers);
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
    //当前显示的不是视图1  所以卸载视图1
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
