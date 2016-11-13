//
//  ContextTest.m
//  CSTextView
//
//  Created by chen songqi on 15/8/18.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ContextTest.h"

@implementation ContextTest


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code


    //http://www.cnblogs.com/wendingding/p/3782489.html

    //获取上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        //保存一份最初的图形上下文
        [[UIColor redColor] set];
        CGContextSaveGState(ctx);

        //绘图
        //第一条线
         CGContextMoveToPoint(ctx, 20, 100);
         CGContextAddLineToPoint(ctx, 100, 320);
    
         //设置第一条线的状态
         //设置线条的宽度
         CGContextSetLineWidth(ctx, 12);
         //设置线条的颜色
         [[UIColor brownColor]set];
         //设置线条两端的样式为圆角
         CGContextSetLineCap(ctx,kCGLineCapRound);
         //对线条进行渲染
         CGContextStrokePath(ctx);
    
         //还原开始的时候保存的那份最纯洁的图形上下文
         CGContextRestoreGState(ctx);
         //第二条线
         CGContextMoveToPoint(ctx, 40, 200);
         CGContextAddLineToPoint(ctx, 80, 100);

         //清空状态
     //    CGContextSetLineWidth(ctx, 1);
     //    [[UIColor blackColor]set];
     //    CGContextSetLineCap(ctx,kCGLineCapButt);

         //渲染
         CGContextStrokePath(ctx);
}


@end
