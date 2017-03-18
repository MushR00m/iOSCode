//
//  ViewController.m
//  TextFiel抖动
//
//  Created by songqi on 2017/3/18.
//  Copyright © 2017年 好样的. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField *testField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createTextField];
}


- (void)createTextField
{
    self.testField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 44)];
    self.testField.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:self.testField];
    NSLog(@"self.testField.layer.position.x %f",self.testField.layer.position.x);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self createAnimation];
}

- (void)createAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    animation.additive = YES;
    [self.testField.layer addAnimation:animation forKey:@"shake"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
