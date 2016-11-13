//
//  QFDatePickerController.m
//  日期选择视图控制器
//
//  Created by chen cheng on 14-9-2.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFDatePickerController.h"
#import <time.h>

@interface QFDatePickerController ()

@end

@implementation QFDatePickerController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.navigationItem.title = @"日期";
        
        self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight;
        
        time_t now;
        
        time(&now);
    
        struct tm *nowInfo = localtime(&now);

        
        _nowYear = nowInfo->tm_year+1900;
        _nowMonth = nowInfo->tm_mon+1;
        
        _currentShowYear = _nowYear;
        _currentShowMonth = _nowMonth;
        
        _selectedYear = _nowYear;
        _selectedMonth = _nowMonth;
        _selectedDay = nowInfo->tm_mday;
    }
    return self;
}

- (void)setSelectedYear:(int)year month:(int)month day:(int)day
{
    _selectedYear = year;
    _selectedMonth = month;
    _selectedDay = day;
    
    [self updateDateView];

}


- (void)setCurrentShowYear:(int)year currentShowMonth:(int)month
{
    _currentShowYear = year;
    _currentShowMonth = month;
    
    if ([self isViewLoaded])
    {
        //刷新显示
        [self updateDateView];
    }
}

- (void)updateDateView
{
    if (_currentShowMonth == 1)
    {
        [_monthView1 setYear:_currentShowYear-1 month:12];
        [_monthView2 setYear:_currentShowYear month:_currentShowMonth];
        [_monthView3 setYear:_currentShowYear month:_currentShowMonth+1];

        if (_selectedYear == _currentShowYear-1
            && _selectedMonth == 12)
        {
            [_monthView1 setSelectedDay:_selectedDay];
        }
        else
        {
            
             [_monthView1 setSelectedDay:-1];
        }
        
        if (_selectedYear == _currentShowYear
            && _selectedMonth == _currentShowMonth)
        {
            [_monthView2 setSelectedDay:_selectedDay];
        }
        else
        {
            [_monthView2 setSelectedDay:-1];
        }
        
        if (_selectedYear == _currentShowYear
            && _selectedMonth == _currentShowMonth+1)
        {
            [_monthView3 setSelectedDay:_selectedDay];
        }
        else
        {
            [_monthView3 setSelectedDay:-1];
        }

        
    }
    else if (_currentShowMonth == 12)
    {
        [_monthView1 setYear:_currentShowYear month:_currentShowMonth-1];
        [_monthView2 setYear:_currentShowYear month:_currentShowMonth];
        [_monthView3 setYear:_currentShowYear+1 month:1];
        
        if (_selectedYear == _currentShowYear
            && _selectedMonth == _currentShowMonth-1)
        {
            [_monthView1 setSelectedDay:_selectedDay];
        }
        else
        {
            [_monthView1 setSelectedDay:-1];
        }
        
        
        if (_selectedYear == _currentShowYear
            && _selectedMonth == _currentShowMonth)
        {
            [_monthView2 setSelectedDay:_selectedDay];
        }
        else
        {
            [_monthView2 setSelectedDay:-1];
        }
        
        if (_selectedYear == _currentShowYear+1
            && _selectedMonth == 1)
        {
            [_monthView3 setSelectedDay:_selectedDay];
        }
        else
        {
            [_monthView3 setSelectedDay:-1];
        }
    }
    else
    {
        [_monthView1 setYear:_currentShowYear month:_currentShowMonth-1];
        [_monthView2 setYear:_currentShowYear month:_currentShowMonth];
        [_monthView3 setYear:_currentShowYear month:_currentShowMonth+1];
        
        if (_selectedYear == _currentShowYear
            && _selectedMonth == _currentShowMonth-1)
        {
            [_monthView1 setSelectedDay:_selectedDay];
        }
        else
        {
            [_monthView1 setSelectedDay:-1];
        }
        
        if (_selectedYear == _currentShowYear
            && _selectedMonth == _currentShowMonth)
        {
            [_monthView2 setSelectedDay:_selectedDay];
        }
        else
        {
            [_monthView2 setSelectedDay:-1];
        }
        
        if (_selectedYear == _currentShowYear
            && _selectedMonth == _currentShowMonth+1)
        {
            [_monthView3 setSelectedDay:_selectedDay];
        }
        else
        {
            [_monthView3 setSelectedDay:-1];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-70)];
    
    
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * 3, 0);
    
    _scrollView.contentOffset = CGPointMake(_scrollView.frame.size.width, 0);
    
    [self.view addSubview:_scrollView];
    
    
    _monthView1 = [[QFMonthView alloc] initWithFrame:CGRectMake(0, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
    _monthView1.delegate = self;
    [_scrollView addSubview:_monthView1];
    
    
    _monthView2 = [[QFMonthView alloc] initWithFrame:CGRectMake(_scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
    _monthView2.delegate = self;
    
    [_scrollView addSubview:_monthView2];
    
    _scrollView.pagingEnabled = YES;
    
    _scrollView.delegate = self;
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    _monthView3 = [[QFMonthView alloc] initWithFrame:CGRectMake(_scrollView.frame.size.width*2, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
    
    _monthView3.delegate = self;
    [_scrollView addSubview:_monthView3];
    
    
    [self updateDateView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x != 320)
    {
        if (scrollView.contentOffset.x > 320)
        {
            _currentShowMonth++;
            if (_currentShowMonth > 12)
            {
                _currentShowMonth = 1;
                _currentShowYear++;
            }
        }
        else if (scrollView.contentOffset.x < 320)
        {
            _currentShowMonth--;
            if (_currentShowMonth == 0)
            {
                _currentShowMonth = 12;
                _currentShowYear--;
            }
        }
        
        
        [self updateDateView];
        
        [_scrollView setContentOffset:CGPointMake(320, 0)];
    }
}

- (void)didFinishPickingWithYear:(int)year month:(int)month day:(int)day
{
    _selectedYear = year;
    _selectedMonth = month;
    _selectedDay = day;
    
    //在本例当中  这里是调用主视图的方法
    //[self.delegate datePickerController:self didFinishPickingWithYear:year month:month day:day];
}


@end
