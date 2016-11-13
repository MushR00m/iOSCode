//
//  ImageView.m
//  CSTextView
//
//  Created by chen songqi on 15/8/18.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ImageView.h"

@implementation ImageView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIImage *image = [UIImage imageNamed:@"1.png"];
    [image drawAsPatternInRect:[UIScreen mainScreen].bounds];

}


@end
