//
//  EmojiKeyboardHeaderView.h
//  EmojiKeyboard
//
//  Created by chen cheng on 14-8-25.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EmojiKeyboardHeaderView;

@protocol EmojiKeyboardHeaderViewDelegate <NSObject>

- (void)emojiKeyboardHeaderViewInputDone:(EmojiKeyboardHeaderView *)emojiKeyboardHeaderView;

- (void)emojiKeyboardHeaderViewInputSwich:(EmojiKeyboardHeaderView *)emojiKeyboardHeaderView;

@end


@interface EmojiKeyboardHeaderView : UIView
{
    id<EmojiKeyboardHeaderViewDelegate> _delegate;
}

@property(assign, readwrite, nonatomic) id delegate;

@end
