//
//  TestDialogView.m
//  对话框Demo
//
//  Created by chen cheng on 14-7-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "TestDialogView.h"
#import "Dialog.h"

@implementation TestDialogView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor darkGrayColor];
        self.layer.cornerRadius = 20;
        self.layer.masksToBounds = YES;
        
        UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10, 30, 280, 40);
        button.layer.borderColor = [UIColor blackColor].CGColor;
        button.layer.borderWidth = 1;
        [button setTitle:@"关闭" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor whiteColor]];
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];

    }
    return self;
}

- (void)buttonClick:(id)sender
{
    closeDialogView(QFCloseDialogViewAnimationToCenter, ^(BOOL finished) {
        NSLog(@"对话框关闭结束");
    });
}


@end
