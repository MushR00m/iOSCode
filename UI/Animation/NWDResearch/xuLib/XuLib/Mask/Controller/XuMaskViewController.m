//
//  XuMaskViewController.m
//  XuLib
//
//  Created by xuwenyuan on 2017/5/27.
//  Copyright © 2017年 xu. All rights reserved.
//

#import "XuMaskViewController.h"

@interface XuMaskViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UIImageView *colorImgView;
@property (nonatomic, strong) CALayer *maskLayer;
@property (strong, nonatomic) CAShapeLayer *maskLayerUp;
@property (strong, nonatomic) CAShapeLayer *maskLayerDown;

@property (nonatomic, strong) CABasicAnimation *forwardAni;
@property (nonatomic, strong) CABasicAnimation *backwardAni;

@end

@implementation XuMaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.imgView setImage:[UIImage imageNamed:@"black"]];
    [self.colorImgView setImage:[UIImage imageNamed:@"colorful"]];
    
    [self initMask];
}

- (void)initMask
{
    self.maskLayer = [CALayer layer];
    self.maskLayer.frame = self.colorImgView.bounds;
    self.colorImgView.layer.mask = self.maskLayer;
    
    CGSize s = self.colorImgView.frame.size;
    CGFloat l = MAX(s.width, s.height);
    
    self.maskLayerUp = [CAShapeLayer layer];
    self.maskLayerUp.bounds = CGRectMake(0, 0, l, l);
    self.maskLayerUp.fillColor = [UIColor blackColor].CGColor; // Any color but clear will be OK
    UIBezierPath *p1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 0)
                                                           radius:l
                                                       startAngle:0
                                                         endAngle:M_PI/2
                                                        clockwise:YES];
    [p1 addLineToPoint:CGPointMake(0, 0)];
    [p1 closePath];
    self.maskLayerUp.path = p1.CGPath;
    self.maskLayerUp.opacity = 1.f;
    self.maskLayerUp.anchorPoint = CGPointMake(1, 1);
    self.maskLayerUp.position = CGPointZero;
    [self.maskLayer addSublayer:self.maskLayerUp];
    
    
    self.maskLayerDown = [CAShapeLayer layer];
    self.maskLayerDown.bounds = CGRectMake(0, 0, l, l);
    self.maskLayerDown.fillColor = [UIColor whiteColor].CGColor; // Any color but clear will be OK
    UIBezierPath *p2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(l, l)
                                                             radius:l
                                                         startAngle:M_PI
                                                           endAngle:3.f/2*M_PI
                                                          clockwise:YES];
    [p2 addLineToPoint:CGPointMake(l, l)];
    [p2 closePath];
    self.maskLayerDown.path = p2.CGPath;
    self.maskLayerDown.anchorPoint = CGPointMake(0, 0);
    self.maskLayerDown.position = CGPointMake(s.width, s.height);
    [self.maskLayer addSublayer:self.maskLayerDown];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)leftBtnClick:(id)sender
{
    CGSize s = self.colorImgView.frame.size;
    
    CABasicAnimation *downAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    downAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    downAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(s.width, s.height)];
    downAnimation.duration = 2.f;
    downAnimation.fillMode = kCAFillModeForwards;
    downAnimation.removedOnCompletion = NO;
    [self.maskLayerUp addAnimation:downAnimation forKey:@"downAnimation"];
    
    CABasicAnimation *upAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    upAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(s.width, s.height)];
    upAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    upAnimation.duration = 2.f;
    upAnimation.fillMode = kCAFillModeForwards;
    upAnimation.removedOnCompletion = NO;
    [self.maskLayerDown addAnimation:upAnimation forKey:@"upAnimation"];
    
    self.forwardAni = downAnimation;
}

- (IBAction)righBtnClick:(id)sender
{
    CGSize s = self.colorImgView.frame.size;
    
    CABasicAnimation *downAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    downAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    downAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(s.width, s.height)];
    downAnimation.duration = 2.f;
    downAnimation.fillMode = kCAFillModeForwards;
    downAnimation.removedOnCompletion = NO;
    [self.maskLayerUp addAnimation:downAnimation forKey:@"downAnimation"];
    
    CABasicAnimation *upAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    upAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(s.width, s.height)];
    upAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    upAnimation.duration = 2.f;
    upAnimation.fillMode = kCAFillModeForwards;
    upAnimation.removedOnCompletion = NO;
    [self.maskLayerDown addAnimation:upAnimation forKey:@"upAnimation"];
}



@end
