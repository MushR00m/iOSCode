//
//  AppDelegate.m
//  变换矩阵
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
    
    
    UIImageView  *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.JPG"]];
    
    
    imageView.frame = CGRectMake(60, 100, 150, 200);
    
    
    [self.window addSubview:imageView];
    
    //绕Z轴旋转30度
    //imageView.layer.transform = CATransform3DMakeRotation(30.0/180.0 * 3.1415926, 0, 0, 1);
    
    
    //绕Y轴旋转30度
   /* CATransform3D transform = imageView.layer.transform;
    
    //设置透视点坐标为（0，0，-0.003）
    transform.m34 = -0.003;
    
    //把矩阵transform绕Y轴旋转30度
    transform = CATransform3DRotate(transform, 30.0/180.0 * 3.1415926, 0, 1, 0);
    
    imageView.layer.transform = transform;*/
    
    
    
    //绕X轴旋转30度
    /*CATransform3D transform = imageView.layer.transform;
    
    //设置透视点坐标为（0，0，-0.003）
    transform.m34 = -0.003;
    
    //把矩阵transform绕Y轴旋转30度
    transform = CATransform3DRotate(transform, -30.0/180.0 * 3.1415926, 1, 0, 0);
    
    imageView.layer.transform = transform;*/
    
    
    //生成一个缩放矩阵
    //CATransform3DMakeScale(2, 2, 1);
    
    //把一个矩阵进行缩放
    //imageView.layer.transform = CATransform3DScale(imageView.layer.transform, 2, 2, 1);

    
    //生成一个平移矩阵
    //CATransform3DMakeTranslation(<#CGFloat tx#>, <#CGFloat ty#>, <#CGFloat tz#>)
    
    //把一个矩阵进行平移
    //imageView.layer.transform = CATransform3DTranslate(imageView.layer.transform, 50, 40, 0);
    
    
    
    
    
    //复合变换
    
   CATransform3D transform = imageView.layer.transform;
    
    //1、先平移
    transform = CATransform3DTranslate(transform, 50, 70, 0);
    
    //2、再缩放
    transform = CATransform3DScale(transform, 1.5, 1.5, 1);
    
    //3、再旋转
    transform = CATransform3DRotate(transform, 30.0/180.0 * 3.1415926, 0, 0, 1);
    
    //4、设置图层的变换矩阵
    imageView.layer.transform = transform;
    
    
    [imageView release];
    
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
