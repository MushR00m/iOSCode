//
//  MainViewController.h
//  QFImagePickerControllerDemo
//
//  Created by chen cheng on 14-8-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFImagePickerController.h"

@interface MainViewController : UIViewController<QFImagePickerControllerDelegate>
{
    UIScrollView  *_scrollView;
}

@end
