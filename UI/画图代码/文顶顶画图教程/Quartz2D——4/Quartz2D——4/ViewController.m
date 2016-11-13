//
//  ViewController.m
//  Quartz2D——4
//
//  Created by chen songqi on 15/8/18.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"

#import "ClipView.h"

@interface ViewController ()

@property (nonatomic, strong) ClipView *clipView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _clipView = [[ClipView alloc] initWithFrame:self.view.bounds];
    _clipView.backgroundColor = [UIColor whiteColor];
    
    _clipView.layer.borderWidth = 1;
    _clipView.layer.borderColor = [UIColor redColor].CGColor;
    
    [self.view addSubview:_clipView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
