//
//  FadeString.h
//  FadeWords
//
//  Created by YouXianMing on 15/5/7.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FadeString : UIView

/**
 *  输入文本
 */
@property (nonatomic, strong) NSString *text;


/**
 *  向右渐变消失
 */
- (void)fadeRight;

@end
