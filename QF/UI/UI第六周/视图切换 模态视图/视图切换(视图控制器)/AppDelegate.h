//
//  AppDelegate.h
//  视图切换(视图控制器)
//
//  Created by chen cheng on 14-8-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

+(AppDelegate *)shareAppDelegate;

@property (retain, nonatomic) UIWindow *window;

@end
