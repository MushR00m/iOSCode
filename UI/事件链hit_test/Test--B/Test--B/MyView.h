//
//  MyView.h
//  事件链
//
//  Created by chensongqi on 15/3/13.
//  Copyright (c) 2015年 chensongqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyView : UIView


@property (copy, nonatomic) NSString *name ;

- (instancetype)initWithFrame:(CGRect)frame Color:(UIColor *)color andName:(NSString *)name;

@end
