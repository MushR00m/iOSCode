//
//  MainViewController.h
//  标签栏视图控制器
//
//  Created by chen cheng on 14-9-3.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View1Controller.h"
#import "View2Controller.h"
#import "View3Controller.h"
#import "View4Controller.h"
#import "View5Controller.h"
#import "View6Controller.h"

@interface MainViewController : UIViewController
{
    View1Controller   *_view1Controller;
    View2Controller   *_view2Controller;
    View3Controller   *_view3Controller;
    View4Controller   *_view4Controller;
    View5Controller   *_view5Controller;
    View6Controller   *_view6Controller;

    UITabBarController  *_tabBarController;
    
    
    
}

@end
