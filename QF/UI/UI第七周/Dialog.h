//
//  Dialog.h
//  常用控件
//
//  Created by chen cheng on 14-4-28.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum QFShowDialogViewAnimationOptions
{
    QFShowDialogViewAnimationNone = 0,
    QFShowDialogViewAnimationFromLeft,
    QFShowDialogViewAnimationFromTop,
    QFShowDialogViewAnimationFromRight,
    QFShowDialogViewAnimationFromBottom,
    QFShowDialogViewAnimationFromCenter,
} QFShowDialogViewAnimationOptions;

typedef enum QFCloseDialogViewViewAnimationOptions
{
    QFCloseDialogViewAnimationNone = 0,
    QFCloseDialogViewAnimationToLeft,
    QFCloseDialogViewAnimationToTop,
    QFCloseDialogViewAnimationToRight,
    QFCloseDialogViewAnimationToBottom,
    QFCloseDialogViewAnimationToCenter,
} QFCloseDialogViewAnimationOptions;

void showDialogView(UIView *view, BOOL modal, QFShowDialogViewAnimationOptions showDialogViewAnimationOption, void (^completion)(BOOL finished));

void closeDialogView(QFCloseDialogViewAnimationOptions closeDialogViewViewAnimationOption, void (^completion)(BOOL finished));

