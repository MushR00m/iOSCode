//
//  MainViewController.m
//  UITextFieldDemo
//
//  Created by chen cheng on 14-8-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)init
{
    self = [super init];
    if (self)
    /**
     *  告诉通知中心 对什么样通知感兴趣
     *
     *  @param observer  感兴趣的对象（谁对通知感兴趣）
     *  @param aSelector 当通知收到通知时、通知中心需要回调的接口
     *  @param aName     感兴趣的通知名称
     *  @param anObject  对哪一个对象发送的通知感兴趣（如果为nil、表示对所有人发送通知都感兴趣）
     */
        //- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject
        
        //告诉通知中心 对什么样通知感兴趣
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    }
    return self;
}

- (void)keyboardWillShow:(NSNotification *)notification
{
   // NSLog(@"notification = %@", notification);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITextField   *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 300, 300, 40)];
    
    textField.borderStyle =  UITextBorderStyleBezel;
    
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    leftLabel.text = @"姓名:";
    textField.leftView = leftLabel;
    textField.leftViewMode = UITextFieldViewModeAlways;
    

    textField.placeholder = @"请出入姓名";
    
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    textField.autocorrectionType = NO;
    
    textField.secureTextEntry = YES;//以密码的形式
    
    textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    textField.returnKeyType = UIReturnKeyDone;
    
    textField.delegate = self;
    
    [leftLabel release];
    
    [self.view addSubview:textField];
    
    [textField release];
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"11 textFieldShouldBeginEditing");
    
    
    CGFloat d =  480 - (textField.frame.origin.y +  textField.frame.size.height);
    if (d < 216)
    {
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            textField.layer.transform = CATransform3DTranslate(textField.layer.transform, 0, -(216 - d + 40), 0);
            
        } completion:^(BOOL finished) {
            
        }];
        
    }
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"22 textFieldDidBeginEditing");
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSLog(@"33 textFieldShouldEndEditing");
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"44 textFieldDidEndEditing");
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        textField.layer.transform = CATransform3DIdentity;
        
    } completion:^(BOOL finished) {
        
    }];

}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"55 shouldChangeCharactersInRange");
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    NSLog(@"66 textFieldShouldClear");
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"77 textFieldShouldReturn");
    
    //失去第一响应者资格
    [textField resignFirstResponder];
    return YES;
}



@end
