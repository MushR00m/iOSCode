//
//  View1Controller.m
//  视图切换(视图控制器)
//
//  Created by chen cheng on 14-8-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "View1Controller.h"
#import "MainViewController.h"

@interface View1Controller ()

@end

@implementation View1Controller

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    NSLog(@"View1Controller :: loadView");
}

- (void)viewDidLoad//懒汉模式
{
    [super viewDidLoad];
    
    NSLog(@"View1Controller :: viewDidLoad");
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 50, 320, 40);
    button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"View1Controller :: viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"View1Controller :: viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"View1Controller :: viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"View1Controller :: viewDidDisappear");
}

- (void)QF_viewDidUnload
{
    NSLog(@"View1Controller :: QF_viewDidUnload");
    self.view = nil;
}

- (void)buttonClick:(id)sender
{
    NSLog(@"buttonClick");
    [[MainViewController shareMainViewController] showView2WithAnimated:YES];
}


@end
