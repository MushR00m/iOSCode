//
//  EmojiKeyboardHeaderView.m
//  EmojiKeyboard
//
//  Created by chen cheng on 14-8-25.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "EmojiKeyboardHeaderView.h"

@implementation EmojiKeyboardHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor grayColor];
        
        UIButton  *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [doneButton setTitle:@"完成" forState:UIControlStateNormal];
        
        [doneButton addTarget:self action:@selector(doneButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        doneButton.frame = CGRectMake(self.frame.size.width - 50, 0, 40, 40);
        
        [self addSubview:doneButton];
        
        
        UIButton  *swichButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [swichButton setTitle:@"切换" forState:UIControlStateNormal];
        
        [swichButton addTarget:self action:@selector(swichButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        swichButton.frame = CGRectMake(10, 0, 40, 40);
        
        [self addSubview:swichButton];
    }
    return self;
}

- (void)doneButtonClick:(id)sender
{
    [self.delegate emojiKeyboardHeaderViewInputDone:self];
}

- (void)swichButtonClick:(id)sender
{
    [self.delegate emojiKeyboardHeaderViewInputSwich:self];
}




@end
