//
//  AppDelegate.m
//  开关Demo
//
//  Created by chen cheng on 14-8-19.
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
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    //开关控件
    UISwitch  *switchControl = [[UISwitch alloc] initWithFrame:CGRectMake(10, 40, 0, 0)];
  

    
    //switchControl.layer.borderColor = [UIColor blackColor].CGColor;
    //switchControl.layer.borderWidth = 1;
    
    [switchControl addTarget:self action:@selector(switchControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    switchControl.on = YES;
    
    [self.window addSubview:switchControl];
    
    [switchControl release];
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)switchControlValueChanged:(UISwitch *)switchControl
{
    NSLog(@"switchControlValueChanged switchControl.on = %d", switchControl.on);
    
    
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
