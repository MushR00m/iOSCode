//
//  AppDelegate.m
//  XuLib
//
//  Created by xu on 15/8/29.
//  Copyright (c) 2015年 xu. All rights reserved.
//

#import "AppDelegate.h"
#import "XuMenuViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


/**
 1.UIView动画
 基础动画——animate、transition、layout   (还有一些可动画的属性)
 Transform、spring、KeyFrame
 maskView
 
 UIView动画 pk CoreAnimation动画
 只能处理简单动画
 性能不行
 相对应的:
 轻量级的数据结构，可以同时让上百个图层产生动画效果
 拥有独立的线程用于执行动画接口
 提高应用性能。只有在发生改变的时候才重绘内容
 
 2.CoreAnimation动画
 CALayer
 专注展示，不响应事件，modelLayer、presentationLayer、渲染Layer（不可见）
 隐式动画(默认0.25s)
 anchorPoint、position、
 CAShapeLayer
 path (CGPathRef / UIBezierPath)，strokeStart，strokeEnd
 CoreAnimation
 basic、keyframe(value、path)、group
 动画结束
 mask
 
 CADisplayLink
 
 http://blog.csdn.net/wang631106979/article/details/62888435
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //main controller
    UINavigationController *wNavi = [[UINavigationController alloc] initWithRootViewController:[[XuMenuViewController alloc] initWithStyle:UITableViewStylePlain]];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = wNavi;
    [self.window makeKeyAndVisible];
    
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
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
