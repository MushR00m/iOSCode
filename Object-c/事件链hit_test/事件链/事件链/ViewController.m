//
//  ViewController.m
//  事件链
//
//  Created by chensongqi on 15/3/13.
//  Copyright (c) 2015年 chensongqi. All rights reserved.
//

#import "ViewController.h"

#import "MyView.h"
#import "MyButton.h"

@interface ViewController ()
{
    MyView *_viewA;
    MyView *_viewB;

    MyView *_viewC;

    MyView *_viewD;

    MyView *_viewE;

}
@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _viewA = [[MyView alloc] initWithFrame:CGRectMake(10, 10, 300, 200) Color:[UIColor blackColor] andName:@"viewA"];
    [self.view addSubview:_viewA];
    
    _viewB = [[MyView alloc] initWithFrame:CGRectMake(10, 240, 300, 200) Color:[UIColor blackColor] andName:@"viewB"];
    [self.view addSubview:_viewB];
    
    _viewC = [[MyView alloc] initWithFrame:CGRectMake(10, 10, 120, 180) Color:[UIColor blueColor] andName:@"viewC"];
    [_viewB addSubview:_viewC];
    
    _viewD = [[MyView alloc] initWithFrame:CGRectMake(170, 10, 120, 180) Color:[UIColor blueColor] andName:@"viewD"];
    [_viewB addSubview:_viewD];
    
    _viewE = [[MyView alloc] initWithFrame:CGRectMake(30, 40, 60, 100) Color:[UIColor redColor] andName:@"viewE"];
    [_viewD addSubview:_viewE];
    
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapE)];
        [_viewE addGestureRecognizer:tap];

    MyButton *btn = [MyButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"测试按钮" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 550, 100, 50);
    [self.view addSubview:btn];
    
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSelf)];
    [self.view addGestureRecognizer:tap2];

}

- (void)TapE
{
    NSLog(@"点击E");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"controller touchesBegan");
    UITouch *touch = [touches anyObject];
    if ([touch.view isKindOfClass:MyView.class]) {
        MyView *view = (MyView *)touch.view;
        
        NSLog(@"touchesBegan:%@",view.name);

    } else {
        NSLog(@"touchesBegan");
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if ([touch.view isKindOfClass:MyView.class]) {
        MyView *view = (MyView *)touch.view;
        
        NSLog(@"touchesEnded:%@",view.name);
    } else {
        NSLog(@"touchesEnded");
    }
    
}

- (void)tapSelf
{
    NSLog(@"tapSelf");
}

/*
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _viewA = [[MyView alloc] initWithFrame:CGRectMake(10, 10, 300, 200) Color:[UIColor redColor] andName:@"viewA"];
    [self.view addSubview:_viewA];
    
    _viewB = [[MyView alloc] initWithFrame:CGRectMake(200, 100, 300, 200) Color:[UIColor blackColor] andName:@"viewB"];
    [self.view addSubview:_viewB];
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    MyView *view = (MyView *)touch.view;
    
    NSLog(@"touchesBegan:%@",view.name);
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    MyView *view = (MyView *)touch.view;
    
    NSLog(@"touchesEnded:%@",view.name);
    
}*/

@end
