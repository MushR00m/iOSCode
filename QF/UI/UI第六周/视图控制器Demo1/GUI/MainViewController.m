//
//  MainViewController.m
//  视图控制器Demo1
//
//  Created by chen cheng on 14-8-21.
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

- (void)viewWillAppear:(BOOL)animated  //视图即将显示的时候会调用
{
    NSLog(@"viewWillAppear animated = %d", animated);
}

- (void)viewDidAppear:(BOOL)animated//视图即将显示完成后的会调用
{
    NSLog(@"viewDidAppear animated = %d", animated);
}


- (void)loadView
{
    [super loadView];//该函数作用是生成self.view
    
    NSLog(@"loadView");
}

- (void)viewDidLoad// 每当视图加载完成的时候、该函数会被自动回调
{
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad");
}




@end
