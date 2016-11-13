//
//  ViewController1.m
//  导航栏从无到有的处理
//
//  Created by chen songqi on 15/6/29.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController1.h"

#import "ViewController2.h"

@implementation ViewController1



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    self.title = @"第一页";
    self.view.backgroundColor = [UIColor redColor];


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
    ViewController2 *vc = [[ViewController2 alloc] init];

    [self.navigationController pushViewController:vc animated:YES];

    [vc.navigationController setNavigationBarHidden:YES animated:YES];

}
@end
