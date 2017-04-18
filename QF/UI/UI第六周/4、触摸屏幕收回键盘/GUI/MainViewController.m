//
//  MainViewController.m
//  触摸屏幕收回键盘
//
//  Created by chen cheng on 14-8-22.
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
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UITextField  *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, 300, 40)];
    
    textField.borderStyle = UITextBorderStyleLine;
    
    [self.view addSubview:textField];
    
    [textField release];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 120, 100, 40);
    [btn setTitle:@"测试" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(testMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)testMethod
{
    NSLog(@"testMethod");
    [self showViewController:[UIViewController new] sender:nil];
}

@end
