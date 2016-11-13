//
//  CSLineView2.m
//  Quartz2D——1
//
//  Created by chen songqi on 15/8/18.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "CSLineView2.h"

@implementation CSLineView2


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

     CGContextRef ctx=UIGraphicsGetCurrentContext();
     CGContextAddRect(ctx, CGRectMake(20, 20, 150, 100));


    // 如果要设置绘图的状态必须在渲染之前
    //    CGContextSetRGBStrokeColor(ctx, 1.0, 0, 0, 1.0);
     // 绘制什么类型的图形(空心或者实心).就要通过什么类型的方法设置状态
     //    CGContextSetRGBFillColor(ctx, 1.0, 0, 0, 1.0);
     // 调用OC的方法设置绘图的颜色
    //    [[UIColor purpleColor] setFill];
     //    [[UIColor blueColor] setStroke];
    // 调用OC的方法设置绘图颜色(同时设置了实心和空心)
     //    [[UIColor greenColor] set];
    
    
     [[UIColor colorWithRed:1.0 green:0 blue:0 alpha:1.0] set];
//    CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
}


@end
