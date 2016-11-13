//
//  ViewController.m
//  CAKeyframeAnimationDemo2
//
//  Created by chensongqi on 16/11/9.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.testView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    self.testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.testView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self animation1];
}


- (void)animation1 {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    animation.values = @[[NSValue valueWithCGPoint:CGPointMake(0, 0)],[NSValue valueWithCGPoint:CGPointMake(100, 100)],[NSValue valueWithCGPoint:CGPointMake(0, 200)]];
    animation.duration = 2;
//    animation.removedOnCompletion = NO;
//    animation.fillMode = kCAFillModeForwards;
    //calculationMode  用来改变补间动画的计算模式的。这个属性是CAKeyframeAnimation独有的属性。
    animation.calculationMode = kCAAnimationCubicPaced;
    
    //keyTimes属性指定的是当前状态节点到初始状态节点的时间占动画总时长的比例。若果不设置keyTimes则匀速播放
    //animation.keyTimes = @[@0,@0.8,@1];

    //指定了path属性，所以这时values属性将被忽略，按照指定的path运动。
    animation.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)].CGPath;
    animation.repeatCount = MAXFLOAT;
//    animation.keyTimes = @[@0,@0.25,@0.5,@0.75,@1];

    [self.testView.layer addAnimation:animation forKey:@"keyFrame"];

}

@end
