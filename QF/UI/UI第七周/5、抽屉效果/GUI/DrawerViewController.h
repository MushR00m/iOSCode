//
//  DrawerViewController.h
//  抽屉效果
//
//  Created by chen cheng on 14-8-28.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DrawerViewController : UIViewController
{
    UIViewController *_leftDrawerViewController;
    
    UIView *_tapGestureRecognizerView;
}

@property(retain, readwrite, nonatomic)UIViewController *leftDrawerViewController;

- (id)initWithLeftDrawerViewController:(UIViewController *)leftDrawerViewController;

- (void)showLeftLeftDrawerView;
- (void)closeDrawerView;


@end






