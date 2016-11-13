//
//  CSLlineView3.m
//  Quartz2D——1
//
//  Created by chen songqi on 15/8/18.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "CSLlineView3.h"

@implementation CSLlineView3


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
     CGContextRef ctx = UIGraphicsGetCurrentContext();
    //如果举行为正方形，则结果是圆，否则，结果为椭圆
//     CGContextAddEllipseInRect(ctx, CGRectMake(50, 100, 50, 50));
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 100, 50, 100));

     [[UIColor greenColor] set];
//     CGContextFillPath(ctx);
    CGContextStrokePath(ctx);
}


@end
