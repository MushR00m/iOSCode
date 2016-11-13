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
    _view1Controller = [[View1Controller alloc] init];
    _view1Controller.delegate = self;
    
    _view2Controller = [[View2Controller alloc] init];
    _view2Controller.delegate = self;

    self = [super initWithRootViewController:_view1Controller];
    if (self == nil)
    {
        [_view1Controller release];
        _view1Controller= nil;
        
        [_view2Controller release];
        _view2Controller = nil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)showView2WithAnimated:(BOOL)animated
{
    [self pushViewController:_view2Controller animated:animated];
}

- (void)backWithAnimated:(BOOL)animated
{
    [self popViewControllerAnimated:animated];
}


@end
