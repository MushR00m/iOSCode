//
//  TranslateTest.m
//  Quartz2D——3
//
//  Created by chen songqi on 15/8/18.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "TranslateTest.h"

@implementation TranslateTest


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawRect3:rect];

}


- (void)drawRect1:(CGRect)rect {

    CGContextRef ctx = UIGraphicsGetCurrentContext();

    CGContextAddRect(ctx, CGRectMake(100, 50, 100, 100));

    CGContextStrokePath(ctx);

    //说明：通过这种方式画矩形有弱点：画出来的矩形永远都是正的。
}

//旋转
- (void)drawRect2:(CGRect)rect {


    CGContextRef ctx = UIGraphicsGetCurrentContext();
     //注意点：设置矩阵操作必须要在添加绘图信息之前
    CGContextRotateCTM(ctx, -M_PI_4);

    CGContextAddRect(ctx, CGRectMake(0, 0, 50, 50));
    CGContextStrokePath(ctx);

    //提示：旋转的时候，是整个layer都旋转了。  旋转的点是基于右上角
}

//平移
- (void)drawRect3:(CGRect)rect {

    CGContextRef ctx = UIGraphicsGetCurrentContext();

    CGContextTranslateCTM(ctx, 100, 0);

    CGContextAddRect(ctx, CGRectMake(0, 0, 100, 100));

    CGContextStrokePath(ctx);

}

@end
