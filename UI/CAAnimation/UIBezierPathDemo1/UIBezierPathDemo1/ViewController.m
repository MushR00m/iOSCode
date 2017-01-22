//
//  ViewController.m
//  UIBezierPathDemo1
//
//  Created by chensongqi on 16/11/10.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *testLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createTestLayer];
//    [self testMethod7];
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

- (void)testBezierPath4
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 5;
    animation.calculationMode = kCAAnimationCubicPaced;
    
    UIBezierPath *aPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 45, 100, 100) byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(80, 80)];
    animation.path = aPath.CGPath;
    [self.testLayer addAnimation:animation forKey:@"xxxx"];
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

- (void)testBezierPath5
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 5;
    animation.calculationMode = kCAAnimationCubicPaced;
    
    UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:75 startAngle:0 endAngle:(M_PI) clockwise:NO];
    animation.path = aPath.CGPath;
    [self.testLayer addAnimation:animation forKey:@"positionAnimation"];

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

- (void)testMethod7
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: (-20.8)*M_PI/180 ];
    rotationAnimation.duration = 2.5f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    rotationAnimation.fillMode=kCAFillModeForwards;
    rotationAnimation.removedOnCompletion = NO;
    [self.testLayer addAnimation:rotationAnimation forKey:@"rotationAnimation"];

}

- (void)createTestLayer
{
    self.testLayer = [CALayer layer];
    self.testLayer.frame = CGRectMake(200, 200, 5, 5);
    self.testLayer.backgroundColor = [[UIColor redColor] CGColor];
    [self.view.layer addSublayer:self.testLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testBezierPath5];
}

@end
