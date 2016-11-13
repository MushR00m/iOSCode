//
//  AppDelegate.m
//  ButtonDemo
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
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.tag = 1;
    button1.frame = CGRectMake(10, 50, 300, 40);
    
   // button1.layer.borderColor = [UIColor blackColor].CGColor;
    //button1.layer.borderWidth = 1;
    
    
    //改变按钮的字体
    button1.titleLabel.font = [UIFont boldSystemFontOfSize:19];
    
    //改变按钮背景颜色
    //button1.backgroundColor = [UIColor greenColor];
    

    [button1 setBackgroundImage:[UIImage imageNamed:@"ButtonBgNormal.png"] forState:UIControlStateNormal];
    //[button1 setBackgroundImage:[UIImage imageNamed:@"ButtonBgHighlighted.png"] forState:UIControlStateHighlighted];
    
    
    
    
    //设置标题 在正常状态下的标题
    [button1 setTitle:@"按钮1 黑色标题" forState:UIControlStateNormal];
    //设置标题颜色 在正常状态下的颜色
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //在高亮状态下得属性
    [button1 setTitle:@"按钮1 红色标题" forState:UIControlStateHighlighted];
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    //给按钮添加一个事件处理函数
    [button1 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
    //NSLog(@"button1 = %@", button1);
    [self.window addSubview:button1];
    
    
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.tag = 2;
    button2.frame = CGRectMake(10, button1.frame.origin.y + button1.frame.size.height + 10, 300, 40);
    button2.layer.borderColor = [UIColor blackColor].CGColor;
    button2.layer.borderWidth = 1;
    //设置标题 在正常状态下的标题
    [button2 setTitle:@"按钮2 黑色标题" forState:UIControlStateNormal];
    //设置标题颜色 在正常状态下的颜色
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //在高亮状态下得属性
    [button2 setTitle:@"按钮2 红色标题" forState:UIControlStateHighlighted];
    [button2 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    
    
    //设置圆角显示
    button2.layer.cornerRadius = 10;
    //设置为真时、如果按钮上有子视图、当子视图超出父视图的范围的时候不会显示
    button2.layer.masksToBounds = YES;
    
    //给按钮添加一个事件处理函数
    [button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
    //NSLog(@"button2 = %@", button2);
    [self.window addSubview:button2];
    
    
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.tag = 3;
    button3.frame = CGRectMake(10, button2.frame.origin.y + button2.frame.size.height + 10, 300, 40);
    button3.layer.borderColor = [UIColor blackColor].CGColor;
    button3.layer.borderWidth = 1;
    //设置标题 在正常状态下的标题
    [button3 setTitle:@"按钮3 黑色标题" forState:UIControlStateNormal];
    //设置标题颜色 在正常状态下的颜色
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //在高亮状态下得属性
    [button3 setTitle:@"按钮3 红色标题" forState:UIControlStateHighlighted];
    [button3 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    //给按钮添加一个事件处理函数
    [button3 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    //NSLog(@"button3 = %@", button3);
    [self.window addSubview:button3];
    

    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.tag = 4;
    button4.frame = CGRectMake(10, button3.frame.origin.y + button3.frame.size.height + 10, 300, 40);
    button4.layer.borderColor = [UIColor blackColor].CGColor;
    button4.layer.borderWidth = 1;
    //设置标题 在正常状态下的标题
    [button4 setTitle:@"按钮4 黑色标题" forState:UIControlStateNormal];
    //设置标题颜色 在正常状态下的颜色
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //在高亮状态下得属性
    [button4 setTitle:@"按钮4 红色标题" forState:UIControlStateHighlighted];
    [button4 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    //给按钮添加一个事件处理函数
    [button4 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    //NSLog(@"button4 = %@", button4);
    [self.window addSubview:button4];

    

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

/**
 *  按钮的事件处理函数
 *
 *  @param sender 是形式参数、实际参数为发生事件的按钮
 */
- (void)button1Click:(id)sender
{
    NSLog(@"button1Click sender = %@", sender);
}

- (void)button2Click
{
    NSLog(@"button2Click");
}

- (void)buttonClick:(id)sender
{
    UIButton  *button = sender;
    
    NSLog(@"buttonClick button.tag = %d", button.tag);
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
