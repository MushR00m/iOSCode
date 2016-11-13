//
//  AppDelegate.m
//  视图Demo1
//
//  Created by chen cheng on 14-8-20.
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
    
    
    UIView   *subView1 = [[UIView alloc] init];
    
    subView1.frame = CGRectMake(0, 0, 200, 200);
 
    subView1.center = CGPointMake(self.window.bounds.size.width/3.0, self.window.bounds.size.height * 2.0/3.0);
    subView1.backgroundColor = [UIColor redColor];
    
    //是否接受用户的触摸事件、这个为假时、该视图及其子视图都不能接受用户的交互事件
    subView1.userInteractionEnabled = NO;
    
    [self.window addSubview:subView1];
    
    
    
    UIView   *subView2 = [[UIView alloc] init];
    
    subView2.frame = CGRectMake(0, 0, 200, 200);
    subView2.center = CGPointMake(self.window.bounds.size.width/2.0, self.window.bounds.size.height/3.0);
    subView2.backgroundColor = [UIColor greenColor];
    
    //是否接受用户的触摸事件、这个为假时、该视图及其子视图都不能接受用户的交互事件
    subView2.userInteractionEnabled = NO;
    
    [self.window addSubview:subView2];
    
    
    
    UIView   *subView3 = [[UIView alloc] init];
    
    subView3.frame = CGRectMake(0, 0, 200, 200);
    subView3.center = CGPointMake(self.window.bounds.size.width*2.0/3.0, self.window.bounds.size.height*2.0/3.0);
    subView3.backgroundColor = [UIColor blueColor];
    
    //是否接受用户的触摸事件、这个为假时、该视图及其子视图都不能接受用户的交互事件
    subView3.userInteractionEnabled = NO;
    
    [self.window addSubview:subView3];
    
    
    
    
    UIView   *subView4 = [[UIView alloc] init];
    
    subView4.frame = CGRectMake(0, 0, 200, 200);
    subView4.center = CGPointMake(self.window.bounds.size.width*1.0/2.0, self.window.bounds.size.height*1.0/2.0);
    subView4.backgroundColor = [UIColor darkGrayColor];
    
    //是否接受用户的触摸事件、这个为假时、该视图及其子视图都不能接受用户的交互事件
    subView4.userInteractionEnabled = NO;
    
    //[self.window insertSubview:subView4 aboveSubview:subView1];
    [self.window insertSubview:subView4 belowSubview:subView3];
    
    
    BOOL ret = [subView1 isDescendantOfView:self.window];
    
    NSLog(@"isDescendantOfView ret = %d", ret);
    
    [subView1 release];
    [subView2 release];
    [subView3 release];
    [subView4 release];
    
    
    NSArray *subviewsArray = [self.window subviews];
    
    NSLog(@"subviewsArray = %@", subviewsArray);
    
    [self.window exchangeSubviewAtIndex:0 withSubviewAtIndex:3];
    
    
    
    
    UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(10, 30, 300, 40);
    
    [button setTitle:@"不接受用户交互的按钮" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    button.userInteractionEnabled = YES;
    
    [self.window addSubview:button];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpeg"]];
    
   
    imageView.frame = CGRectMake(10, 200, 300, 200);
    
    [self.window addSubview:imageView];
    
    [imageView release];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)buttonClick:(id)sender
{
    NSLog(@"buttonClick");
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
