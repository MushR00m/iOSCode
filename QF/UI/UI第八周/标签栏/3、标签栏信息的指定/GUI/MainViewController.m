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

    
    self.viewControllers = [NSArray arrayWithObjects:_view1Controller, _view2Controller, _view3Controller, _view4Controller, _view5Controller, nil];
    
}


@end
