//
//  CSLineVIew4.m
//  Quartz2D——1
//
//  Created by chen songqi on 15/8/18.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "CSLineVIew4.h"

@implementation CSLineVIew4


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.画圆弧
    // x/y 圆心
    // radius 半径
    // startAngle 开始的弧度
    // endAngle 结束的弧度
    // clockwise 画圆弧的方向 (0 顺时针, 1 逆时针)
    //    CGContextAddArc(ctx, 100, 100, 50, -M_PI_2, M_PI_2, 0);
    
    
    CGContextAddArc(ctx, 100, 100, 50, M_PI_2, M_PI, 0);
    CGContextClosePath(ctx);

    // 3.渲染
     CGContextStrokePath(ctx);
//    CGContextFillPath(ctx);

}


@end
