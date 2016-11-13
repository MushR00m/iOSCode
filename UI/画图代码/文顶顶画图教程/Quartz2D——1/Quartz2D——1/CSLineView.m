//
//  CSLineView.m
//  Quartz2D——1
//
//  Created by chen songqi on 15/8/18.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "CSLineView.h"

@implementation CSLineView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code

    // 1.取得和当前视图相关联的图形上下文(因为图形上下文决定绘制的输出目标)
    // 如果是在drawRect方法中调用UIGraphicsGetCurrentContext方法获取出来的就是Layer的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    CGContextMoveToPoint(ctx, 20, 100);

    CGContextAddLineToPoint(ctx, 300, 100);

    CGContextSetRGBStrokeColor(ctx, 0, 1.0, 0, 1.0);

    CGContextSetLineWidth(ctx, 15);

    CGContextSetLineCap(ctx, kCGLineCapRound);

    CGContextSetLineJoin(ctx, kCGLineJoinRound);

    CGContextStrokePath(ctx);

    CGContextMoveToPoint(ctx, 50, 200);
    CGContextAddLineToPoint(ctx, 300, 60);
    [[UIColor grayColor] set];
    CGContextSetLineWidth(ctx, 10);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextStrokePath(ctx);







}


@end
