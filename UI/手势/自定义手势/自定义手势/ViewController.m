//
//  ViewController.m
//  自定义手势
//
//  Created by 好样的 on 15/7/26.
//  Copyright (c) 2015年 好样的. All rights reserved.
//

#import "ViewController.h"

#import "CustomGestureRecognizer.h"
@interface ViewController ()

@property (nonatomic, strong) UIView *testView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.testView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.testView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.testView];
    
    CustomGestureRecognizer *cust = [[CustomGestureRecognizer alloc] initWithTarget:self action:@selector(ttt)];
    [self.testView addGestureRecognizer:cust];
    
}

- (void)ttt
{
    NSLog(@"响应这个手势");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
