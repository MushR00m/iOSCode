//
//  XuBigView.m
//  XuLib
//
//  Created by xuwenyuan on 2017/6/6.
//  Copyright © 2017年 xu. All rights reserved.
//

#import "XuBigView.h"

#define FIRST_DISTANCE (150.f)

typedef enum {
    XuPulling = 0,
    XuNormal,
    XuLoading,
    XuSuccess,
    XuFailed,
} XuRefreshState;

@interface XuBigView()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, assign) XuRefreshState state;
@property (nonatomic, strong) CALayer *wavePoint;

@end

@implementation XuBigView

- (id)init
{
    if (self = [super init]) {
        CGRect frame = CGRectMake(0, -[UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.frame = frame;
        [self initLayer];
    }
    
    return self;
}

- (void)initLayer
{
    self.shapeLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.shapeLayer];
    self.shapeLayer.fillColor = [UIColor greenColor].CGColor;
    self.shapeLayer.strokeColor = [UIColor greenColor].CGColor;
    self.shapeLayer.lineWidth = 1.f;
    
    self.wavePoint = [CALayer layer];
    self.wavePoint.bounds = CGRectMake(0, 0, 1, 1);
    self.wavePoint.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height);
    [self.shapeLayer addSublayer:self.wavePoint];
}

- (void)updateShapeLayerPath:(CGFloat)offsetY
{
    UIBezierPath *p = [UIBezierPath bezierPath];
    [p moveToPoint:CGPointMake(0, 0)];
    CGPoint leftBottom = CGPointMake(0, self.bounds.size.height - MAX(-offsetY - FIRST_DISTANCE, 0));
    CGPoint rightBottom = CGPointMake(self.bounds.size.width, leftBottom.y);
    [p addLineToPoint:leftBottom];
    [p addQuadCurveToPoint:rightBottom controlPoint:self.wavePoint.position];
    [p addLineToPoint:CGPointMake(self.bounds.size.width, 0)];
    [p closePath];
    self.shapeLayer.path = p.CGPath;
}

- (void)refreshScrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y >= 0) {
        self.state = XuPulling;
    }
    if (self.state == XuLoading) {
        if (scrollView.contentOffset.y >= -FIRST_DISTANCE) {
            [scrollView setContentOffset:CGPointMake(0, -FIRST_DISTANCE)];
        }
    }
//    if (self.state != XuLoading) {
        [self updateShapeLayerPath:scrollView.contentOffset.y];
//    }
}

- (void)refreshScrollViewDidEndDragging:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y <= - FIRST_DISTANCE) {
        
        self.state = XuLoading;
        NSLog(@"");
        
//        [self doShakeAnimation:scrollView.contentOffset.y];
    }
    
}

//- (void)doShakeAnimation:(CGFloat)offsetY
//{
//    CAKeyframeAnimation *rectRunAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
//    
//    rectRunAnimation.values = @[[NSNumber numberWithFloat:self.bounds.size.height],
//                                [NSNumber numberWithFloat:self.bounds.size.height - (-offsetY - FIRST_DISTANCE)],
//                                [NSNumber numberWithFloat:self.bounds.size.height - -offsetY - FIRST_DISTANCE],
//                                [NSNumber numberWithFloat:self.bounds.size.height - (-offsetY - FIRST_DISTANCE)],
//                                [NSNumber numberWithFloat:self.bounds.size.height - (-offsetY - FIRST_DISTANCE)]];
//    //设定每个关键帧的时长，如果没有显式地设置，则默认每个帧的时间=总duration/(values.count - 1)
//    rectRunAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0],
//                                  [NSNumber numberWithFloat:0.6],
//                                  [NSNumber numberWithFloat:0.7],
//                                  [NSNumber numberWithFloat:0.8],
//                                  [NSNumber numberWithFloat:1]];
//    rectRunAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
//                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
//                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
//                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
//    rectRunAnimation.repeatCount = 2;
//    rectRunAnimation.autoreverses = NO;
//    rectRunAnimation.calculationMode = kCAAnimationLinear;
//    rectRunAnimation.duration = 4;
//    [rectLayer addAnimation:rectRunAnimation forKey:@"rectRunAnimation"];
//}
//{
//    let bounce = CAKeyframeAnimation(keyPath: "transform.translation.y")
//    bounce.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
//    bounce.duration = bounceDuration
//    bounce.values = [
//                     reference.frame.origin.y,
//                     y * 0.5,
//                     y * 1.2,
//                     y * 0.8,
//                     y * 1.1,
//                     y
//                     ]
//    bounce.isRemovedOnCompletion = true
//    bounce.fillMode = kCAFillModeForwards
//    bounce.delegate = self
//    reference.layer.add(bounce, forKey: "return")
//}

@end
