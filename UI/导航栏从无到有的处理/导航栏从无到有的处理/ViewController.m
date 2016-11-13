//
//  ViewController.m
//  导航栏从无到有的处理
//
//  Created by chen songqi on 15/6/29.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"

#import "MainViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    self.title = @"第一页";
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];

    [bt addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

    [bt setTitle:@"下一页" forState:UIControlStateNormal];

    [bt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    bt.frame = CGRectMake(0, 0, 100, 40);
    bt.center = self.view.center;

    [self.view addSubview:bt];


}

- (void)btnClick:(UIButton *)sender
{
    MainViewController *vc = [MainViewController new];

    [self.navigationController pushViewController:vc animated:YES];

    [vc.navigationController setNavigationBarHidden:NO animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
