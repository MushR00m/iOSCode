//
//  MainViewController.h
//  滚动视图的contentInset
//
//  Created by chen cheng on 14-9-3.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "View1Controller.h"


@interface MainViewController : UIViewController<UINavigationControllerDelegate>
{
    View1Controller  *_view1Controller;
    
        
    UINavigationController  *_navigationController;
}

@end
