//
//  PathView.m
//  Quartz2D——5
//
//  Created by chen songqi on 15/8/18.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "PathView.h"

@implementation PathView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    [self drawRect2:rect];
}


- (void)drawRect1:(CGRect)rect {

    //1.获取图形上下文
    CGContextRef ctx= UIGraphicsGetCurrentContext();
    //2.绘图（画线）
    //设置起点
    CGContextMoveToPoint(ctx, 20, 20);
    //设置终点
    CGContextAddLineToPoint(ctx, 200, 300);
    //渲染
    CGContextStrokePath(ctx);
}


- (void)drawRect2:(CGRect)rect {

    CGContextRef ctx = UIGraphicsGetCurrentContext();

    //但凡通过Quartz2D中带有creat/copy/retain方法创建出来的值都必须要释放
    CGMutablePathRef path = CGPathCreateMutable();

    CGPathMoveToPoint(path, NULL, 20, 20);
    CGPathAddLineToPoint(path, NULL, 200, 200);
    CGContextAddPath(ctx, path);

    CGContextStrokePath(ctx);

    CGPathRelease(path);

    /*
     直接使用path的好处：
     第一种代码的阅读性不好，不便于区分。使用path，则一个path就代表一条路径。
     比如：如果要在上下文中绘制多个图形，这种情况下建议使用path。
     
     
     提示：如果是画线，那么就创建一条路径（path）用来保存画线的绘图信息，如果又要重新画一个圆，那么就可以创建一条新的路径来专门保存画圆的绘图信息。
     
     
     在画线的时候，方法的内部默认创建一个path。它把路径都放到了path里面去。
     1.创建路径  cgmutablepathref 调用该方法相当于创建了一个路径，这个路径用来保存绘图信息。
     2.把绘图信息添加到路径里边。
     以前的方法是点的位置添加到ctx（图形上下文信息）中，ctx 默认会在内部创建一个path用来保存绘图信息。
     在图形上下文中有一块存储空间专门用来存储绘图信息，其实这块空间就是CGMutablePathRef。
     3.把路径添加到上下文中。
     */

}

@end
