//
//  QFMonthView.h
//  日期选择视图控制器
//
//  Created by chen cheng on 14-9-2.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QFMonthView : UIView
{
    UILabel  *_titleLabel;
    
    int  _year;
    int  _month;
    
    
    UIButton  *dayButtonArray[31];
}

- (void)setYear:(int)year month:(int)month;

@end
