//
//  ViewController.m
//  UITextView实现PlaceHolder的
//
//  Created by chen songqi on 15/6/18.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"
#import "PlaceHolderTextView.h"
@interface ViewController ()

@property (nonatomic, strong) PlaceHolderTextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.textView=[[PlaceHolderTextView alloc]initWithFrame:CGRectMake(10, 30, CGRectGetWidth(self.view.frame)-20, 200)];
    self.textView.placeholder=@"博客园FlyElephant\n博客地址:http://www.cnblogs.com/xiaofeixiang";
    self.textView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.textView.layer.borderWidth=1.0;
    self.textView.scrollEnabled = YES;
    self.textView.autoresizingMask =
    UIViewAutoresizingFlexibleHeight; //自适应高度
    self.textView.returnKeyType = UIReturnKeyDefault; //返回键的类型

    self.textView.keyboardType = UIKeyboardTypeDefault; //键盘类型

    self.textView.layer.borderColor = [UIColor redColor].CGColor;
    self.textView.layer.borderWidth = 1;



    [self.view addSubview:self.textView];
}

@end
