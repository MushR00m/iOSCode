//
//  ViewController.m
//  Hit Testing
//
//  Created by chen songqi on 15/8/11.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *layerView;

@property (nonatomic, strong) CALayer *blueLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _layerView = [[CALayer alloc] init];
    _layerView.frame = CGRectMake(50, 50, 100, 100);
    _layerView.backgroundColor = [UIColor groupTableViewBackgroundColor].CGColor;
    [self.view.layer addSublayer:_layerView];


    _blueLayer = [[CALayer alloc] init];
    _blueLayer.frame = CGRectMake(50, 200, 100, 100);
    _blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:_blueLayer];

}

//CALayer并不关心任何响应链事件，所以不能直接处理触摸事件或者手势。但是它有一系列的方法帮你处理事件：-containsPoint:和-hitTest:。

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    CALayer *layer = [self.view.layer hitTest:point];
    if (layer == self.blueLayer) {
        [[[UIAlertView alloc] initWithTitle:@"Inside Blue Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    } else if (layer == self.layerView) {
        [[[UIAlertView alloc] initWithTitle:@"Inside White Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
