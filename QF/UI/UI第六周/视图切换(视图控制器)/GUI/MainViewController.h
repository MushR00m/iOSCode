//
//  MainViewController.h
//  视图切换(视图控制器)
//
//  Created by chen cheng on 14-8-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View1Controller.h"
#import "View2Controller.h"

@interface MainViewController : UIViewController
{
    View1Controller  *_view1Controller;
    View2Controller  *_view2Controller;
    
    int _currentPage;
}

+ (MainViewController *)shareMainViewController;

- (void)showView2WithAnimated:(BOOL)animated;
- (void)backView1WithAnimated:(BOOL)animated;

@end
