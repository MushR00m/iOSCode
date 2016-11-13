//
//  MainViewController.h
//  各种控件
//
//  Created by chen cheng on 14-8-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UIAlertViewDelegate, UIActionSheetDelegate>
{
    UISegmentedControl  *_segmentedControl;
    
    UISlider *_slider;
    
    UIActivityIndicatorView *_activityIndicatorView;
    
    
    UIProgressView *_progressView;
    
    
    UIStepper  *_stepper;
    
    
    UITextView  *_textView;
}

@end
