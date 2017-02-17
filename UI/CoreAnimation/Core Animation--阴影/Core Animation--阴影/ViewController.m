//
//  ViewController.m
//  Core Animation--阴影
//
//  Created by 好样的 on 15/8/15.
//  Copyright (c) 2015年 好样的. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (nonatomic, strong) UIView *shadowView;
@end

@implementation ViewController


//使用CALayer的另外三个属性：shadowColor，shadowOffset和shadowRadius


/**
 shadowColor属性控制着阴影的颜色，和borderColor和backgroundColor一样，它的类型也是CGColorRef。阴影默认是黑色，
 
 shadowOffset属性控制着阴影的方向和距离。它是一个CGSize的值，宽度控制这阴影横向的位移，高度控制着纵向的位移。shadowOffset的默认值是 {0, -3}，意即阴影相对于Y轴有3个点的向上位移。
 
 shadowRadius属性控制着阴影的模糊度，当它的值是0的时候，阴影就和视图一样有一个非常确定的边界线。当值越来越大的时候，边界线看上去就会越来越模糊和自然。苹果自家的应用设计更偏向于自然的阴影，所以一个非零值再合适不过了。
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    _shadowView.backgroundColor = [UIColor whiteColor];
    _shadowView.center = self.view.center;
    [self.view addSubview:_shadowView];
    
    
    self.view.backgroundColor = [UIColor grayColor];
    
    
    [self showShadow2];
    
    
    
    
}

- (void)showShadow1
{
    
    _shadowView.layer.shadowOpacity = 0.9;
    _shadowView.layer.shadowColor = [UIColor redColor].CGColor;
    _shadowView.layer.shadowOffset = CGSizeMake(5, 10);
    
    
}

/*
 和图层边框不同，图层的阴影继承自内容的外形，而不是根据边界和角半径来确定。为了计算出阴影的形状，Core Animation会将寄宿图（包括子视图，如果有的话）考虑在内，然后通过这些来完美搭配图层形状从而创建一个阴影
 
 阴影是根据寄宿图的轮廓来确定的
 
 shadowPath是一个CGPathRef类型（一个指向CGPath的指针）。CGPath是一个Core Graphics对象，用来指定任意的一个矢量图形。我们可以通过这个属性单独于图层形状之外指定阴影的形状。
 */


- (void)showShadow2
{
    _shadowView.layer.shadowOpacity = 0.9;

    _shadowView.layer.shadowColor = [UIColor redColor].CGColor;
    
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, CGRectMake(-15, -15, 180, 180));
    _shadowView.layer.shadowPath = circlePath;
    CGPathRelease(circlePath);
    
    
}
@end
