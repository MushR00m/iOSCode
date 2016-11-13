//
//  MainViewController.h
//  线程的异步通信2
//
//  Created by chen cheng on 14-9-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <pthread.h>

@interface MainViewController : UIViewController
{
    BOOL  _isLoading;
    
    pthread_t _currentTid;
    
    float _currentProgress;
}

+ (MainViewController *)shareMainViewController;

@property (retain, nonatomic) IBOutlet UIProgressView *progressView;

@end
