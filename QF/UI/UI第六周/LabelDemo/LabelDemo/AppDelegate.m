//
//  AppDelegate.m
//  LabelDemo
//
//  Created by chen cheng on 14-8-18.
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
    
    UILabel  *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 300, 400)];
    
    //默认情况下UILabel的背景颜色是透明的。
    
    
    //三分色的范围是0.0 - 1.0 alpha表示透明度 0表示完全透明、1表示完全不透明 0-1部分透明
    label.backgroundColor = [UIColor colorWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:1];
    
    //设置要显示的文本
    label.text = @"Hello GUI Hello GUI Hello GUI Hello GUI Hello GUI Hello GUI Hello GUI Hello GUI Hello GUI Hello GUI Hello GUI Hello GUI Hello GUI Hello GUI Hello GUI ";
    //设置对齐方式
    label.textAlignment = NSTextAlignmentLeft;
    //设置字体的颜色
    label.textColor = [UIColor whiteColor];
    //设置字体
    //label.font = [UIFont boldSystemFontOfSize:30];
    //label.font = [UIFont systemFontOfSize:30];
    //label.font = [UIFont italicSystemFontOfSize:30];
    label.font = [UIFont fontWithName:@"Arial" size:30];
    
    //获取系统所支持的字体
    NSArray *familyNamesArray = [UIFont familyNames];
    for (int i=0; i<[familyNamesArray count]; i++)
    {
        NSString  *fontName = [familyNamesArray objectAtIndex:i];
        NSLog(@"fontName = %@", fontName);
    }
    
    //设置显示的最大行数、如果设置成0、表示可以显示任意多行
    label.numberOfLines = 0;
    //label.numberOfLines = 0;
    
    //设置换行模式
    label.lineBreakMode = NSLineBreakByWordWrapping;
    
    
    [self.window addSubview:label];
    
    [label release];
    
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
