//
//  MainViewController.h
//  EmojiKeyboard
//
//  Created by chen cheng on 14-8-25.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmojiKeyboardView.h"
#import "EmojiKeyboardHeaderView.h"

#import "ChatTextView.h"

@interface MainViewController : UIViewController<EmojiKeyboardHeaderViewDelegate, EmojiKeyboardViewDelegate>
{
    ChatTextView  *_chatTextView;
    UITextField   *_textField;
    
    EmojiKeyboardView  *_emojiKeyboardView;
    EmojiKeyboardHeaderView *_emojiKeyboardHeaderView;
    
    BOOL _showNewKeyboardOnkeyboardDidHide;
    
}

@end
