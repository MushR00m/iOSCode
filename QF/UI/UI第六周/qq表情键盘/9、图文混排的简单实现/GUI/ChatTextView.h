//
//  ChatTextView.h
//  图文混排的简单实现
//
//  Created by chen cheng on 14-8-25.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatTextView : UIView
{
    UIImageView  *_backgroundImageView;
    NSString  *_text;
}

@property(copy, readwrite, nonatomic)NSString *text;

@end
