//
//  AppDelegate.h
//  动画
//
//  Created by chen cheng on 14-8-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIImageView  *_imageView;
    UIButton     *_startAnimateButton;
    UIButton     *_stopAnimateButton;
    
    BOOL         _stopAnimate;
}

@property (retain, nonatomic) UIWindow *window;

@end
