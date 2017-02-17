//
//  ViewController.m
//  MaskViewLesson
//
//  Created by YouXianMing on 15/5/4.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *baseImageView;
@property (nonatomic, strong) UIImageView *maskImageView;
@property (nonatomic, strong) UIImageView *addImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat width = 120;
    
    // 底图
    self.baseImageView       = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, width, width)];
    self.baseImageView.image = [UIImage imageNamed:@"base"];
    [self.view addSubview:self.baseImageView];
    
    // mask
    self.maskImageView       = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20 + width + 20, width, width)];
    self.maskImageView.image = [UIImage imageNamed:@"mask"];
    [self.view addSubview:self.maskImageView];
    
    // 使用maskView的情况
    self.addImageView       = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20 + (width + 20) * 2, width, width)];
    [self.view addSubview:self.addImageView];
    self.addImageView.image = [UIImage imageNamed:@"base"];
    UIImageView *mask          = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    mask.image                 = [UIImage imageNamed:@"mask"];
    
    // maskView并不能用addSubview来添加遮罩,这点千万注意
    self.addImageView.maskView = mask;
    
    
}

@end
