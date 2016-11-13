//
//  QFDatePickerController.h
//  日期选择视图控制器
//
//  Created by chen cheng on 14-9-2.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFMonthView.h"

@interface QFDatePickerController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView  *_scrollView;
    
    QFMonthView   *_monthView1;
    QFMonthView   *_monthView2;
    QFMonthView   *_monthView3;
    
    int _cureentYear;
    int _cureentMonth;
}

@end
