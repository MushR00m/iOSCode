//
//  AppDelegate.m
//  多个窗口
//
//  Created by chen cheng on 14-8-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    self.window = nil;
    
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[QFWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    
    UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(10, 50, 300, 40);
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:button];
    
    NSLog(@"UIWindowLevelNormal = %f UIWindowLevelAlert = %f UIWindowLevelStatusBar = %f", UIWindowLevelNormal, UIWindowLevelAlert, UIWindowLevelStatusBar);
    
    
    self.window.windowLevel = UIWindowLevelNormal;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
//    UIWindow   *window2 = [[UIWindow alloc] initWithFrame:CGRectMake(10, 50, 300, 300)];
//    
//    window2.windowLevel = UIWindowLevelStatusBar;
//    
//    window2.backgroundColor = [UIColor redColor];
//    [window2 makeKeyAndVisible];
    
    //[window2 release];
    
    
    return YES;
}

- (void)buttonClick:(id)sender
{
    UIAlertView  *alertView = [[UIAlertView alloc] initWithTitle:@"test" message:@"test" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alertView show];
    
    [alertView release];
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
