//
//  View1Controller.m
//  滚动视图的contentInset
//
//  Created by chen cheng on 14-9-3.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "View1Controller.h"

@interface View1Controller ()

@end

@implementation View1Controller

- (id)init
{
    self = [super init];
    if (self)
    {
        self.navigationItem.title = @"视图1";
        
        //self.edgesForExtendedLayout =  UIRectEdgeLeft | UIRectEdgeRight;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 80, 300, 300)];
    
    _scrollView.layer.borderColor = [UIColor blackColor].CGColor;
    _scrollView.layer.borderWidth = 1;
    
    
    UILabel  *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.backgroundColor = [UIColor redColor];
    
    _scrollView.alwaysBounceVertical = YES;
    
    [_scrollView addSubview:label];
    
    [label release];
    
    
    _scrollView.contentSize = CGSizeMake(300, 300);

    
    //让滚动视图的滚动条在上方留出100的距离。
    _scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(100, 0, 0, 0);
    
    //让滚动视图在上方的contentSize多出100。此例当中就相当于contentSize等于CGSizeMake(400, 300)
    //_scrollView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    
    //重要提示
    //如果当前视图控制的self.edgesForExtendedLayout属性是全屏布局的、对象_scrollView的属性scrollIndicatorInsets和属性contentInset的值会被改变
    
    
    _scrollView.delegate = self;
    
    [self.view addSubview:_scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    NSLog(@"scrollView.contentOffset.y = %f", scrollView.contentOffset.y);
}

@end
