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
    
    NSLog(@"MainViewController :: viewDidLoad");
    
    _view1Controller = [[View1Controller alloc] init];
    _view2Controller = [[View2Controller alloc] init];
    _view3Controller = [[View3Controller alloc] init];
    _view4Controller = [[View4Controller alloc] init];
    _view5Controller = [[View5Controller alloc] init];
    
    
    _tabBarController = [[UITabBarController alloc] init];
    
    _tabBarController.viewControllers = [NSArray arrayWithObjects:_view1Controller, _view2Controller, _view3Controller, _view4Controller, _view5Controller, nil];
    
    _tabBarController.delegate = self;
    
    [self.view addSubview:_tabBarController.view];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"didSelectViewController viewController = %@", viewController);
    NSLog(@"didSelectViewController tabBarController = %@", tabBarController);

}

- (void)didReceiveMemoryWarning
{
    if (_tabBarController.selectedIndex == 0)
    {
        //卸载view1_1或者view1_2
        [_view1Controller QF_didReceiveMemoryWarning];
        
        //卸载其他视图控制器的视图
        [_view2Controller QF_viewDidUnload];
        [_view3Controller QF_viewDidUnload];
        [_view4Controller QF_viewDidUnload];
        [_view5Controller QF_viewDidUnload];
    }
    else if (_tabBarController.selectedIndex == 1)
    {
        [_view1Controller QF_viewDidUnload];
        [_view3Controller QF_viewDidUnload];
        [_view4Controller QF_viewDidUnload];
        [_view5Controller QF_viewDidUnload];
    }
    else if (_tabBarController.selectedIndex == 2)
    {
        [_view1Controller QF_viewDidUnload];
        [_view2Controller QF_viewDidUnload];
        [_view4Controller QF_viewDidUnload];
        [_view5Controller QF_viewDidUnload];
    }
    else if (_tabBarController.selectedIndex == 3)
    {
        [_view1Controller QF_viewDidUnload];
        [_view2Controller QF_viewDidUnload];
        [_view3Controller QF_viewDidUnload];
        [_view5Controller QF_viewDidUnload];
    }
    else if (_tabBarController.selectedIndex == 4)
    {
        [_view1Controller QF_viewDidUnload];
        [_view2Controller QF_viewDidUnload];
        [_view3Controller QF_viewDidUnload];
        [_view4Controller QF_viewDidUnload];
    }
    
    
    
    
}


@end
