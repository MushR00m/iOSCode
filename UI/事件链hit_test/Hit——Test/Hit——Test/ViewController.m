//
//  ViewController.m
//  Hit——Test
//
//  Created by 好样的 on 15/9/12.
//  Copyright (c) 2015年 好样的. All rights reserved.
//

#import "ViewController.h"

#import "TestA.h"
#import "TestB.h"

@interface ViewController ()


@property (nonatomic, strong) TestA *hitA;
@property (nonatomic, strong) TestB *hitB;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    _hitA = [[TestA alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _hitA.backgroundColor = [UIColor redColor];
    _hitA.center = self.view.center;
    [self.view addSubview:_hitA];
    

    
    _hitB = [[TestB alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _hitB.backgroundColor = [UIColor blackColor];
    [_hitA addSubview:_hitB];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapA)];
    [_hitA addGestureRecognizer:tap];
    tap.cancelsTouchesInView = NO;
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapB)];
//    [_hitB addGestureRecognizer:tap2];
//   tap2.cancelsTouchesInView = NO;
}

- (void)TapA
{
    NSLog(@"点击A");
}


- (void)TapB
{
    NSLog(@"点击B");
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
}

@end
