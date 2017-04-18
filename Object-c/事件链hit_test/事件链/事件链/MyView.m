//
//  MyView.m
//  事件链
//
//  Created by chensongqi on 15/3/13.
//  Copyright (c) 2015年 chensongqi. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
        UIView *retView = nil;
        NSLog(@"hitTest %@ Entry! event=%@", self.name, event);
        
        retView = [super hitTest:point withEvent:event];
        NSLog(@"hitTest %@ Exit! view = %@", self.name, retView);
   
//    if ([self.name isEqualToString:@"viewE"]) {
//         return [self superview];
//    }
        return retView;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL ret = [super pointInside:point withEvent:event];
    //    if ([self.name isEqualToString:@"viewD"]) {
    //        ret = YES;
    //    }
    if (ret) {
        NSLog(@"pointInside %@ = YES", self.name);
    } else {
        NSLog(@"pointInside %@ = NO", self.name);
    }
    
    return ret;
}

- (instancetype)initWithFrame:(CGRect)frame Color:(UIColor *)color andName:(NSString *)name
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = color;
        self.name = name;
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

@end
