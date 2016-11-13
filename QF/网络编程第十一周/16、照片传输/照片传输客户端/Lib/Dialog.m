//
//  Dialog.m
//  对话框Demo
//
//  Created by chen cheng on 14-8-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "Dialog.h"

static UIWindow *g_alertWindow = nil;

@interface DialogViewController : UIViewController
{
    UIView *_dialogView;
    BOOL    _modal;
}

@property(assign, readwrite, nonatomic) BOOL modal;

- (void)setDialogView:(UIView *)dialogView;

@end

@implementation DialogViewController

- (void)dealloc
{
    [_dialogView release];
    _dialogView = nil;
    
    [super dealloc];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_modal)
    {
        return;
    }
    
    UITouch *touch = [touches anyObject];
    
    CGPoint touchPoint = [touch locationInView:self.view];

    if ( !CGRectContainsPoint(_dialogView.frame, touchPoint))
    {
        //关闭对话框
        closeDialogView(QFCloseDialogViewAnimationNone, ^(BOOL finished) {
            
        });
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"willRotateToInterfaceOrientation toInterfaceOrientation = %d", toInterfaceOrientation);
    
    CGFloat  mainScreenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat  mainScreenHeight = [UIScreen mainScreen].bounds.size.height;
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft
        ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
         _dialogView.center = CGPointMake(mainScreenHeight/2.0, mainScreenWidth/2.0);
    }
    else
    {
        _dialogView.center = CGPointMake(mainScreenWidth/2.0, mainScreenHeight/2.0);
    }
}

- (void)setDialogView:(UIView *)dialogView
{
    [dialogView retain];
    [_dialogView release];
    _dialogView = dialogView;
    
    
    CGFloat  mainScreenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat  mainScreenHeight = [UIScreen mainScreen].bounds.size.height;
    
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    
    if (orientation == UIDeviceOrientationLandscapeLeft
        ||
        orientation == UIDeviceOrientationLandscapeRight)
    {
        _dialogView.center = CGPointMake(mainScreenHeight/2.0, mainScreenWidth/2.0);
    }
    else
    {
        _dialogView.center = CGPointMake(mainScreenWidth/2.0, mainScreenHeight/2.0);
    }

    [self.view addSubview:dialogView];
}

@end







void showDialogView(UIView *view, BOOL modal, QFShowDialogViewAnimationOptions showDialogViewAnimationOption, void (^completion)(BOOL finished))
{
    if (g_alertWindow == nil)
    {
        g_alertWindow = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        
        g_alertWindow.windowLevel = UIWindowLevelAlert;
        
        g_alertWindow.backgroundColor = [UIColor clearColor];
        
        [g_alertWindow makeKeyAndVisible];
    }
    
    DialogViewController *dialogViewController = [[DialogViewController alloc] init];
    
    dialogViewController.modal = modal;
    
    g_alertWindow.rootViewController = dialogViewController;
    
    [dialogViewController setDialogView:view];
    
    if (showDialogViewAnimationOption == QFShowDialogViewAnimationNone)
    {
        
        if (completion != nil)
        {
            completion(YES);
        }
        return;
    }
    else if (showDialogViewAnimationOption ==QFShowDialogViewAnimationFromLeft)
    {
        view.layer.transform = CATransform3DTranslate(view.layer.transform, -g_alertWindow.bounds.size.width, 0, 0);
    }
    else if (showDialogViewAnimationOption ==QFShowDialogViewAnimationFromTop)
    {
        view.layer.transform = CATransform3DTranslate(view.layer.transform, 0, -g_alertWindow.bounds.size.height, 0);
    }
    else if (showDialogViewAnimationOption ==QFShowDialogViewAnimationFromRight)
    {
        view.layer.transform = CATransform3DTranslate(view.layer.transform, g_alertWindow.bounds.size.width, 0, 0);
    }
    else if (showDialogViewAnimationOption ==QFShowDialogViewAnimationFromBottom)
    {
        view.layer.transform = CATransform3DTranslate(view.layer.transform, 0, g_alertWindow.bounds.size.height, 0);
    }
    else if (showDialogViewAnimationOption ==QFShowDialogViewAnimationFromCenter)
    {
        view.layer.transform = CATransform3DScale(view.layer.transform, 0.001, 0.001, 1);
    }
    
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
     
     view.layer.transform = CATransform3DIdentity;
     
     } completion:^(BOOL finished) {
     
        if (completion != nil)
        {
            completion(YES);
        }
     }];

}

void closeDialogView(QFCloseDialogViewViewAnimationOptions closeDialogViewViewAnimationOption, void (^completion)(BOOL finished))
{
    CATransform3D  transform;
    
    if (closeDialogViewViewAnimationOption == QFCloseDialogViewAnimationNone)
    {
        if (g_alertWindow != nil)
        {
            [g_alertWindow release];
            g_alertWindow = nil;
        }
        
        if (completion != nil)
        {
            completion(YES);
        }
        return;
    }
    else if (closeDialogViewViewAnimationOption == QFCloseDialogViewAnimationToLeft)
    {
        transform = CATransform3DTranslate(g_alertWindow.rootViewController.view.layer.transform, -g_alertWindow.frame.size.width, 0, 0);
    }
    else if (closeDialogViewViewAnimationOption == QFCloseDialogViewAnimationToTop)
    {
        transform = CATransform3DTranslate(g_alertWindow.rootViewController.view.layer.transform, 0, -g_alertWindow.frame.size.height, 0);
    }
    else if (closeDialogViewViewAnimationOption == QFCloseDialogViewAnimationToRight)
    {
        transform = CATransform3DTranslate(g_alertWindow.rootViewController.view.layer.transform, g_alertWindow.frame.size.width, 0, 0);
    }
    else if (closeDialogViewViewAnimationOption == QFCloseDialogViewAnimationToBottom)
    {
        transform = CATransform3DTranslate(g_alertWindow.rootViewController.view.layer.transform, 0,g_alertWindow.frame.size.height, 0);
    }
    else if (closeDialogViewViewAnimationOption == QFCloseDialogViewAnimationToCenter)
    {
        transform = CATransform3DScale(g_alertWindow.rootViewController.view.layer.transform, 0.001, 0.001, 1);
    }

    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
     
     g_alertWindow.rootViewController.view.layer.transform = transform;
     
     } completion:^(BOOL finished) {
     
        if (g_alertWindow != nil)
        {
            [g_alertWindow release];
            g_alertWindow = nil;
        }

        if (completion != nil)
        {
            completion(YES);
        }
     
     }];
}





