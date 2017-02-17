//
//  AppDelegate.m
//  AddressBookUI_iOS7
//
//  Created by chensongqi on 16/8/8.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "AppDelegate.h"
#import <AddressBook/AddressBook.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //http://www.jianshu.com/p/e6b7cb1eca9e
    //1. 获取授权状态
    ABAuthorizationStatus status = ABAddressBookGetAuthorizationStatus();
    /**
     kABAuthorizationStatusNotDetermined  用户未选择，用户还没有决定是否授权你的程序进行访问
     kABAuthorizationStatusRestricted iOS设备上一些许可配置阻止程序与通讯录数据库进行交互
     kABAuthorizationStatusDenied  用户明确的拒绝了你的程序对通讯录的访问
     kABAuthorizationStatusAuthorized  用户已经授权给你的程序对通讯录进行访问
    */
    //2. 创建 AddrssBook
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
    //3. 没有授权时就授权
    if (status == kABAuthorizationStatusNotDetermined) {
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            //3.1 判断是否出错
            if (error) {
                return;
            }
            //3.2 判断是否授权
            if (granted) {
                NSLog(@"已经授权");
            } else {
                NSLog(@"没有授权");
            }
        });
    }
    CFRelease(addressBook);
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
