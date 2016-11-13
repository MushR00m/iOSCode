//
//  AppDelegate.m
//  各种动画
//
//  Created by chen cheng on 14-8-21.
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
    
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 105, 150)];
    _imageView.image = [UIImage imageNamed:@"1.JPG"];
    
    [self.window addSubview:_imageView];
    
    _subView = [[UIView alloc] initWithFrame:CGRectMake(320-105-20, 30, 105, 150)];
    _subView.backgroundColor = [UIColor redColor];
    [self.window addSubview:_subView];
    
    UIButton  *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.tag = 1;
    button1.frame = CGRectMake(10, 200, 70, 40);
    [button1 setTitle:@"按钮1" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:button1];
    
    
    
    UIButton  *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.tag = 2;
    button2.frame = CGRectMake(10 + 80, 200, 70, 40);
    [button2 setTitle:@"按钮2" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:button2];
    
    
    
    UIButton  *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.tag = 3;
    button3.frame = CGRectMake(10 + 80 * 2, 200, 70, 40);
    [button3 setTitle:@"按钮3" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:button3];
    
    
    
    UIButton  *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.tag = 4;
    button4.frame = CGRectMake(10 + 80 * 3, 200 + 50*0, 70, 40);
    [button4 setTitle:@"按钮4" forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:button4];
    
    
    UIButton  *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.tag = 5;
    button5.frame = CGRectMake(10 + 80 * 0, 200 + 50, 70, 40);
    [button5 setTitle:@"按钮5" forState:UIControlStateNormal];
    [button5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:button5];
    
    
    UIButton  *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    button6.tag = 6;
    button6.frame = CGRectMake(10 + 80 * 1, 200 + 50, 70, 40);
    [button6 setTitle:@"按钮6" forState:UIControlStateNormal];
    [button6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button6 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:button6];
    
    
    UIButton  *button7 = [UIButton buttonWithType:UIButtonTypeCustom];
    button7.tag = 7;
    button7.frame = CGRectMake(10 + 80 * 2, 200 + 50, 70, 40);
    [button7 setTitle:@"按钮8" forState:UIControlStateNormal];
    [button7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button7 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:button7];


    UIButton  *button8 = [UIButton buttonWithType:UIButtonTypeCustom];
    button8.tag = 8;
    button8.frame = CGRectMake(10 + 80 * 3, 200 + 50, 70, 40);
    [button8 setTitle:@"按钮8" forState:UIControlStateNormal];
    [button8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button8 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:button8];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)buttonClick:(UIButton *)button
{
    if (button.tag == 1)
    {
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            _imageView.layer.transform = CATransform3DRotate(_imageView.layer.transform, 90.0 /180.0 * 3.1415926, 0, 0, 1);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                
                _imageView.layer.transform = CATransform3DScale(_imageView.layer.transform, 0.00001, 0.00001, 1);
                
            } completion:^(BOOL finished) {
                
                
                [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                    
                    _imageView.layer.transform = CATransform3DIdentity;
                    
                } completion:^(BOOL finished) {
                    
                }];
                
            }];
        }];
    }
    else if (button.tag == 2)
    {
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            CATransform3D transform = CATransform3DIdentity;
            
            transform = CATransform3DRotate(transform, 90.0/180.0 * 3.1415926, 0, 0, 1);
            
            transform = CATransform3DScale(transform, 0.0001, 0.001, 1);
            
            _imageView.layer.transform = transform;
            
            _imageView.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            
            [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                
                _imageView.layer.transform = CATransform3DIdentity;
                
                _imageView.alpha = 1;
                
            } completion:^(BOOL finished) {
                
            }];

            
        }];
    }
    else if (button.tag == 3)
    {
        //系统自带的动画
        [UIView transitionWithView:_imageView duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            
        } completion:^(BOOL finished) {
            
        }];
    }
    else if (button.tag == 4)
    {
        [UIView transitionWithView:_imageView duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            
        } completion:^(BOOL finished) {
            
        }];
        
        

    }
    else if (button.tag == 5)
    {
        static int i=0;
        
        i++;
        
        [UIView transitionWithView:_subView duration:1 options:UIViewAnimationOptionTransitionCurlUp animations:^{
            
        } completion:^(BOOL finished) {
            
        }];
        
        if (i % 2 == 0)
        {
            _subView.backgroundColor = [UIColor redColor];
        }
        else
        {
            _subView.backgroundColor = [UIColor blueColor];
        }
        
        
        
    }
    else if (button.tag == 6)
    {
        [UIView transitionWithView:_imageView duration:1 options:UIViewAnimationOptionTransitionCurlDown animations:^{
            
        } completion:^(BOOL finished) {
            
        }];
        
    }
    else if (button.tag == 7)
    {
        [UIView transitionWithView:_imageView duration:1 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
            
        } completion:^(BOOL finished) {
            
        }];
        
    }
    else if (button.tag == 8)
    {
        [UIView transitionWithView:_imageView duration:1 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
            
        } completion:^(BOOL finished) {
            
        }];
        
    }


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
