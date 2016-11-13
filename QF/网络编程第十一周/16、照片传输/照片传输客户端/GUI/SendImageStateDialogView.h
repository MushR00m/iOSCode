//
//  SendImageStateDialogView.h
//  照片传输客户端
//
//  Created by chen cheng on 14-9-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SendImageStateDialogView : UIView
{
    UILabel  *_stateLabel;
    
    UIActivityIndicatorView *_activityIndicatorView;
    
    UILabel *_progressLabel;
}

@property(copy, readwrite, nonatomic)NSString *stateText;
@property(copy, readwrite, nonatomic)NSString *progressText;

- (void)startAnimating;
- (void)stopAnimating;

@end
