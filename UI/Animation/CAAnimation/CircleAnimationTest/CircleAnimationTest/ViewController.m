//
//  ViewController.m
//  CircleAnimationTest
//
//  Created by zmit on 15/2/6.
//  Copyright (c) 2015年 zmit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    double add;
}

//创建全局属性
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建出CAShapeLayer
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = CGRectMake(0, 0, 150, 150);
    self.shapeLayer.position = self.view.center;
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    //设置线条的宽度和颜色
    self.shapeLayer.lineWidth = 2.0f;
    self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    //设置stroke起始点
    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd = 0;
    add = 0.1;
    
    //创建出圆形贝塞尔曲线
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 150, 150)];
    
    //让贝塞尔曲线与CAShapeLayer产生联系
    self.shapeLayer.path = circlePath.CGPath;
    
    //添加并显示
    [self.view.layer addSublayer:self.shapeLayer];
    
}

- (void)circleAnimationTypeOne
{
    if (self.shapeLayer.strokeEnd > 1 && self.shapeLayer.strokeStart < 1) {
        self.shapeLayer.strokeStart += add;
    }else if(self.shapeLayer.strokeStart == 0){
        self.shapeLayer.strokeEnd += add;
    }
    
    if (self.shapeLayer.strokeEnd == 0) {
        self.shapeLayer.strokeStart = 0;
    }
    
    if (self.shapeLayer.strokeStart == self.shapeLayer.strokeEnd) {
        self.shapeLayer.strokeEnd = 0;
    }
}

- (void)circleAnimationTypeTwo
{
    CGFloat valueOne = arc4random() % 100 / 100.0f;
    CGFloat valueTwo = arc4random() % 100 / 100.0f;
    
    self.shapeLayer.strokeStart = valueOne < valueTwo ? valueOne : valueTwo;
    self.shapeLayer.strokeEnd = valueTwo > valueOne ? valueTwo : valueOne;
}

- (IBAction)Start:(id)sender {
    //用定时器模拟数值输入的情况
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                              target:self
                                            selector:@selector(circleAnimationTypeTwo)
                                            userInfo:nil
                                             repeats:YES];
}
@end
