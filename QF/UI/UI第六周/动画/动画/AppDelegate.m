//
//  AppDelegate.m
//  动画
//
//  Created by chen cheng on 14-8-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    self.window = nil;
    
    [_imageView release];
    _imageView = nil;
    
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    
    
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.JPG"]];
    
    
    _imageView.frame = CGRectMake(60, 100, 200, 200);
    
    //设置成圆角
    _imageView.layer.cornerRadius = 100;
    _imageView.layer.masksToBounds = YES;
    
    [self.window addSubview:_imageView];

    
    
    
    _startAnimateButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    
    [_startAnimateButton setTitle:@"开始动画" forState:UIControlStateNormal];
    
    [_startAnimateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _startAnimateButton.frame = CGRectMake(200, 430, 80, 40);
    
    [_startAnimateButton addTarget:self action:@selector(startAnimateButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.window addSubview:_startAnimateButton];
    
    
    _stopAnimateButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    
    [_stopAnimateButton setTitle:@"停止动画" forState:UIControlStateNormal];
    
    [_stopAnimateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _stopAnimateButton.frame = CGRectMake(100, 430, 80, 40);
    
    [_stopAnimateButton addTarget:self action:@selector(stopAnimateButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.window addSubview:_stopAnimateButton];
    

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)stopAnimateButtonClick:(id)sender
{
    _stopAnimate = YES;
}

- (void)startAnimateButtonClick:(id)sender
{
    NSLog(@"startAnimateButtonClick");
    
    [self startAnimate];
}

- (void)startAnimate
{
    _startAnimateButton.userInteractionEnabled = NO;
    
    //UIViewAnimationOptionCurveEaseIn  先慢后快
    //UIViewAnimationOptionCurveEaseOut 先快后慢
    //UIViewAnimationOptionCurveEaseInOut 开始和结尾慢  中间快
    //UIViewAnimationOptionCurveLinear  匀速
    [UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        _imageView.layer.transform = CATransform3DRotate(_imageView.layer.transform, 90.0/180.0 * 3.1415926, 0,0 ,1 );
        
        //_imageView.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        NSLog(@"单次动画结束");
        
        if (!_stopAnimate)
        {
           // _imageView.alpha = 0;
            [self startAnimate];
        }
        else
            
        {
            NSLog(@"动画结束");
           // _imageView.alpha = 1;
            _stopAnimate = NO;
            _startAnimateButton.userInteractionEnabled = YES;
        }
        

    }];

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
