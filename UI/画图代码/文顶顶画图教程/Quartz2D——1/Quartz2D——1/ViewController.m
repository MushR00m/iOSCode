//
//  ViewController.m
//  Quartz2D——1
//
//  Created by chen songqi on 15/8/18.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"

#import "CSLineView.h"
#import "CSLineView2.h"
#import "CSLlineView3.h"
#import "CSLineVIew4.h"



@interface ViewController ()

@property (nonatomic, strong) CSLineVIew4 *drawView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _drawView = [[CSLineVIew4 alloc] initWithFrame:self.view.bounds];
    _drawView.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:_drawView];
}



@end
