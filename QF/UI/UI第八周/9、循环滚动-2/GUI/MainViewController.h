//
//  MainViewController.h
//  循环滚动
//
//  Created by chen cheng on 14-9-4.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UIScrollViewDelegate>
{
    NSTimer   *_timer;
}

@property (retain, nonatomic) IBOutlet UIPageControl *pageControl;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;

@end
