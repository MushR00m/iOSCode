//
//  View1_1Controller.h
//  标签栏视图控制器
//
//  Created by chen cheng on 14-9-3.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class View1Controller;

@interface View1_1Controller : UIViewController
{
    View1Controller *_delegate;
}

@property(assign, readwrite, nonatomic)View1Controller *delegate;

@end
