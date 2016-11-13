//
//  EmojiKeyboardView.h
//  EmojiKeyboard
//
//  Created by chen cheng on 14-8-25.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EmojiKeyboardView;

@protocol EmojiKeyboardViewDelegate <NSObject>

- (void)emojiKeyboardView:(EmojiKeyboardView *)emojiKeyboardView inputKey:(int)keyIndex;

@end

@interface EmojiKeyboardView : UIView
{
    id<EmojiKeyboardViewDelegate> _delegate;
}

@property(assign, readwrite, nonatomic)id delegate;

@end
