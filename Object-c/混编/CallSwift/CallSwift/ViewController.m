//
//  ViewController.m
//  CallSwift
//
//  Created by chensongqi on 16/11/24.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"

#import "CallSwift-Swift.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 使用Swift的类
    Test *test = [[Test alloc] init];
    [test log];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
