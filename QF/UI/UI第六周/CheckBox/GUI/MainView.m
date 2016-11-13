//
//  MainView.m
//  CheckBox
//
//  Created by chen cheng on 14-8-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainView.h"
#import "CheckBox.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        CheckBox  *checkBox = [[CheckBox alloc] initWithFrame:CGRectMake(10, 100, 40, 40)];
        
        checkBox.on = YES;
        
        [checkBox addTarget:self action:@selector(checkBoxValueChange:) forControlEvents:UIControlEventValueChanged];
        
                
        [self addSubview:checkBox];
        
        [checkBox release];
    }
    return self;
}

- (void)checkBoxValueChange:(CheckBox *)checkBox
{
    NSLog(@"checkBoxValueChange checkBox.on = %d", checkBox.on);
}


@end
