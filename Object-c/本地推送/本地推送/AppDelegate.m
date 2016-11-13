//
//  AppDelegate.m
//  本地推送
//
//  Created by chensongqi on 16/9/19.
//  Copyright © 2016年 chensongqi. All rights reserved.
//


/**
 参考链接
 http://www.cnblogs.com/kenshincui/p/4168532.html
 
 */
#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //如果已经获得发送通知的授权则创建本地通知，否则请求授权(注意：如果不请求授权在设置中是没有对应的通知设置项的，也就是说如果从来没有发送过请求，即使通过设置也打不开消息允许设置)
    if ([[UIApplication sharedApplication] currentUserNotificationSettings].types != UIUserNotificationTypeNone) {
        [self addLocalNotification];
    } else {
        [[UIApplication sharedApplication]registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound  categories:nil]];
    }
    
    
    [self addLocalNotification];
    
    //接收通知参数
    UILocalNotification *notification = [launchOptions valueForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    NSDictionary *userInfo = notification.userInfo;
    NSLog(@"userInfo = %@",userInfo);
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    //进入前台取消应用消息图标
    [[UIApplication sharedApplication]setApplicationIconBadgeNumber:0];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/**
 调用过用户注册通知方法之后执行（也就是调用完registerUserNotificationSettings:方法之后执行）
 */
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    //[[UIApplication sharedApplication] registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"notificton = %@",notification.userInfo);
}

#pragma mark 添加本地通知
- (void)addLocalNotification
{
    //定义本地通知对象
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    //设置调用时间
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10.0];//通知触发的时间
    notification.repeatInterval = 2;//通知重复的次数
    
    //设置属性
    notification.alertBody = @"最近添加了诸多有趣的特性,是否立即体验？";//通知主体
    notification.applicationIconBadgeNumber = 1;
//    notification.alertLaunchImage
//    notification.soundName
    
    //设置用户信息
    notification.userInfo = @{@"id":@1,@"user":@"Kenshin Cui"};//绑定到通知上的其他附加信息
    
    //调用通知
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
}


#pragma mark 移除本地通知，在不需要此通知时记得移除
-(void)removeNotification{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

@end
