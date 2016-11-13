//
//  TestViewController.m
//  日期选择视图控制器
//
//  Created by chen cheng on 14-9-2.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "TestViewController.h"
#import "MainViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)dealloc
{
    [_dateLabel release];
    _dateLabel = nil;
    
    [super dealloc];
}

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
    
    UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"选择日期" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    button.frame = CGRectMake(10, 80, 300, 40);
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 130, 300, 40)];
    _dateLabel.textAlignment = NSTextAlignmentCenter;
    _dateLabel.font = [UIFont boldSystemFontOfSize:24];
    [self.view addSubview:_dateLabel];
    
}

- (void)setDateWithYear:(int)year month:(int)month day:(int)day
{
    _dateLabel.text = [NSString stringWithFormat:@"%d年%d月%d日", year, month, day];
}

- (void)buttonClick:(id)sender
{
    [self.delegate showDatePicker];
}


@end
