//
//  View2Controller.m
//  导航视图控制器
//
//  Created by chen cheng on 14-8-26.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "View2Controller.h"

#import "MainViewController.h"

@interface View2Controller ()

@end

@implementation View2Controller

-(void)dealloc
{
    NSLog(@"View2Controller::dealloc");
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        self.navigationItem.title = @"视图二";
        
        //隐藏自带的返回按钮
        self.navigationItem.hidesBackButton = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"View2Controller :: viewDidLoad");
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 300, 40)];
    
    
    [button setTitle:@"上一页" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    [button release];

}

- (void)buttonClick:(id)sender
{
    [self.delegate backWithAnimated:YES];
}

@end
