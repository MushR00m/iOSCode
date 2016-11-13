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
    _scrollView.contentSize = CGSizeMake(900, 400);
    
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
    
    UILabel  *label3 = [[UILabel alloc] initWithFrame:CGRectMake(600, 0, 80, 40)];
    label3.backgroundColor = [UIColor darkGrayColor];
    label3.text = @"3";
    label3.textColor = [UIColor whiteColor];
    label3.textAlignment = NSTextAlignmentCenter;
    
    [_scrollView addSubview:label3];
    [label3 release];

    _scrollView.delegate = self;

    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 440, 320, 40)];
    
    _pageControl.backgroundColor = [UIColor grayColor];
    
    _pageControl.numberOfPages = 3;
    
    [_pageControl addTarget:self action:@selector(pageControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_pageControl];
}

- (void)buttonClick:(id)sender
{
    NSLog(@"buttonClick");
    
    [_scrollView setContentOffset:CGPointMake(300, 0) animated:YES];
}

- (void)scrollViewDidEndDecelerating: (UIScrollView *)scrollView
{
    NSLog(@"scrollView page = %f", scrollView.contentOffset.x/scrollView.frame.size.width);
    
    _pageControl.currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;
}

- (void)pageControlValueChanged:(UIPageControl *)pageControl
{
    [_scrollView setContentOffset:CGPointMake(pageControl.currentPage * _scrollView.frame.size.width, 0) animated:YES];
}



@end
