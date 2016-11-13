//
//  MainViewController.h
//  手势
//
//  Created by chen cheng on 14-8-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UIGestureRecognizerDelegate>
{
    UIImageView  *_imageView;
    
    CGFloat      _imageViewRotation;
}

@end
