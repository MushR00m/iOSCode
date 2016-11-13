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

@protocol QFImagePickerControllerDelegate <NSObject>

- (void)imagePickerController:(QFImagePickerController *)picker didFinishPickingWithArray:(NSArray *)imageArray;

- (void)imagePickerControllerDidCancel:(QFImagePickerController *)picker;

@end

@interface QFImagePickerController : UIViewController
{
    QFGroupViewController *_groupViewController;
    QFImageViewController *_imageViewController;
    
    UINavigationController  *_navigationController;
    
    id<QFImagePickerControllerDelegate> _delegate;
}

@property(assign, readwrite, nonatomic)id<QFImagePickerControllerDelegate> delegate;

- (void)didCancel;

- (void)didFinishPickingWithArray:(NSArray *)imageArray;

- (void)showImageViewWithGroupURL:(NSURL *)groupURL;

@end
