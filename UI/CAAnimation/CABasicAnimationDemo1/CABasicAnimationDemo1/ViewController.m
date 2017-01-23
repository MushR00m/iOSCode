//
//  ViewController.m
//  CABasicAnimationDemo1
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
    
    self.testView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    
    self.testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.testView];
    NSLog(@"self.testView.layer 1  = %@",NSStringFromCGRect(self.testView.layer.frame));

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self transformAnimationTest];
}

- (void)test1 {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.removedOnCompletion = NO;
    //要想fillMode有效，最好设置removedOnCompletion = NO
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 5;
    //    animation.speed = 5;
    animation.beginTime = CACurrentMediaTime() + 1;
    //    animation.repeatCount = MAXFLOAT;
    
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    [self.testView.layer addAnimation:animation forKey:nil];
    //因为当你调用addAnimation：forKey：这句时，其实系统是对你传入的animation进行了一次copy，然后把copy的这份添加在图层上。这时你再改animation当然是不能更改动画效果的了。
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"self.testView.layer 2  = %@",NSStringFromCGRect(self.testView.layer.frame));
        [self test2];
    });

}

- (void)test2
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 3;
    animation.beginTime = CACurrentMediaTime() + 1;
    
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    [self.testView.layer addAnimation:animation forKey:nil];

}

//旋转动画
- (void)rotationAnimationTest {
    // 对Y轴进行旋转（指定Z轴的话，就和UIView的动画一样绕中心旋转）
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    
    // 设定动画选项
    animation.duration = 1; // 持续时间

    // 设定旋转角度
    animation.fromValue = [NSNumber numberWithFloat:0.0]; // 起始角度
    animation.toValue = [NSNumber numberWithFloat:M_PI]; // 终止角度
    
    // 添加动画
    [self.testView.layer addAnimation:animation forKey:@"rotate-layer"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scaleAnimationTest {
    /* 放大缩小 */
    
    // 设定为缩放
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    // 动画选项设定
    animation.duration = 2.5; // 动画持续时间
    animation.repeatCount = 1; // 重复次数
    animation.autoreverses = YES; // 动画结束时执行逆动画
    
    // 缩放倍数
    animation.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
    animation.toValue = [NSNumber numberWithFloat:2.0]; // 结束时的倍率
    
    // 添加动画
    [self.testView.layer addAnimation:animation forKey:@"scale-layer"];
}

- (void)transformAnimationTest {
    /* 移动 */
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    // 动画选项的设定
    animation.duration = 2.5; // 持续时间
    animation.repeatCount = 1; // 重复次数
    
    // 起始帧和终了帧的设定
    animation.fromValue = [NSValue valueWithCGPoint:self.testView.layer.position]; // 起始帧
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(375, 667)]; // 终了帧
    
    // 添加动画
    [self.testView.layer addAnimation:animation forKey:@"move-layer"];
}

@end
