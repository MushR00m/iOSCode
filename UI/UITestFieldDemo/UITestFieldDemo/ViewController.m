//
//  ViewController.m
//  UITestFieldDemo
//
//  Created by songqi on 2017/1/22.
//  Copyright © 2017年 好样的. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *vTextField;

@property (nonatomic, assign) NSInteger maxLength;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.vTextField.delegate = self;
    [self.vTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    _maxLength = 5;
    
}

- (IBAction)tapAction:(id)sender {
    
    [self.view endEditing:YES];
}

/*
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(range.length + range.location > textField.text.length)
    {
        return NO;
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return newLength <= 5;
}
 */


- (void)textFieldDidChange:(UITextField *)textField
{
    NSString *text = textField.text;
    //    NSLog(@"text:%@",text);
    
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制,防止中文被截断
    
    if (!position){
        //---字符处理
        NSLog(@"---- %ld",_maxLength);
        if (text.length > _maxLength){
            //中文和emoj表情存在问题，需要对此进行处理
            NSRange range;
            NSUInteger inputLength = 0;
            for(int i=0; i < text.length && inputLength <= _maxLength; i += range.length) {
                range = [textField.text rangeOfComposedCharacterSequenceAtIndex:i];
                inputLength += [text substringWithRange:range].length;
                if (inputLength > _maxLength) {
                    NSString* newText = [text substringWithRange:NSMakeRange(0, range.location)];
                    textField.text = newText;
                }
            }
        }
    }
}


@end
