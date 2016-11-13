//
//  View2Controller.m
//  视图切换(视图控制器)
//
//  Created by chen cheng on 14-8-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "View2Controller.h"
#import "MainViewController.h"

@interface View2Controller ()

@end

@implementation View2Controller

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
    NSLog(@"View2Controller :: loadView");
}

- (void)viewDidLoad//懒汉模式
{
    [super viewDidLoad];
    
    NSLog(@"View2Controller :: viewDidLoad");
    
    self.view.backgroundColor = [UIColor greenColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"上一页" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 50, 320, 40);
    button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"View2Controller :: viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"View2Controller :: viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"View2Controller :: viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"View2Controller :: viewDidDisappear");
}

- (void)QF_viewDidUnload
{
    NSLog(@"View2Controller :: QF_viewDidUnload");
    self.view = nil;
}
- (void)buttonClick:(id)sender
{
    [[MainViewController shareMainViewController] backView1WithAnimated:YES];
}


@end
