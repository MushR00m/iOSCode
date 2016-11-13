//
//  View1Controller.h
//  滚动视图的contentInset
//
//  Created by chen cheng on 14-9-3.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View1Controller : UIViewController
{
    UIScrollView  *_scrollView;
}

@property(readonly, nonatomic)UIScrollView  *scrollView;

@end
