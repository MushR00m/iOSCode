//
//  ViewController.m
//  UILabel设置下划线
//
//  Created by chen songqi on 15/6/18.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 310, 50)];
    label.backgroundColor = [UIColor whiteColor];
    [label setLineBreakMode:NSLineBreakByWordWrapping];
    label.numberOfLines = 3;
    [label setFont:[UIFont systemFontOfSize:14]];
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"博文地址:http://www.cnblogs.com/xiaofeixiang 博客园-FlyElephant QQ群:228407086"]];

    NSRange contentRange = {0,[content length]};
    [content addAttribute:NSUnderlineStyleAttributeName
                    value:[NSNumber numberWithInteger:NSUnderlineStyleSingle]
                    range:contentRange];

    label.attributedText = content;
    [self.view addSubview:label];



    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(10, 200, 80, 30)];
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"FlyElephant"];

    NSRange titleRange = {0,[title length]};
    [title addAttribute:NSUnderlineStyleAttributeName
                  value:[NSNumber numberWithInteger:NSUnderlineStyleSingle]
                  range:titleRange];

    [button setAttributedTitle:title
                      forState:UIControlStateNormal];

    [button setBackgroundColor:[UIColor redColor]];
    [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:button];


}

@end
