//
//  View2Controller.h
//  导航视图控制器
//
//  Created by chen cheng on 14-8-26.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface View2Controller : UIViewController
{
    MainViewController *_delegate;
}


@property(assign, readwrite, nonatomic)MainViewController *delegate;

-(void)QF_viewDidUnload;

@end
