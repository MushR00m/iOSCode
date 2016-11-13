//
//  ViewController.m
//  CellAutoLayout
//
//  Created by chensongqi on 16/10/26.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"

#import "SomeTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";

}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SomeTableViewController *vc = [[SomeTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
