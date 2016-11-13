//
//  View1Controller.h
//  导航视图控制器
//
//  Created by chen cheng on 14-8-26.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface View1Controller : UIViewController
{
    UIColor          *_backgroundColor;
    MainViewController *_delegate;
}

@property(assign, readwrite, nonatomic)MainViewController *delegate;

@property(retain, readwrite, nonatomic) UIColor *backgroundColor;

-(void)QF_viewDidUnload;


@end
