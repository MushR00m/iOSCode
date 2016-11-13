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
    
    self.view.backgroundColor = [UIColor greenColor];
    
    
    _view1_1Controller = [[View1_1Controller alloc] init];
    _view1_1Controller.delegate = self;
    _view1_2Controller = [[View1_2Controller alloc] init];
    
    
    _navigationController = [[UINavigationController alloc] initWithRootViewController:_view1_1Controller];
    
    
    [self.view addSubview:_navigationController.view];
    
}

- (void)showView1_2
{
    [_navigationController pushViewController:_view1_2Controller animated:YES];
}


@end
