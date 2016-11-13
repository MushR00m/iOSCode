//
//  CheckBox.h
//  CheckBox
//
//  Created by chen cheng on 14-8-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TargetInfo : NSObject
{
    id _target;
    SEL _action;
}

@property(assign, readwrite, nonatomic)id target;
@property(assign, readwrite, nonatomic)SEL action;


@end

@interface CheckBox : UIControl
{
    UIButton   *_button;
    BOOL _on;
    UILabel *_label;
    NSMutableArray *_targetInfoMutableArray;
}

@property(assign, readwrite, nonatomic)BOOL on;

@end
