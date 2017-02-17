//
//  ViewController.m
//  Test--B
//
//  Created by 好样的 on 15/9/12.
//  Copyright (c) 2015年 好样的. All rights reserved.
//

#import "ViewController.h"

#import "MyView.h"

@interface ViewController ()

@property (nonatomic, strong) MyView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _testView = [[MyView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _testView.center = self.view.center;
    _testView.name = @"A";
    _testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_testView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [_testView addGestureRecognizer:tap];
    
    
}

- (void)tapAction
{
    NSLog(@"tapAction");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesEnded");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
