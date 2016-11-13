//
//  EmojiKeyboardView.m
//  EmojiKeyboard
//
//  Created by chen cheng on 14-8-25.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "EmojiKeyboardView.h"

@implementation EmojiKeyboardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        CGFloat emojiWidth = self.frame.size.width / 8.0;
        CGFloat emojiHeight = self.frame.size.height / 5.0;
        
        int index = 0;
        
        for (int i=0; i<5; i++)
        {
            for (int j=0; j<8; j++)
            {
                UIButton *emojiButton = [UIButton buttonWithType:UIButtonTypeCustom];
                
                emojiButton.tag = index;
                
                emojiButton.frame = CGRectMake(j * emojiWidth, i * emojiHeight, emojiWidth, emojiHeight);
                
                if (i == 4 && j == 7)
                {
                    [emojiButton setImage:[UIImage imageNamed:@"keyboard_delete.png"] forState:UIControlStateNormal];
                    
                    [emojiButton addTarget:self action:@selector(deleteButtonClick:) forControlEvents:UIControlEventTouchUpInside];
                }
                else
                {
                    [emojiButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", emojiButton.tag]] forState:UIControlStateNormal];
                    
                    [emojiButton addTarget:self action:@selector(emojiButtonClick:) forControlEvents:UIControlEventTouchUpInside];
                }
                
            
                
                
                [self addSubview:emojiButton];
                
                index++;
            }
        }
    }
    return self;
}

- (void)deleteButtonClick:(id)sender
{
    [self.delegate emojiKeyboardViewInputDelete:self];
}

- (void)emojiButtonClick:(UIButton *)emojiButton
{
    [self.delegate emojiKeyboardView:self inputKey:emojiButton.tag];
}



@end
