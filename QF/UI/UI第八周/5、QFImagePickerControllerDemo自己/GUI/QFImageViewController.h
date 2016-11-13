//
//  QFImageViewController.h
//  QFImagePickerControllerDemo
//
//  Created by chen cheng on 14-8-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QFImagePickerController;

@interface QFImageViewController : UIViewController
{
    NSURL  *_groupURL;
    
    NSMutableArray  *_imageViewMutableArray;
    UIScrollView  *_scrollView;
    
    QFImagePickerController *_delegate;
}

@property(retain, readwrite, nonatomic)NSURL *groupURL;

@property(assign, readwrite, nonatomic)QFImagePickerController *delegate;

@end
