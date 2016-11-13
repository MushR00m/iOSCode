//
//  QFImageViewController.h
//  QFImagePickerControllerDemo
//
//  Created by chen cheng on 14-8-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QFImageViewController : UIViewController
{
    NSURL  *_groupURL;
    
    UIScrollView  *_scrollView;
    
    UIImageView *  _imageView;
}

@property(retain, readwrite, nonatomic)NSURL *groupURL;

@end
