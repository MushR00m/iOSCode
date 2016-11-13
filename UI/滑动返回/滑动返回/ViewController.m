//
//  ViewController.m
//  滑动返回
//
//  Created by chen songqi on 15/6/17.
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
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 200, 40);
    button.center = self.view.center;
    [self.view addSubview:button];

}

- (void)buttonClick:(id)sender
{

    MainViewController *vc1 = [[MainViewController alloc] init];
    vc1.title = @"第二个控制器";
    vc1.view.backgroundColor = [UIColor darkGrayColor];
    [self.navigationController pushViewController:vc1 animated:YES];
}


@end
