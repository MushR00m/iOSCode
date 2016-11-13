//
//  QFImagePickerController.h
//  QFImagePickerControllerDemo
//
//  Created by chen cheng on 14-8-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "QFGroupViewController.h"
#import "QFImageViewController.h"

@interface QFImagePickerController : UIViewController
{
    QFGroupViewController *_groupViewController;
    
    QFImageViewController *_imageViewController;
    
    UINavigationController  *_navigationController;
}

- (void)showImageViewWithGroupURL:(NSURL *)groupURL;

@end
