//
//  MainViewController.m
//  循环滚动
//
//  Created by chen cheng on 14-9-4.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)dealloc
{
    self.scrollView = nil;
    self.pageControl = nil;
    
    [_timer release];
    _timer = nil;
    
    [super dealloc];
}

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
    
    //八张图片的宽度
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width * 8, self.scrollView.bounds.size.height);
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    self.scrollView.contentOffset = CGPointMake(self.scrollView.bounds.size.width, 0);
    
    self.scrollView.delegate = self;
    
    self.scrollView.pagingEnabled = YES;
    
    for (int i=0; i<8; i++)
    {
        UIImageView   *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.scrollView.bounds.size.width, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height)];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        
        label.center = CGPointMake(imageView.bounds.size.width/2.0, imageView.bounds.size.height/2.0);
        
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:30];
        label.textColor = [UIColor redColor];
        label.layer.shadowColor = [UIColor blackColor].CGColor;
        label.layer.shadowOffset = CGSizeMake(5, 5);
        label.layer.shadowOpacity = 1;
        
        if (i == 0)
        {
            imageView.image = [UIImage imageNamed:@"6.JPG"];
            
            label.text = @"6";
        }
        else if (i == 7)
        {
            imageView.image = [UIImage imageNamed:@"1.JPG"];
            
            label.text = @"1";
        }
        else
        {
            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.JPG", i]];
            
            label.text = [NSString stringWithFormat:@"%d", i];
        }
        
        [imageView addSubview:label];
        
        [label release];
        
        
        
        [self.scrollView addSubview:imageView];
        
        [imageView release];
    }

    self.pageControl.numberOfPages = 6;
    self.pageControl.backgroundColor = [UIColor grayColor];
    
    [self.pageControl addTarget:self action:@selector(pageControlValueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)pageControlValueChanged:(id)sender
{
    NSLog(@"pageControlValueChanged");
    
    
    [self.scrollView setContentOffset:CGPointMake((self.pageControl.currentPage + 1)*self.scrollView.bounds.size.width, 0) animated:YES];
}

- (IBAction)startButtonClick:(id)sender
{
    if (_timer == nil)
    {
        //每个一秒回调 self里面的方法timerFun
        _timer = [[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFun) userInfo:nil repeats:YES] retain];
    }
}

- (void)timerFun
{
    //NSLog(@"timerFun");
    
    self.pageControl.currentPage =  (self.pageControl.currentPage+1)%6;
    
    if (self.pageControl.currentPage == 0)
    {
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            self.scrollView.contentOffset = CGPointMake(7*self.scrollView.bounds.size.width, 0);
            
        } completion:^(BOOL finished) {
            
            self.scrollView.contentOffset = CGPointMake(1*self.scrollView.bounds.size.width, 0);
        }];
    }
    else
    {
        [self.scrollView setContentOffset:CGPointMake((self.pageControl.currentPage + 1)*self.scrollView.bounds.size.width, 0) animated:YES];
    }
}



- (IBAction)stopButtonClick:(id)sender
{
    //停止定时器
    [_timer invalidate];
    
    [_timer release];
    _timer = nil;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating");
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    if (page == 7)
    {
        scrollView.contentOffset = CGPointMake(scrollView.bounds.size.width, 0);
        
        self.pageControl.currentPage = 0;
    }
    else if (page == 0)
    {
        scrollView.contentOffset = CGPointMake(scrollView.bounds.size.width * 6, 0);
        
        self.pageControl.currentPage = 5;
    }
    else
    {
        self.pageControl.currentPage = page - 1;
    }
}

@end
