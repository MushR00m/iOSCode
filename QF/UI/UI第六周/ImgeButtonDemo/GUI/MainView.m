//
//  MainView.m
//  ImgeButtonDemo
//
//  Created by chen cheng on 14-7-15.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button1.frame = CGRectMake(10, 40, 300, 50);
        
        button1.layer.borderWidth = 1;
        button1.layer.borderColor = [UIColor blackColor].CGColor;
        
        //buttonImage存放的是图片数据 UIImage不是UIView类  所以它不会显示
        //需要两张图片 300 * 50  和 600 * 100
        UIImage *button1Image = [UIImage imageNamed:@"buttonImage.png"];
    
        //设置按钮图片
        [button1 setImage:button1Image forState:UIControlStateNormal];
        
        [self addSubview:button1];
        
        
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button2.frame = CGRectMake(10, 40 + 60, 300, 50);
        
        button2.layer.borderWidth = 1;
        button2.layer.borderColor = [UIColor blackColor].CGColor;
        
        //buttonImage存放的是图片数据 UIImage不是UIView类  所以它不会显示
        UIImage *button2Image = [UIImage imageNamed:@"1.png"];
        
        //设置按钮图片
        [button2 setBackgroundImage:button2Image forState:UIControlStateNormal];
        
        [self addSubview:button2];
        
        
        UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button3.frame = CGRectMake(10, 40 + 60 * 2, 300, 50);
        
        button3.layer.borderWidth = 1;
        button3.layer.borderColor = [UIColor blackColor].CGColor;
        
        //buttonImage存放的是图片数据 UIImage不是UIView类  所以它不会显示
        UIImage *button3Image = [UIImage imageNamed:@"1.png"];
        
        //设置按钮图片
        [button3 setImage:button3Image forState:UIControlStateNormal];
        
        [self addSubview:button3];
        
        
        
        UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button4.frame = CGRectMake(10, 40 + 60 * 3, 300, 40);
        
       // button4.layer.borderWidth = 1;
       // button3.layer.borderColor = [UIColor blackColor].CGColor;
        
        //buttonImage存放的是图片数据 UIImage不是UIView类  所以它不会显示
        UIImage *button4Image = [UIImage imageNamed:@"1.png"];
        
        UIEdgeInsets edgeInsets;
        edgeInsets.left = 15;
        edgeInsets.top = 10;
        edgeInsets.right = 15;
        edgeInsets.bottom = 10;
        
        //可伸缩的图片
        button4Image = [button4Image resizableImageWithCapInsets:edgeInsets];
        
        
        //设置按钮图片
        [button4 setBackgroundImage:button4Image forState:UIControlStateNormal];
        
        [self addSubview:button4];



    }
    return self;
}


@end
