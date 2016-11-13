//
//  View1Controller.h
//  标签栏视图控制器
//
//  Created by chen cheng on 14-9-3.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View1_1Controller.h"
#import "View1_2Controller.h"

@interface View1Controller : UIViewController
{
    View1_1Controller  *_view1_1Controller;
    View1_2Controller  *_view1_2Controller;
    
    UINavigationController *_navigationController;
}

- (void)QF_didReceiveMemoryWarning;

- (void)QF_viewDidUnload;

- (void)showView1_2;

@end
