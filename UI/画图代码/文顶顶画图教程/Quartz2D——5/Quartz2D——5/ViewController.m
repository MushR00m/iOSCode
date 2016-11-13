//
//  ViewController.m
//  Quartz2D——5
//
//  Created by chen songqi on 15/8/18.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"

#import "PathView.h"
@interface ViewController ()

@property (nonatomic, strong) PathView *pathTestView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _pathTestView = [[PathView alloc] initWithFrame:self.view.bounds];
    _pathTestView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_pathTestView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
