//
//  MainViewController.m
//  滑动返回
//
//  Created by chen songqi on 15/6/17.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.scrollView.layer.borderColor = [UIColor redColor].CGColor;
    self.scrollView.layer.borderWidth = 1;

    self.scrollView.contentSize = CGSizeMake(200*3, 200);
    [self.view addSubview:self.scrollView];

}


@end
