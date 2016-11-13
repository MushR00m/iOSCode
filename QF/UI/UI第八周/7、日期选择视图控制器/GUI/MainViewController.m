//
//  MainViewController.m
//  日期选择视图控制器
//
//  Created by chen cheng on 14-9-2.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    
    
    _testViewController = [[TestViewController alloc] init];
    _testViewController.delegate = self;
    _datePickerController = [[QFDatePickerController alloc] init];
    
    _navigationController = [[UINavigationController alloc] initWithRootViewController:_testViewController];
    
    [self.view addSubview:_navigationController.view];
    
}

- (void)showDatePicker
{
    [_navigationController pushViewController:_datePickerController animated:YES];
}


@end
