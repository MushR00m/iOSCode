//
//  ViewController.m
//  FeedBack
//
//  Created by YouXianMing on 15/5/6.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "UIView+SetRect.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 前景图
    UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    background.image        = [UIImage imageNamed:@"base"];
    background.center       = self.view.center;
    [self.view addSubview:background];
    
    
    // 背景图
    UIImageView *upGround = [[UIImageView alloc] initWithFrame:background.frame];
    upGround.image        = [UIImage imageNamed:@"background"];
    [self.view addSubview:upGround];
    
    
    // maskView
    UIView *mask      = [[UIView alloc] initWithFrame:upGround.bounds];
    upGround.maskView = mask;
    
    
    // 图片1
    UIImageView *picOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 400)];
    picOne.image        = [UIImage imageNamed:@"1"];
    [mask addSubview:picOne];
    
    
    // 图片2
    UIImageView *picTwo = [[UIImageView alloc] initWithFrame:CGRectMake(100, -200, 100, 400)];
    picTwo.image        = [UIImage imageNamed:@"2"];
    [mask addSubview:picTwo];
    
    
    // 动画
    [UIView animateWithDuration:4.f delay:5.f options:0 animations:^{
        picOne.y -= 400;
        picTwo.y += 400;
    } completion:^(BOOL finished) {
        
    }];
}

@end
