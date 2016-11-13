//
//  MainViewController.m
//  EmojiKeyboard
//
//  Created by chen cheng on 14-8-25.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)dealloc
{
    [_textField release];
    _textField = nil;
    
    [_emojiKeyboardView release];
    _emojiKeyboardView = nil;
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
        
        
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, 300, 40)];
    
    _textField.borderStyle = UITextBorderStyleLine;
    
    [self.view addSubview:_textField];
    
    
    
    _emojiKeyboardView = [[EmojiKeyboardView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    _emojiKeyboardView.delegate = self;
    _textField.inputView = _emojiKeyboardView;
    
    
    
    _emojiKeyboardHeaderView = [[EmojiKeyboardHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    _emojiKeyboardHeaderView.delegate = self;
    _textField.inputAccessoryView = _emojiKeyboardHeaderView;
}

- (void)emojiKeyboardHeaderViewInputDone:(EmojiKeyboardHeaderView *)emojiKeyboardHeaderView
{
    _showNewKeyboardOnkeyboardDidHide = NO;
    [_textField resignFirstResponder];
}

- (void)emojiKeyboardHeaderViewInputSwich:(EmojiKeyboardHeaderView *)emojiKeyboardHeaderView
{
    _showNewKeyboardOnkeyboardDidHide = YES;
    
    if (_textField.inputView != nil)
    {
        _textField.inputView = nil;
    }
    else
    {
        _textField.inputView = _emojiKeyboardView;
    }
    
    [_textField resignFirstResponder];

}

- (void)emojiKeyboardView:(EmojiKeyboardView *)emojiKeyboardView inputKey:(int)keyIndex
{
    NSMutableString  *mutableString = [_textField.text mutableCopy];
    
    [mutableString appendString:[NSString stringWithFormat:@"[%d]", keyIndex]];
    
    _textField.text = mutableString;
    
    [mutableString release];
}


- (void)keyboardDidHide:(NSNotification *)notification
{
    if (_showNewKeyboardOnkeyboardDidHide)
    {
        [_textField becomeFirstResponder];
    }
}


@end
