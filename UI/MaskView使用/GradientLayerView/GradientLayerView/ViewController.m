//
//  ViewController.m
//  GradientLayerView
//
//  Created by YouXianMing on 15/5/5.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 加载图片
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 200, 200)];
    imageView.image        = [UIImage imageNamed:@"base.png"];
    [self.view addSubview:imageView];
    
    // 创建出CAGradientLayer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame            = imageView.bounds;
    gradientLayer.colors           = @[(__bridge id)[UIColor clearColor].CGColor,
                                       (__bridge id)[UIColor blackColor].CGColor,
                                       (__bridge id)[UIColor clearColor].CGColor];
    gradientLayer.locations        = @[@(0.25), @(0.5), @(0.75)];
    gradientLayer.startPoint       = CGPointMake(0, 0);
    gradientLayer.endPoint         = CGPointMake(1, 0);
    
    // 容器view --> 用于加载创建出的CAGradientLayer
    UIView *containerView = [[UIView alloc] initWithFrame:imageView.bounds];
    [containerView.layer addSublayer:gradientLayer];
    
    // 设定maskView
    imageView.maskView  = containerView;
    
    CGRect frame        = containerView.frame;
    frame.origin.x     -= 200;
    
    // 重新赋值
    containerView.frame = frame;
    
    // 给maskView做动画效果
    [UIView animateWithDuration:3.f animations:^{
        // 改变位移
        CGRect frame        = containerView.frame;
        frame.origin.x     += 400;
        
        // 重新赋值
        containerView.frame = frame;
    }];
}


@end
