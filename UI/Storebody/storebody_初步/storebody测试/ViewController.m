//
//  ViewController.m
//  storebody测试
//
//  Created by chen songqi on 15/7/24.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"

#import "MainViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    NSLog(@"调用这个方法 ViewController");
    
}


@end
