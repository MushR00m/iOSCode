//
//  MainViewController.h
//  异步加载图片
//
//  Created by chen cheng on 14-9-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFWebImageView.h"

@interface MainViewController : UIViewController<NSURLConnectionDelegate, NSURLConnectionDataDelegate>
{
    QFWebImageView *_webImageView;
}



@end
