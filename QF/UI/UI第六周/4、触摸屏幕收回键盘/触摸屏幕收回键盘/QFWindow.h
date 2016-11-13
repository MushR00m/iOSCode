//
//  QFWindow.h
//  触摸屏幕收回键盘
//
//  Created by chen cheng on 14-8-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QFWindow : UIWindow
{
    UIResponder  *_currentFirstResponder;
    BOOL         _didShowKeyBoard;
}

@end
