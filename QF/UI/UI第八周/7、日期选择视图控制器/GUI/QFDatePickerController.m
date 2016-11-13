//
//  QFDatePickerController.m
//  日期选择视图控制器
//
//  Created by chen cheng on 14-9-2.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFDatePickerController.h"

@interface QFDatePickerController ()

@end

@implementation QFDatePickerController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.navigationItem.title = @"选择日期";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 415)];
    

    _scrollView.layer.borderColor = [UIColor blackColor].CGColor;
    _scrollView.layer.borderWidth = 1;
    
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * 3,0);
    
    _scrollView.alwaysBounceVertical = NO;
    
    _scrollView.contentOffset = CGPointMake(_scrollView.frame.size.width, 0);
    
    [self.view addSubview:_scrollView];
    
    
    
    _monthView1 = [[QFMonthView alloc] initWithFrame:CGRectMake(0, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
    
    
    _cureentYear = 2014;
    _cureentMonth = 9;
    
    [_monthView1 setYear:_cureentYear month:_cureentMonth];
    
    [_scrollView addSubview:_monthView1];
    
    
    _monthView2 = [[QFMonthView alloc] initWithFrame:CGRectMake(_scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
    
    [_monthView2 setYear:2014 month:9];
    
    [_scrollView addSubview:_monthView2];
    
    _scrollView.pagingEnabled = YES;
    
    _scrollView.delegate = self;
    
    _monthView3 = [[QFMonthView alloc] initWithFrame:CGRectMake(_scrollView.frame.size.width*2, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
    
    [_monthView3 setYear:2014 month:10];
    
    [_scrollView addSubview:_monthView3];
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x != 320)
    {
        if (scrollView.contentOffset.x > 320)
        {
            _cureentMonth++;
            if (_cureentMonth > 12)
            {
                _cureentMonth = 1;
                _cureentYear++;
            }
        }
        else if (scrollView.contentOffset.x < 320)
        {
            _cureentMonth--;
            if (_cureentMonth == 0)
            {
                _cureentMonth = 12;
                _cureentYear--;
            }
        }
        
        
        if (_cureentMonth == 1)
        {
            [_monthView1 setYear:_cureentYear-1 month:12];
            [_monthView2 setYear:_cureentYear month:_cureentMonth];
            [_monthView3 setYear:_cureentYear month:_cureentMonth+1];
        }
        else if (_cureentMonth == 12)
        {
            [_monthView1 setYear:_cureentYear month:_cureentMonth-1];
            [_monthView2 setYear:_cureentYear month:_cureentMonth];
            [_monthView3 setYear:_cureentYear+1 month:1];
        }
        else
        {
            [_monthView1 setYear:_cureentYear month:_cureentMonth-1];
            [_monthView2 setYear:_cureentYear month:_cureentMonth];
            [_monthView3 setYear:_cureentYear month:_cureentMonth+1];
        }
        
        [_scrollView setContentOffset:CGPointMake(320, 0)];
    }
}


@end
