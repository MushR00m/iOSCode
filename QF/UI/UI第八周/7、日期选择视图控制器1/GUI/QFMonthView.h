//
//  QFMonthView.h
//  日期选择视图控制器
//
//  Created by chen cheng on 14-9-2.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QFDatePickerController;

@interface QFMonthView : UIView
{
    UILabel  *_titleLabel;
    
    int  _year;
    int  _month;
    
    int _nowYear;
    int _nowMonth;
    int _nowDay;
    
    
    UIButton  *dayButtonArray[31];
    
    QFDatePickerController *_delegate;
    
    UIImageView  *_selectedDayImageView;
}

@property(assign, readwrite, nonatomic)QFDatePickerController *delegate;

- (void)setYear:(int)year month:(int)month;

- (void)setSelectedDay:(int)day;

@end
