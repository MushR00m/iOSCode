//
//  ViewController.m
//  Quartz2D——3
//
//  Created by chen songqi on 15/8/18.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"

#import "TranslateTest.h"

@interface ViewController ()

@property (strong, nonatomic) TranslateTest *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _testView = [[TranslateTest alloc] initWithFrame:CGRectMake(0, 0, 250, 200)]
    ;
    _testView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_testView];

    _testView.layer.borderColor = [UIColor redColor].CGColor;
    _testView.layer.borderWidth = 1;

}


@end
