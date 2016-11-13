//
//  TestViewController.h
//  日期选择视图控制器
//
//  Created by chen cheng on 14-9-2.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface TestViewController : UIViewController
{
    MainViewController *_delegate;
    
    
    UILabel   *_dateLabel;
}

@property(assign, readwrite, nonatomic)MainViewController *delegate;

- (void)setDateWithYear:(int)year month:(int)month day:(int)day;

@end
