//
//  ViewController.m
//  滑动解锁动画
//
//  Created by chensongqi on 17/3/10.
//  Copyright © 2017年 chensongqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    // 渐变Layer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [self.view.layer addSublayer:gradientLayer];
    CGRect vframe = CGRectMake(0, 200, self.view.frame.size.width, 64);
    gradientLayer.frame = vframe;
    gradientLayer.colors = @[
                             (__bridge id)[UIColor blackColor].CGColor,
                             (__bridge id)[UIColor whiteColor].CGColor,
                             (__bridge id)[UIColor blackColor].CGColor,];
    gradientLayer.locations = @[@0.25,@0.5,@0.75];
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    // 添加部分
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    basicAnimation.fromValue = @[@0, @0, @0.25];
    basicAnimation.toValue = @[@0.75, @1, @1];
    basicAnimation.duration = 2.5;
//    basicAnimation.repeatCount = HUGE;
//    basicAnimation.repeatCount = 2;
    basicAnimation.repeatDuration = 5;
    basicAnimation.speed = 2;
    [gradientLayer addAnimation:basicAnimation forKey:nil];
    
    // 第二次添加部分
    UILabel *unlock = [[UILabel alloc] initWithFrame:vframe];
    // 必需要强引用保存unlock，此句也可以用[self.view addSubview:unlock]来替代;
    unlock.alpha = 0.5;
    unlock.text = @"滑动来解锁 >>";
    unlock.textAlignment = NSTextAlignmentCenter;
    unlock.font = [UIFont boldSystemFontOfSize:30];
    gradientLayer.mask = unlock.layer;
    unlock.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:unlock];
    
    [self test2];

}

- (void)test2
{
    // 渐变Layer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [self.view.layer addSublayer:gradientLayer];
    CGRect vframe = CGRectMake(0, 300, self.view.frame.size.width, 64);
    gradientLayer.frame = vframe;
    gradientLayer.colors = @[
                             (__bridge id)[UIColor blackColor].CGColor,
                             (__bridge id)[UIColor whiteColor].CGColor,
                             (__bridge id)[UIColor blackColor].CGColor,];
    gradientLayer.locations = @[@0.25,@0.5,@0.75];
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    // 添加部分
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    basicAnimation.fromValue = @[@0, @0, @0.25];
    basicAnimation.toValue = @[@0.75, @1, @1];
    basicAnimation.duration = 2.5;
    //    basicAnimation.repeatCount = HUGE;
    //    basicAnimation.repeatCount = 2;
    basicAnimation.repeatDuration = 5;
    [gradientLayer addAnimation:basicAnimation forKey:nil];
    
    // 第二次添加部分
    UILabel *unlock = [[UILabel alloc] initWithFrame:vframe];
    // 必需要强引用保存unlock，此句也可以用[self.view addSubview:unlock]来替代;
    unlock.alpha = 0.5;
    unlock.text = @"滑动来解锁 >>";
    unlock.textAlignment = NSTextAlignmentCenter;
    unlock.font = [UIFont boldSystemFontOfSize:30];
    gradientLayer.mask = unlock.layer;
    unlock.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:unlock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
