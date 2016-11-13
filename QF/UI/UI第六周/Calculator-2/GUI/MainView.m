//
//  MainView.m
//  Calculator
//
//  Created by chen cheng on 14-8-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        CalculatorView *calculatorView = [[CalculatorView alloc] initWithFrame:CGRectMake(10, 30, 300, 400)];
        
        [self addSubview:calculatorView];
        
        [calculatorView release];
        
    }
    return self;
}

@end
