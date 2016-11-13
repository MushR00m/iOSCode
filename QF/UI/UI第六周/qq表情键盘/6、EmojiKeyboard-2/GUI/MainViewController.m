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
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300, 100)];
    
    _label.layer.borderColor = [UIColor blackColor].CGColor;
    _label.layer.borderWidth = 1;
    _label.textAlignment = NSTextAlignmentLeft;
    //_label.font = [UIFont systemFontOfSize:20];
    _label.font = [UIFont fontWithName:@"Arial" size:20];
    _label.numberOfLines = 0;

    _label.lineBreakMode =  NSLineBreakByWordWrapping;
    
    [self.view addSubview:_label];
    
    
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 400, 300, 40)];
    
    UIButton *sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sendButton.frame = CGRectMake(0, 0, 50, 40);
    
    [sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [sendButton addTarget:self action:@selector(showTextClick) forControlEvents:UIControlEventTouchUpInside];
    
    _textField.rightView = sendButton;
    _textField.rightViewMode = UITextFieldViewModeAlways;
    
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
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.view.layer.transform = CATransform3DIdentity;
        
    } completion:^(BOOL finished) {
        
    }];
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

- (void)emojiKeyboardViewInputDelete:(EmojiKeyboardView *)emojiKeyboardView
{
    NSMutableString  *mutableString = [_textField.text mutableCopy];
    
    
    
    for (int i=[mutableString length]; i>0; i--)
    {
        unichar ch = [mutableString characterAtIndex:[mutableString length]-1];
        
         [mutableString deleteCharactersInRange:NSMakeRange([mutableString length]-1, 1)];
        
        if (ch == '[')
        {
            break;
        }
    }
    
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

- (void)keyboardWillShow:(NSNotification *)notification
{
    CGFloat keyboardHeight = 0;
    
    if (_textField.inputView == _emojiKeyboardView)
    {
        keyboardHeight = 240 + 10; //qq表情键盘的高度
    }
    else
    {
        keyboardHeight = 256 + 40; //系统键盘的高度
    }

    CGFloat d = self.view.bounds.size.height - ( _textField.frame.origin.y + _textField.frame.size.height);
    
    if (d < keyboardHeight)
    {
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            self.view.layer.transform = CATransform3DMakeTranslation(0, d - keyboardHeight, 0);
            
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)showTextClick
{
    NSMutableString  *mutableString = [_textField.text mutableCopy];
    _label.text = mutableString;
    
    _textField.text = nil;
    
    _showNewKeyboardOnkeyboardDidHide = NO;
    [_textField resignFirstResponder];     
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.view.layer.transform = CATransform3DIdentity;
        
    } completion:^(BOOL finished) {
        
    }];

    
}


@end
