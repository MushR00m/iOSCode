//
//  MainViewController.m
//  自定义键盘
//
//  Created by chen cheng on 14-8-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

#import "KeyBoardView.h"
#import "KeyBoardAccessoryView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITextField   *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, 300, 40)];
    
    textField.borderStyle = UITextBorderStyleLine;
    
    KeyBoardView  *keyBoardView = [[KeyBoardView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    
    keyBoardView.backgroundColor = [UIColor redColor];
    
    textField.inputView = keyBoardView;
    
    KeyBoardAccessoryView *keyBoardAccessoryView = [[KeyBoardAccessoryView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    keyBoardAccessoryView.backgroundColor = [UIColor blueColor];
    
    textField.inputAccessoryView = keyBoardAccessoryView;
    
    [keyBoardAccessoryView release];
    
    [keyBoardView release];
    
    [self.view addSubview:textField];
    
    [textField release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
