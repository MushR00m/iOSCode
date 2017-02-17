//
//  ViewController.m
//  FoldAnimationDemo
//
//  Created by chensongqi on 17/1/23.
//  Copyright © 2017年 chensongqi. All rights reserved.
//

#import "ViewController.h"
#define IMAGE_PER_HEIGIT 50.0

@interface ViewController ()

@property (nonatomic, strong) UIImageView *testImageView;
@property (nonatomic, strong) UIImageView *one;
@property (nonatomic, strong) UIImageView *two;
@property (nonatomic, strong) UIImageView *three;
@property (nonatomic, strong) UIImageView *four;


@property (nonatomic, strong) UIView *oneShadowView;
@property (nonatomic, strong) UIView *threeShadowView;


@property (nonatomic, strong) UIPanGestureRecognizer *vGesture;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 300, IMAGE_PER_HEIGIT*4)];
    [self.view addSubview:bgView];
    
    // 把kiluya这张图，分成平均分成4个部分的imageview
    _one = [[UIImageView alloc] init];
    _one.image = [UIImage imageNamed:@"Kiluya.jpg"];
    _one.layer.contentsRect = CGRectMake(0, 0, 1, 0.25);
    _one.layer.anchorPoint = CGPointMake(0.5, 0.0);
    _one.frame = CGRectMake(0, 0, 300, IMAGE_PER_HEIGIT);
    
    _two = [[UIImageView alloc] init];
    _two.image = [UIImage imageNamed:@"Kiluya.jpg"];
    _two.layer.contentsRect = CGRectMake(0, 0.25, 1, 0.25);
    _two.layer.anchorPoint = CGPointMake(0.5, 1.0);
    _two.frame = CGRectMake(0, IMAGE_PER_HEIGIT, 300, IMAGE_PER_HEIGIT);
    
    _three = [[UIImageView alloc] init];
    _three.image = [UIImage imageNamed:@"Kiluya.jpg"];
    _three.layer.contentsRect = CGRectMake(0, 0.5, 1, 0.25);
    _three.layer.anchorPoint = CGPointMake(0.5, 0.0);
    _three.frame = CGRectMake(0, IMAGE_PER_HEIGIT*2, 300, IMAGE_PER_HEIGIT);
    
    _four = [[UIImageView alloc] init];
    _four.image = [UIImage imageNamed:@"Kiluya.jpg"];
    _four.layer.contentsRect = CGRectMake(0, 0.75, 1, 0.25);
    _four.layer.anchorPoint = CGPointMake(0.5, 1.0);
    _four.frame = CGRectMake(0, IMAGE_PER_HEIGIT*3, 300, IMAGE_PER_HEIGIT);
    
    [bgView addSubview:_one];
    [bgView addSubview:_two];
    [bgView addSubview:_three];
    [bgView addSubview:_four];
    
    // 给第一张和第三张添加阴影
    _oneShadowView = [[UIView alloc] initWithFrame:_one.bounds];
    _oneShadowView.backgroundColor = [UIColor blackColor];
    _oneShadowView.alpha = 0.0;
    
    _threeShadowView = [[UIView alloc] initWithFrame:_three.bounds];
    _threeShadowView.backgroundColor = [UIColor blackColor];
    _threeShadowView.alpha = 0.0;
    
    [_one addSubview:_oneShadowView];
    [_three addSubview:_threeShadowView];
    
    self.vGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.view addGestureRecognizer:self.vGesture];
}


- (void)panAction:(UIPanGestureRecognizer *)panGestureRecognizer
{
    _oneShadowView.alpha = 0.2;
    _threeShadowView.alpha = 0.2;

    CGPoint point = [panGestureRecognizer translationInView:self.view];
    NSLog(@"point = %@",NSStringFromCGPoint(point));
    if (point.y > 0) {
        //向下
        CGFloat angle = point.y;
//        if (angle > 90) {
//            return;
//        }
        _one.layer.transform = [self config3DTransformWithRotateAngle:-angle
                                                         andPositionY:0];
        _two.layer.transform = [self config3DTransformWithRotateAngle:angle
                                                         andPositionY:-100+2*_one.frame.size.height];
        _three.layer.transform = [self config3DTransformWithRotateAngle:-angle
                                                           andPositionY:-100+2*_one.frame.size.height];
        _four.layer.transform = [self config3DTransformWithRotateAngle:angle
                                                          andPositionY:-200+4*_one.frame.size.height];

    } else {
        //向上
    }

}



- (CATransform3D)config3DTransformWithRotateAngle:(double)angle andPositionY:(double)y
{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1/1000.0;
    CATransform3D rotateTransform = CATransform3DRotate(transform, M_PI*angle/180, 1, 0, 0);
    CATransform3D moveTransform = CATransform3DMakeTranslation(0, y, 0);
    CATransform3D concatTransform = CATransform3DConcat(rotateTransform, moveTransform);
    return concatTransform;
}



@end
