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
    UIViewController *_rightDrawerViewController;
    
    UIView *_tapGestureRecognizerView;
    
    CGPoint _touchPoint;
    
    int _showLeftORRight;
}

@property(retain, readwrite, nonatomic)UIViewController *leftDrawerViewController;

@property(retain, readwrite, nonatomic)UIViewController *rightDrawerViewController;

- (id)initWithLeftDrawerViewController:(UIViewController *)leftDrawerViewController;
- (id)initWithRightDrawerViewController:(UIViewController *)rightDrawerViewController;


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;


- (void)showLeftLeftDrawerView;
- (void)closeDrawerView;

- (void)showDrawerView;

@end






