//
//  TextView.m
//  CSTextView
//
//  Created by chen songqi on 15/8/18.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "TextView.h"

@implementation TextView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    // 1.获取上下文
    //    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.绘图
    // 不推荐使用C语言的方法绘制文字, 因为quraz2d中的坐标系和UIkit中的坐标系不一致, 绘制出来的文字是颠倒的, 而且通过C语言的方法绘制文字相当麻烦
    //    CGContextSelectFont(<#CGContextRef c#>, <#const char *name#>, <#CGFloat size#>, <#CGTextEncoding textEncoding#>)
   //    CGContextShowText(ctx, <#const char *string#>, <#size_t length#>)


    NSString *str = @"Quartz 2D是⼀个二维绘图引擎,同时支持iOS和Mac系统，为了便于搭建美观的UI界面,iOS提供了UIKit框架,⾥⾯有各种各样的UI控件但是,有些UI界面极其复杂、⽽且⽐较个性化,⽤普通的UI控件无法实现,这时可以利用Quartz2D技术将控件内部的结构画出来,自定义控件的样子";

    // 绘制矩形
         // 1.获取上下文
         CGContextRef ctx = UIGraphicsGetCurrentContext();
         // 2.绘图
         CGContextAddRect(ctx, CGRectMake(50, 50, 100, 100));
         // 3.渲染
         CGContextStrokePath(ctx);


     //    NSMutableDictionary *md = [NSMutableDictionary dictionary];
     //    // 设置文字颜色
     //    md[NSForegroundColorAttributeName] =[UIColor redColor];
     //    // 设置文字背景颜色
     //    md[NSBackgroundColorAttributeName] = [UIColor greenColor];
     //    // 设置文字大小
     //    md[NSFontAttributeName] = [UIFont systemFontOfSize:20];

    //    将文字绘制到指点的位置
    //    [str drawAtPoint:CGPointMake(10, 10) withAttributes:md];

   //    将文字绘制到指定的范围内, 如果一行装不下会自动换行, 当文字超出范围后就不显示
         [str drawInRect:CGRectMake(50, 50, 100, 100) withAttributes:nil];


}


@end
