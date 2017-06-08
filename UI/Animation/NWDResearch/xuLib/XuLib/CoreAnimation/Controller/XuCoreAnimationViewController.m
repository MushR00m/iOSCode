//
//  XuCoreAnimationViewController.m
//  XuLib
//
//  Created by xuwenyuan on 2017/5/26.
//  Copyright © 2017年 xu. All rights reserved.
//

#import "XuCoreAnimationViewController.h"

@interface XuCoreAnimationViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) CALayer *greenLayer;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (strong, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation XuCoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.greenLayer = [CALayer layer];
    self.greenLayer.frame = CGRectMake(100, 150, 100, 100);
    self.greenLayer.backgroundColor = [UIColor clearColor].CGColor;
    [self.view.layer addSublayer:self.greenLayer];
    
    self.shapeLayer = [CAShapeLayer layer];
    [self.view.layer addSublayer:self.shapeLayer];
    _shapeLayer.lineWidth = 5.f;
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer.strokeColor = [UIColor yellowColor].CGColor;
    _shapeLayer.strokeEnd = 0.f;
    
    [self.imgView setImage:[UIImage imageNamed:@"trans1"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//隐式动画
- (IBAction)leftBtnClick:(id)sender
{
//    if (self.greenLayer.bounds.size.width >= 200) {
//        self.greenLayer.bounds = CGRectMake(0, 0, 100, 100);
//    } else {
//        self.greenLayer.bounds = CGRectMake(0, 0, 200, 200);
//    }
    self.greenLayer.backgroundColor = [UIColor yellowColor].CGColor;
    
    
//    //关闭隐式动画
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
//    if (self.greenLayer.bounds.size.width >= 200) {
//        self.greenLayer.bounds = CGRectMake(0, 0, 100, 100);
//    } else {
//        self.greenLayer.bounds = CGRectMake(0, 0, 200, 200);
//    }
//    [CATransaction commit];

}


- (IBAction)rightBtnClick:(id)sender
{
    _shapeLayer.path = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:100.f startAngle:0 endAngle:M_PI clockwise:NO].CGPath;
    if (_shapeLayer.strokeEnd == 1.0) {
        _shapeLayer.strokeEnd = 0.f;
    } else {
        _shapeLayer.strokeEnd = 1.0;
    }
}


- (IBAction)doAnimation:(id)sender
{
//    [self doExplicitlyAnimation];
//    [self doKeyframeAni];
    [self doGroupAnimation];
}

//显示动画
- (void)doExplicitlyAnimation
{
    self.imgView.layer.anchorPoint = CGPointMake(0, 1);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue = [NSNumber numberWithFloat: M_PI *2];
    animation.duration = 3;
    animation.autoreverses = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.delegate = self;
    animation.repeatCount = MAXFLOAT;
    [self.imgView.layer addAnimation:animation forKey:nil];
}

- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"1");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"2");
}

//keyframe value
- (void)doKeyframeAni
{
    CALayer *rectLayer = [[CALayer alloc] init];
    rectLayer.frame = CGRectMake(15, 200, 30, 30);
    rectLayer.cornerRadius = 15;
    rectLayer.backgroundColor = [[UIColor blackColor] CGColor];
    [self.view.layer addSublayer:rectLayer];
    CAKeyframeAnimation *rectRunAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //设定关键帧位置，必须含起始与终止位置
    rectRunAnimation.values = @[[NSValue valueWithCGPoint:rectLayer.frame.origin],
                                [NSValue valueWithCGPoint:CGPointMake(320 - 15, rectLayer.frame.origin.y)],
                                [NSValue valueWithCGPoint:CGPointMake(320 - 15, rectLayer.frame.origin.y + 100)],
                                [NSValue valueWithCGPoint:CGPointMake(15, rectLayer.frame.origin.y + 100)],
                                [NSValue valueWithCGPoint:rectLayer.frame.origin]];
    //设定每个关键帧的时长，如果没有显式地设置，则默认每个帧的时间=总duration/(values.count - 1)
    rectRunAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0],
                                  [NSNumber numberWithFloat:0.6],
                                  [NSNumber numberWithFloat:0.7],
                                  [NSNumber numberWithFloat:0.8],
                                  [NSNumber numberWithFloat:1]];
    rectRunAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    rectRunAnimation.repeatCount = 2;
    rectRunAnimation.autoreverses = NO;
    rectRunAnimation.calculationMode = kCAAnimationLinear;
    rectRunAnimation.duration = 4;
    [rectLayer addAnimation:rectRunAnimation forKey:@"rectRunAnimation"];
}

- (void)doGroupAnimation
{
    //路径曲线
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:self.view.center];
    CGPoint toPoint = CGPointMake(300, 460);
    [movePath addQuadCurveToPoint:toPoint controlPoint:CGPointMake(300,0)];
    //关键帧
    CAKeyframeAnimation *moveAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnim.path = movePath.CGPath;
    moveAnim.removedOnCompletion = YES;
    
    //变形变化
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    //x，y轴缩小到0.1,Z 轴不变
    scaleAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)];
    scaleAnim.removedOnCompletion = YES;
    
    //透明度变化
    CABasicAnimation *opacityAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnim.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnim.toValue = [NSNumber numberWithFloat:0.1];
    opacityAnim.removedOnCompletion = YES;
    
    //关键帧，变形，透明度组合起来执行
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects:moveAnim, scaleAnim,opacityAnim, nil];
    animGroup.duration = 1;
    
    animGroup.fillMode = kCAFillModeForwards;
    animGroup.removedOnCompletion = NO;
    animGroup.delegate = self;
    
    [self.imgView.layer addAnimation:animGroup forKey:nil];
}


@end
