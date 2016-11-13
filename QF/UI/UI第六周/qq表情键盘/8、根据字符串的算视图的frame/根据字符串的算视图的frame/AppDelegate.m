//
//  AppDelegate.m
//  根据字符串的算视图的frame
//
//  Created by chen cheng on 14-8-25.
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
    
    NSString  *chatText = @"111 111 111 111 111 111 111 111 111 111 111 111 111 111 111 111 111 111 111 111 111 111 111 111 111 444444";
    
    
    CGSize chatTextSize;
    
    if ([[[UIDevice currentDevice] systemVersion] UTF8String][0] >= '7')
    {
        CGRect chatTextRect = [chatText boundingRectWithSize:CGSizeMake(300, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:20], NSFontAttributeName, nil] context:nil];
        
        chatTextSize = chatTextRect.size;
    }
    else
    {
        chatTextSize = [chatText sizeWithFont:[UIFont boldSystemFontOfSize:20] constrainedToSize:CGSizeMake(300, 10000) lineBreakMode:NSLineBreakByWordWrapping];
    }
    

    
    NSLog(@"chatTextRect.size.width = %f", chatTextSize.width);
    NSLog(@"chatTextRect.size.height = %f", chatTextSize.height);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, chatTextSize.width, chatTextSize.height)];
    
    label.numberOfLines = 0;
    
    label.backgroundColor = [UIColor greenColor];
    
    label.text = chatText;
    
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
