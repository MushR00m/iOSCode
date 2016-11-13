//
//  QFWebImageView.h
//  异步加载图片
//
//  Created by chen cheng on 14-9-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QFWebImageView : UIImageView<NSURLConnectionDelegate, NSURLConnectionDataDelegate>
{
    NSURL   *_imageURL;
    UILabel *_stateLabel;
    
    NSMutableData *_imageMutableData;
}

@property(retain, readwrite, nonatomic)NSURL *imageURL;

@end
