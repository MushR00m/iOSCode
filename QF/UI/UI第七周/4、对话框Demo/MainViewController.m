//
//  MainViewController.m
//  对话框Demo
//
//  Created by chen cheng on 14-7-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"
#import "Dialog.h"
#import "TestDialogView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 30, 300, 40);
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.borderWidth = 1;
    [button setTitle:@"显示对话框" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)buttonClick:(id)sender
{
    NSLog(@"buttonClick");
    
    
    TestDialogView *dialogView = [[TestDialogView alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
    
    //UIView  *dialogView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    //dialogView.backgroundColor = [UIColor darkGrayColor];
    
    showDialogView(dialogView, NO, QFShowDialogViewAnimationFromCenter, ^(BOOL finished) {
    NSLog(@"对话框显示完成");
});
    
    
    [dialogView release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
