//
//  ViewController.m
//  isJailBreak
//
//  Created by chensongqi on 16/12/15.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//参考链接
//http://blog.csdn.net/yiyaaixuexi/article/details/20286929
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
     未越狱设备返回结果是null，越狱设备就各有各的精彩了，尤其是老一点的iOS版本越狱环境。
     */
    char *env = getenv("DYLD_INSERT_LIBRARIES");
    NSLog(@"xxxx %s", env);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
