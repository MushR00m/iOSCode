//
//  QFImageViewController.h
//  QFImagePickerControllerDemo
//
//  Created by chen cheng on 14-8-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QFImagePickerController;

@interface QFImageViewController : UIViewController<UIScrollViewDelegate>
{
    NSURL  *_groupURL;
    
    NSMutableArray  *_imageViewInfoMutableArray;//存放图片信息的数组、（信息主要指图片的链接URL）不存放UIImageView的对象 或者 ImageItemView的对象
    
    NSMutableArray  *_imageViewMutableArray; //存放UIImageView的对象 或者 ImageItemView的对象(这个数组最多只有三十个元素)
    
    UIScrollView  *_scrollView;
    
    QFImagePickerController *_delegate;
}

@property(retain, readwrite, nonatomic)NSURL *groupURL;

@property(assign, readwrite, nonatomic)QFImagePickerController *delegate;

@end
