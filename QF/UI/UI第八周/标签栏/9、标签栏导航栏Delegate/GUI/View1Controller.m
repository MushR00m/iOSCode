//
//  View1Controller.m
//  标签栏视图控制器
//
//  Created by chen cheng on 14-9-3.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "View1Controller.h"

@interface View1Controller ()

@end

@implementation View1Controller

- (id)init
{
    self = [super init];
    if (self)
    {
        //UITabBarItem不是UIView的子类、这里仅仅是告诉UITabBarController如何绘制我的标签栏
        self.tabBarItem = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1] autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"View1Controller :: viewDidLoad");
    
    self.view.backgroundColor = [UIColor greenColor];
    
    
    _view1_1Controller = [[View1_1Controller alloc] init];
    _view1_1Controller.delegate = self;
    
    _view1_2Controller = [[View1_2Controller alloc] init];
    
    
    _navigationController = [[UINavigationController alloc] initWithRootViewController:_view1_1Controller];
    
    _navigationController.delegate = self;
    
    [self.view addSubview:_navigationController.view];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //NSLog(@"willShowViewController viewController = %@", viewController);
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //NSLog(@"didShowViewController viewController = %@", viewController);
}

- (void)QF_didReceiveMemoryWarning
{
    if (_navigationController.topViewController == _view1_1Controller)
    {
        [_view1_2Controller QF_viewDidUnload];
    }
    else if (_navigationController.topViewController == _view1_2Controller)
    {
        [_view1_1Controller QF_viewDidUnload];
    }
}

- (void)QF_viewDidUnload
{
    self.view = nil;
    
    [_view1_1Controller release];
    _view1_1Controller = nil;
    
    [_view1_2Controller release];
    _view1_2Controller = nil;
    
    [_navigationController release];
    _navigationController = nil;
}




- (void)showView1_2
{
    [_navigationController pushViewController:_view1_2Controller animated:YES];
}


@end
