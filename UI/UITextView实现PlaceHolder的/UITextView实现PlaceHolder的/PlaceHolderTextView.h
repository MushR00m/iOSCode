//
//  PlaceHolderTextView.h
//  UITextView实现PlaceHolder的
//
//  Created by chen songqi on 15/6/18.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceHolderTextView : UITextView

@property (nonatomic, strong) NSString *placeholder;

@property (nonatomic, strong) UIColor *placeholderColor;

- (void)textChanged:(NSNotification *)notifiction;

@end
