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
    
    
    
    _label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
    _label1.backgroundColor = [UIColor darkGrayColor];
    _label1.text = @"1";
    _label1.textColor = [UIColor whiteColor];
    _label1.textAlignment = NSTextAlignmentCenter;
    
    [_scrollView addSubview:_label1];
    
    
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(300, 0, 80, 40)];
    _label2.backgroundColor = [UIColor darkGrayColor];
    _label2.text = @"2";
    _label2.textColor = [UIColor whiteColor];
    _label2.textAlignment = NSTextAlignmentCenter;
    
    [_scrollView addSubview:_label2];
    
    
    _label3 = [[UILabel alloc] initWithFrame:CGRectMake(600, 0, 80, 40)];
    _label3.backgroundColor = [UIColor darkGrayColor];
    _label3.text = @"3";
    _label3.textColor = [UIColor whiteColor];
    _label3.textAlignment = NSTextAlignmentCenter;
    
    [_scrollView addSubview:_label3];
    

    _currentPage = 2;
    _scrollView.contentOffset = CGPointMake((_currentPage-1)*300, 0);
    
    _scrollView.delegate = self;
}


- (void)scrollViewDidEndDecelerating: (UIScrollView *)scrollView
{
//    if (scrollView.contentOffset.x == 600)
//    {
//        _currentPage++;
//    }
//    else if (scrollView.contentOffset.x == 0)
//    {
//        _currentPage--;
//    }
    
//    _label1.text = [NSString stringWithFormat:@"%d", _currentPage-1];
//    _label2.text = [NSString stringWithFormat:@"%d", _currentPage];
//    _label3.text = [NSString stringWithFormat:@"%d", _currentPage+1];
    
    [_scrollView setContentOffset:CGPointMake(300, 0) animated:NO];

}



@end
