//
//  MainViewController.h
//  选择系统照片
//
//  Created by chen cheng on 14-8-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIImageView  *_imageView;
}

@end
