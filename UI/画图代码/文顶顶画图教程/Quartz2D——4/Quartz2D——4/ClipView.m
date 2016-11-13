//
//  ClipView.m
//  Quartz2D——4
//
//  Created by chen songqi on 15/8/18.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ClipView.h"

@implementation ClipView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    CGContextAddEllipseInRect(ctx, CGRectMake(100, 100, 200, 200));
    ////指定上下文中可以显示内容的范围就是圆的范围
    CGContextClip(ctx);
    //nonzero winding number rule. 非零环绕数规则

    UIImage *image2 = [UIImage imageNamed:@"1.png"];
    [image2 drawAtPoint:CGPointMake(100, 100)];

    CGContextRestoreGState(ctx);
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextSetLineWidth(ctx, 10);
    CGContextAddLineToPoint(ctx, 300, 300);
    CGContextStrokePath(ctx);


}


@end
