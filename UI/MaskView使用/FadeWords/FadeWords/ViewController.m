//
//  ViewController.m
//  FadeWords
//
//  Created by YouXianMing on 15/5/7.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "FadeString.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    
    // 创建FadeString
    FadeString *fadeString = [[FadeString alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    fadeString.text        = @"极客学院iOS开发";
    fadeString.center      = self.view.center;
    [self.view addSubview:fadeString];
    
    
    // 执行动画效果
    [fadeString fadeRight];
}

@end
