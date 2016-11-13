//
//  CheckBox.h
//  CheckBox
//
//  Created by chen cheng on 14-8-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckBox : UIControl
{
    UILabel    *_titleLabel;
    UIButton   *_button;
    BOOL _on;
    
    NSMutableArray *_targetInfoMutableArray;
}

@property(assign, readwrite, nonatomic)BOOL on;

@property(copy, readwrite, nonatomic)NSString *title;
@property(retain, readwrite, nonatomic)UIFont *titleFont;
@property(retain, readwrite, nonatomic)UIColor *titleColor;

@end
