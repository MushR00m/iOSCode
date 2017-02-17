//
//  ViewController.m
//  收起键盘的方法
//
//  Created by 好样的 on 15/6/7.
//  Copyright (c) 2015年 好样的. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField *textField;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, 100, 25)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"请输入";
    [self.view addSubview:self.textField];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //方法一
//    [self.view endEditing:YES];
    
    
    
    //方法二
    //[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
    //方法三
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    
    
    //方法四  从事件链中拦截
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
