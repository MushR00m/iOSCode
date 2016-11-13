//
//  MainViewController.m
//  滚动视图
//
//  Created by chen cheng on 14-8-29.
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
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 40, 300, 400)];
    _scrollView.layer.borderColor = [UIColor blackColor].CGColor;
    _scrollView.layer.borderWidth = 1;
    [self.view addSubview:_scrollView];
    
    
    //设置滚动视图内容的大小
    _scrollView.contentSize = CGSizeMake(600, 400);
    
    //垂直方向永远不可以拉动
    _scrollView.alwaysBounceVertical = NO;
    
    //水平方向永远可以拉动
    _scrollView.alwaysBounceHorizontal = YES;
    
    //只能停靠在整数页的地方
    _scrollView.pagingEnabled = YES;
    
    //影藏水平滚动条
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    //影藏垂直滚动条
    _scrollView.showsVerticalScrollIndicator = NO;
    
    
    _scrollView.delegate = self;
    
    
    UILabel  *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
    label1.backgroundColor = [UIColor darkGrayColor];
    label1.text = @"1";
    label1.textColor = [UIColor whiteColor];
    label1.textAlignment = NSTextAlignmentCenter;
    
    [_scrollView addSubview:label1];
    [label1 release];
    
    UILabel  *label2 = [[UILabel alloc] initWithFrame:CGRectMake(300, 0, 80, 40)];
    label2.backgroundColor = [UIColor darkGrayColor];
    label2.text = @"2";
    label2.textColor = [UIColor whiteColor];
    label2.textAlignment = NSTextAlignmentCenter;
    
    [_scrollView addSubview:label2];
    [label2 release];

    
    
    
    UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    button.frame = CGRectMake(10, 430, 300, 40);
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
}

- (void)buttonClick:(id)sender
{
    NSLog(@"buttonClick");
    
    [_scrollView setContentOffset:CGPointMake(300, 0) animated:YES];
}

//正在滚动的时候会被回调
- (void)scrollViewDidScroll: (UIScrollView *)scrollView
{
    NSLog(@"11 scrollViewDidScroll");
}

//即将开始拖动的时候会被回调
- (void)scrollViewWillBeginDragging: (UIScrollView *)scrollView
{
    NSLog(@"22 scrollViewWillBeginDragging");
}

//即拖动结束的时候会被回调 decelerate表示拖动结束后是否继续做减速远点
- (void)scrollViewDidEndDragging: (UIScrollView *)scrollView
                  willDecelerate:(BOOL)decelerate
{
    NSLog(@"33 scrollViewDidEndDragging decelerate = %d", decelerate);
}

//即将开始做减速运动时会被回调
- (void)scrollViewWillBeginDecelerating: (UIScrollView *)scrollView
{
    NSLog(@"44 scrollViewWillBeginDecelerating");
}

//减速运动结束时会被回调
- (void)scrollViewDidEndDecelerating: (UIScrollView *)scrollView
{
    NSLog(@"55 scrollViewDidEndDecelerating");
}


@end
