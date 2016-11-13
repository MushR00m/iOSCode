//
//  AppDelegate.m
//  HelloGUI
//
//  Created by chen cheng on 14-8-18.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "AppDelegate.h"
#import "MainView.h"

@implementation AppDelegate


- (void)dealloc
{
    self.window = nil;
    
    [super dealloc];
}

//当应用程序启动的时候该函数会被回调、返回值为真表示启动成功。
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /**
     *  1、创建了一个窗口UIWindow、一般情况下一个应用程序只需要创建一个窗口。所有的窗口都是依附在屏幕之上。应用程序只有一个屏幕（mainScreen）2、bounds属性：在自身坐标系下面的左上角以及宽和高 3、frame: 这个是在它父视图坐标系下的左上角以及宽和高。4、- (id)initWithFrame:(CGRect)frame; 这事UIView定义对额一个初始化函数
     */
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    
    //这里的目的是把应用程序逻辑和UI逻辑分开、一hi界面无论多复杂、AppDelegate类永远保持相对简洁
    MainView *mainView = [[MainView alloc] initWithFrame:self.window.bounds];
    
    [self.window addSubview:mainView];
    
    [mainView release];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
