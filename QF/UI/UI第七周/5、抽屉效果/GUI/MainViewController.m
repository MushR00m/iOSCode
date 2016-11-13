//
//  MainViewController.m
//  抽屉效果
//
//  Created by chen cheng on 14-8-28.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingButton setTitle:@"设置" forState:UIControlStateNormal];
    [settingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    settingButton.frame = CGRectMake(10, 30, 50, 40);
    [settingButton addTarget:self action:@selector(settingButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:settingButton];
    
    
    self.leftDrawerViewController = [[[LeftDrawerViewController alloc] init] autorelease];
}

- (void)settingButtonClick:(id)sender
{
    [self showLeftLeftDrawerView];
}


@end
