//
//  FadeString.m
//  FadeWords
//
//  Created by YouXianMing on 15/5/7.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "FadeString.h"

@interface FadeString ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView  *mask;  // 作为遮罩的mask

@end

@implementation FadeString


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        // 创建出label
        [self createLabel:self.bounds];
        
        // 创建出mask
        [self createMask:self.bounds];
        
    }
    return self;
}

- (void)createLabel:(CGRect)frame {
    self.label               = [[UILabel alloc] initWithFrame:frame];
    self.label.font          = [UIFont systemFontOfSize:30.f];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor     = [UIColor redColor];
    
    [self addSubview:self.label];
}

- (void)createMask:(CGRect)frame {
    
    // 创建出渐变的layer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame            = frame;
    gradientLayer.colors           = @[(__bridge id)[UIColor clearColor].CGColor,
                                       (__bridge id)[UIColor blackColor].CGColor,
                                       (__bridge id)[UIColor blackColor].CGColor,
                                       (__bridge id)[UIColor clearColor].CGColor];
    gradientLayer.locations        = @[@(0.01), @(0.1), @(0.9), @(0.99)];
    gradientLayer.startPoint       = CGPointMake(0, 0);
    gradientLayer.endPoint         = CGPointMake(1, 0);
    
    // 创建并接管mask
    self.mask     = [[UIView alloc] initWithFrame:frame];
    
    // mask获取渐变layer
    [self.mask.layer addSublayer:gradientLayer];
    
    self.maskView = self.mask;
}

- (void)fadeRight {
    
    [UIView animateWithDuration:3.f animations:^{
        CGRect frame    = self.mask.frame;
        frame.origin.x += frame.size.width;
        
        self.mask.frame = frame;
    }];
    
}

/**
 *  重写setter,getter方法
 */
@synthesize text = _text;
- (void)setText:(NSString *)text {
    _text           = text;
    self.label.text = text;
}
- (NSString *)text {
    return _text;
}

@end
