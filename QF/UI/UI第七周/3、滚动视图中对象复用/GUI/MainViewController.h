//
//  MainViewController.h
//  滚动视图
//
//  Created by chen cheng on 14-8-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView  *_scrollView;
    
    UILabel  *_label1;
    UILabel  *_label2;
    UILabel  *_label3;
    
    int _currentPage;
}

@end
