//
//  MainViewController.m
//  NSUserDefaults例子
//
//  Created by chen cheng on 14-9-3.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (IBAction)writeButtonClick:(id)sender
{
    NSUserDefaults * standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    //把数据设置到了  这个standardUserDefaults对象里面了  （数据在内存）
    [standardUserDefaults setObject:@"zhangsan" forKey:@"name"];
    
    //把数据 同步到硬盘  (数据保存到了文件里面)
    [standardUserDefaults synchronize];
}
- (IBAction)readButtonClick:(id)sender
{
    NSUserDefaults * standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *name = [standardUserDefaults objectForKey:@"name"];
    
    NSLog(@"name = %@", name);
}

- (IBAction)deleteButtonClick:(id)sender
{
    NSUserDefaults * standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    //把数据 从对象中删除  (数据在内存当中被删除了  文件中还有数据)
    [standardUserDefaults removeObjectForKey:@"name"];
    
    //把数据 同步到硬盘   （数据才从文件中被删除）
    [standardUserDefaults synchronize];
}

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //应用程序的根目录
    NSLog(@"NSHomeDirectory() = %@", NSHomeDirectory());
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
