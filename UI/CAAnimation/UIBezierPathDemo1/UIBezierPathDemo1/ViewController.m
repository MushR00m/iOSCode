//
//  ViewController.m
//  UIBezierPathDemo1
//
//  Created by chensongqi on 16/11/10.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    [self testMethod6];
}

//不规则多边形
- (void)testMethod1
{
    
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    
    aPath.lineWidth = 5.0;
    aPath.lineJoinStyle = kCGLineCapRound;
    aPath.lineCapStyle = kCGLineCapRound;
    [aPath moveToPoint:CGPointMake(200, 65)];
    [aPath addLineToPoint:CGPointMake(300, 140)];
    [aPath addLineToPoint:CGPointMake(260, 240)];
    [aPath addLineToPoint:CGPointMake(140, 240)];
    [aPath addLineToPoint:CGPointMake(100, 140)];
    [aPath closePath];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = aPath.CGPath;
    shapeLayer.strokeColor = [UIColor greenColor].CGColor;
    shapeLayer.fillColor = [UIColor redColor].CGColor;

    [self.view.layer addSublayer:shapeLayer];
}

//画矩形
- (void)testMethod2
{
    UIBezierPath *aPath = [UIBezierPath bezierPathWithRect:CGRectMake(150, 45, 100, 100)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = aPath.CGPath;
    shapeLayer.strokeColor = [UIColor greenColor].CGColor;
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:shapeLayer];

}

//画矩形
- (void)testMethod3
{
    UIBezierPath *aPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(150, 45, 100, 100) cornerRadius:8];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = aPath.CGPath;
    shapeLayer.strokeColor = [UIColor greenColor].CGColor;
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:shapeLayer];
    
}

//画矩形
- (void)testMethod4
{
    UIBezierPath *aPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 45, 100, 100) byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(80, 80)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = aPath.CGPath;
    shapeLayer.strokeColor = [UIColor greenColor].CGColor;
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:shapeLayer];
    
}

//画弧线
- (void)testMethod5
{
    UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:75 startAngle:0 endAngle:(M_PI) clockwise:NO];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = aPath.CGPath;
    shapeLayer.strokeColor = [UIColor greenColor].CGColor;
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:shapeLayer];
}

//画曲线
- (void)testMethod6
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    [aPath moveToPoint:CGPointMake(20, 180)];
    [aPath addQuadCurveToPoint:CGPointMake(200, 100) controlPoint:CGPointMake(70, 0)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = aPath.CGPath;
    shapeLayer.strokeColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:shapeLayer];
}


@end
