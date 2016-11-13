//
//  QFDatePickerController.h
//  日期选择视图控制器
//
//  Created by chen cheng on 14-9-2.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFMonthView.h"

@class QFDatePickerController;

@protocol QFDatePickerControllerDelegate <NSObject>

- (void)datePickerController:(QFDatePickerController *)picker didFinishPickingWithYear:(int)year month:(int)month day:(int)day;

@end


@interface QFDatePickerController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView  *_scrollView;
    
    QFMonthView   *_monthView1;
    QFMonthView   *_monthView2;
    QFMonthView   *_monthView3;
    
    int _currentShowYear;
    int _currentShowMonth;
    
    int _nowYear;
    int _nowMonth;
    
    int _selectedYear;
    int _selectedMonth;
    int _selectedDay;
    
    
    id<QFDatePickerControllerDelegate> _delegate;
}

@property(assign, readwrite, nonatomic)id<QFDatePickerControllerDelegate> delegate;


- (void)setSelectedYear:(int)year month:(int)month day:(int)day;

- (void)setCurrentShowYear:(int)year currentShowMonth:(int)month;

- (void)didFinishPickingWithYear:(int)year month:(int)month day:(int)day;

@end
