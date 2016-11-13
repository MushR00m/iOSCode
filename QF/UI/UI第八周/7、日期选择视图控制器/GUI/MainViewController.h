//
//  MainViewController.h
//  日期选择视图控制器
//
//  Created by chen cheng on 14-9-2.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestViewController.h"
#import "QFDatePickerController.h"

@interface MainViewController : UIViewController
{
    TestViewController  *_testViewController;
    QFDatePickerController *_datePickerController;
    
    UINavigationController *_navigationController;
}

- (void)showDatePicker;

@end
