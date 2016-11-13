//
//  RightDrawerViewController.m
//  抽屉效果
//
//  Created by qianfeng on 14-8-28.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "RightDrawerViewController.h"

@interface RightDrawerViewController ()

@end

@implementation RightDrawerViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    //为了测试  加一些UILabel
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(250, 50, 100, 40)];
    label1.text = @"选项一";
    label1.font = [UIFont boldSystemFontOfSize:15];
    label1.textColor = [UIColor whiteColor];
    [self.view addSubview:label1];
    [label1 release];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(250, 50*2, 100, 40)];
    label2.text = @"选项二";
    label2.font = [UIFont boldSystemFontOfSize:15];
    label2.textColor = [UIColor whiteColor];
    [self.view addSubview:label2];
    [label2 release];
    
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(250, 50*3, 100, 40)];
    label3.text = @"选项三";
    label3.font = [UIFont boldSystemFontOfSize:15];
    label3.textColor = [UIColor whiteColor];
    [self.view addSubview:label3];
    [label3 release];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(250, 50*4, 100, 40)];
    label4.text = @"选项四";
    label4.font = [UIFont boldSystemFontOfSize:15];
    label4.textColor = [UIColor whiteColor];
    [self.view addSubview:label4];
    [label4 release];
    
    
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(250, 50*5, 100, 40)];
    label5.text = @"选项五";
    label5.font = [UIFont boldSystemFontOfSize:15];
    label5.textColor = [UIColor whiteColor];
    [self.view addSubview:label5];
    [label5 release];
    
    
    UILabel *label6 = [[UILabel alloc] initWithFrame:CGRectMake(250, 50*6, 100, 40)];
    label6.text = @"选项六";
    label6.font = [UIFont boldSystemFontOfSize:15];
    label6.textColor = [UIColor whiteColor];
    [self.view addSubview:label6];
    [label6 release];
    
    UILabel *label7 = [[UILabel alloc] initWithFrame:CGRectMake(250, 50*7, 100, 40)];
    label7.text = @"选项七";
    label7.font = [UIFont boldSystemFontOfSize:15];
    label7.textColor = [UIColor whiteColor];
    [self.view addSubview:label7];
    [label7 release];
    
    
    UILabel *label8 = [[UILabel alloc] initWithFrame:CGRectMake(250, 50*8, 100, 40)];
    label8.text = @"选项八";
    label8.font = [UIFont boldSystemFontOfSize:15];
    label8.textColor = [UIColor whiteColor];
    [self.view addSubview:label8];
    [label8 release];

}

@end
