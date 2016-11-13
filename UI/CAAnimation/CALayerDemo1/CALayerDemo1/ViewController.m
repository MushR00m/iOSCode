//
//  ViewController.m
//  CALayerDemo1
//
//  Created by chensongqi on 16/11/8.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *testLayer;

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@property (nonatomic, strong) CAShapeLayer *shapelayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createShapeLayer];

}

- (void)createTestLayer
{
    self.testLayer = [[CALayer alloc] init];
    self.testLayer.frame = self.view.bounds;//CGRectMake(100, 100, 100, 100);
    self.testLayer.backgroundColor = [[UIColor redColor] CGColor];
    
    //“锚点”,决定着CALayer身上的哪个点会在position属性所指的位置,
    self.testLayer.anchorPoint = CGPointMake(0, 0);
    [self.view.layer addSublayer:self.testLayer];
    NSLog(@"position: %@",NSStringFromCGPoint(self.testLayer.position));
}

- (void)createGradientLayer
{
    self.gradientLayer = [[CAGradientLayer alloc] init];
    self.gradientLayer.frame = self.view.bounds;//CGRectMake(100, 300, 100, 100);
    self.gradientLayer.colors = @[(id)[UIColor redColor].CGColor,
                                  (id)[UIColor blackColor].CGColor];
    
    self.gradientLayer.locations = @[@0.1,@0.5];
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(0, 1);
    [self.view.layer addSublayer:self.gradientLayer];
}

- (void)createShapeLayer
{
    self.shapelayer = [CAShapeLayer layer];
    self.shapelayer.strokeColor = [UIColor greenColor].CGColor;
    self.shapelayer.fillColor = [UIColor redColor].CGColor;
    //Options are `butt', `round' * and `square'. Defaults to `butt'
    self.shapelayer.lineCap = @"round";
    self.shapelayer.lineJoin = @"round";
    self.shapelayer.lineWidth = 2;
    
    //绘制一条路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(200, 200)];
    [path addLineToPoint:CGPointMake(200, 300)];
    [path closePath];
    
    self.shapelayer.path = path.CGPath;
    
    [self.view.layer addSublayer:self.shapelayer];
}

@end

