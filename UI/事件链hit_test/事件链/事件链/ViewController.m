//
//  ViewController.m
//  事件链
//
//  Created by chensongqi on 15/3/13.
//  Copyright (c) 2015年 chensongqi. All rights reserved.
//

#import "ViewController.h"

#import "MyView.h"

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

    
}

- (void)TapE
{
    NSLog(@"点击A");
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
