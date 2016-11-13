//
//  TestView.m
//  自动布局管理
//
//  Created by chen cheng on 14-4-17.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (void)dealloc
{
    [_label1  release];
    _label1 = nil;
    
    [_label2  release];
    _label2 = nil;
    
    [_label3  release];
    _label3 = nil;
    
    [_label4  release];
    _label4 = nil;
    
    [_label5  release];
    _label5 = nil;
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor grayColor];
        
        //自动布局子视图
        self.autoresizesSubviews = YES;
        
        _label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _label1.backgroundColor = [UIColor greenColor];
        _label1.text = @"1";
        _label1.textAlignment = NSTextAlignmentCenter ;
        
       // _label1.autoresizingMask = ;

        [self addSubview:_label1];
        
        _label2 = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width - 40, 0, 40, 40)];
        _label2.backgroundColor = [UIColor greenColor];
        _label2.text = @"2";
        _label2.textAlignment = NSTextAlignmentCenter;
        
        //让它左边界自动变化
        _label2.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        
        [self addSubview:_label2];
        
        
        _label3 = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width - 40, self.bounds.size.height - 40, 40, 40)];
        _label3.backgroundColor = [UIColor greenColor];
        _label3.text = @"3";
        _label3.textAlignment = NSTextAlignmentCenter;
        
        //让它的左边界和上边界自动变化
        _label3.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
        
        [self addSubview:_label3];
        
        _label4 = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 40, 40, 40)];
        _label4.backgroundColor = [UIColor greenColor];
        _label4.text = @"4";
        _label4.textAlignment = NSTextAlignmentCenter;
        
        //让它的上边界自动变化
        _label4.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        
        [self addSubview:_label4];
        
        
        _label5 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width-20, 40)];
        _label5.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);
        _label5.backgroundColor = [UIColor greenColor];
        _label5.textAlignment = NSTextAlignmentCenter;
        
        
        //1、UIViewAutoresizingFlexibleWidth:它的宽度自动变化
        //2、UIViewAutoresizingFlexibleTopMargin：上面边界自动变化
        //3、UIViewAutoresizingFlexibleBottomMargin：下边界也要自动变化
        _label5.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        
        [self addSubview:_label5];


        _label6 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, self.bounds.size.height-20)];
        _label6.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);
        _label6.backgroundColor = [UIColor greenColor];
        _label6.textAlignment = NSTextAlignmentCenter;
        
        
        //1、UIViewAutoresizingFlexibleWidth:它的宽度自动变化
        //2、UIViewAutoresizingFlexibleTopMargin：上面边界自动变化
        //3、UIViewAutoresizingFlexibleBottomMargin：下边界也要自动变化
        _label6.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        [self addSubview:_label6];
        
    }
    return self;
}


- (void)layoutSubviews
{
    
}

@end
