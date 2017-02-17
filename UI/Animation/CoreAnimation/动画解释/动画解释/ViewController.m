//
//  ViewController.m
//  动画解释
//
//  Created by chen songqi on 15/7/23.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *testView;

@property (nonatomic, strong) UIView *testView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(btnClick6:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(120, 500, 100, 40);
    [btn setTitle:@"开始" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];



    self.testView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    self.testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.testView];


    self.testView2 = [[UIView alloc] initWithFrame:CGRectMake(20, 150, 10, 10)];
    _testView2.layer.cornerRadius = 5;
    self.testView2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.testView2];
}

- (void)btnClick1:(UIButton *)sender
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @70;
    animation.toValue = @200;
    animation.duration = 1;
    [self.testView.layer addAnimation:animation forKey:@"basic"];
    //当把动画添加到一个 layer 时，是不直接修改它的属性的
    //https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreAnimation_guide/Key-ValueCodingExtensions/Key-ValueCodingExtensions.html


    self.testView.layer.contentsScale

    //当我们运行该代码时，我们意识到火箭在完成动画后马上回到了初始位置. 这是因为在默认情况下，动画不会在超出其持续时间后还修改 presentation layer。实际上，在结束时它甚至会被彻底移除。

}

- (void)btnClick2:(UIButton *)sender
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @70;
    animation.toValue = @200;
    animation.duration = 1;

    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;


    [self.testView.layer addAnimation:animation forKey:@"basic"];
    self.testView.layer.position = CGPointMake(200, 70);
}

- (void)btnClick3:(UIButton *)sender
{

    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.byValue = @100;
    animation.duration = 1;

//    [self.testView.layer addAnimation:animation forKey:@"basic"];
//    self.testView.layer.position = CGPointMake(140, 70);

    animation.beginTime = CACurrentMediaTime() + 0.5;

    [self.testView2.layer addAnimation:animation forKey:@"basic"];
//    self.testView2.layer.position = CGPointMake(200, 200);


    //设置动画的 beginTime 为未来 0.5 秒将只会影响 testView2，因为动画在执行语句 [testView.layer addAnimation:animation forKey:@"basic"]; 时已经被复制了，并且之后 rocket1 也不会考虑对动画对象的改变。
}

- (void)btnClick4:(UIButton *)sender
{

    //想要为你的动画定义超过两个步骤，可以使用更通用的 CAKeyframeAnimation，
    //关键帧（keyframe）使我们能够定义动画中任意的一个点，然后让 Core Animation 填充所谓的中间帧。

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[@0,@20,@-20,@20,@0];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    animation.additive = YES;
      //设置 additive 属性为 YES 使 Core Animation 在更新 presentation layer 之前将动画的值添加到 model layer 中去。这使我们能够对所有形式的需要更新的元素重用相同的动画，且无需提前知道它们的位置。因为这个属性从 CAPropertyAnimation 继承，所以你也可以在使用 CABasicAnimation 时使用它。

    [self.testView.layer addAnimation:animation forKey:@"shake"];


}


- (void)btnClick5:(UIButton *)sender
{


    CGRect boundingRect = CGRectMake(-150, -150, 300, 300);
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect,NULL));
    //一个 CGPathRef  对象，默认是空的，当我们创建好CAKeyframeAnimation的实例的时候，可以通过制定一个自己定义的path来让  某一个物体按照这个路径进行动画。这个值默认是nil  当其被设定的时候  values  这个属性就被覆盖
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VAL;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;
    [self.testView2.layer addAnimation:orbit forKey:@"orbit"];

    /*

     使用 CGPathCreateWithEllipseInRect()，我们创建一个圆形的 CGPath 作为我们的关键帧动画的 path。

     使用 calculationMode 是控制关键帧动画时间的另一种方法。我们通过将其设置为 kCAAnimationPaced，让 Core Animation 向被驱动的对象施加一个恒定速度，不管路径的各个线段有多长。将其设置为 kCAAnimationPaced 将无视所有我们已经设置的 keyTimes。

     设置 rotationMode 属性为 kCAAnimationRotateAuto 确保飞船沿着路径旋转。作为对比，如果我们将该属性设置为 nil 那动画会是什么样的呢。

     */

}

- (void)btnClick6:(UIButton *)sender
{

    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @70;
    animation.toValue = @200;
    animation.duration = 1;

    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;

    [self.testView.layer addAnimation:animation forKey:@"basic"];
//
//    CABasicAnimation *animation2 = [CABasicAnimation animation];
//    animation2.keyPath = @"position.x";
//    animation2.fromValue = @20;
//    animation2.toValue = @100;
//    animation2.duration = 1;
//
//    animation2.fillMode = kCAFillModeForwards;
//    animation2.removedOnCompletion = NO;
//
//
//    [self.testView.layer addAnimation:animation2 forKey:@"basic"];
//    self.testView.layer.position = CGPointMake(200, 70);

}


@end
