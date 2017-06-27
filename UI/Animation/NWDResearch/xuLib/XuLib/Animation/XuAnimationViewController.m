//
//  XuAnimationViewController.m
//  XuLib
//
//  Created by xu on 15/8/29.
//  Copyright (c) 2015年 xu. All rights reserved.
//

#import "XuAnimationViewController.h"
#import <POP.h>

@interface XuAnimationViewController ()

@end

@implementation XuAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"动画";
    
    UILabel *wLabel = [UILabel new];
    [self.view addSubview:wLabel];
    wLabel.text = @"测试pop动画";
    wLabel.frame = CGRectMake(0, 100, 100, 100);
    
//    POPSpringAnimation *anBasic = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//    anBasic.toValue = @(wLabel.center.x+200);
//    anBasic.beginTime = CACurrentMediaTime() + 1.0f;
////    anBasic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//    [wLabel.layer pop_addAnimation:anBasic forKey:@"position"];
    
    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"countdown" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
            
                UILabel *lable = (UILabel*)obj;
                lable.text = [NSString stringWithFormat:@"%02d:%02d:%02d",(int)values[0]/60,(int)values[0]%60,(int)(values[0]*100)%100];
            };
    //        prop.threshold = 0.01f;
    }];
    
    POPBasicAnimation *anBasic = [POPBasicAnimation linearAnimation];   //秒表当然必须是线性的时间函数
    anBasic.property = prop;    //自定义属性
    anBasic.fromValue = @(0);   //从0开始
    anBasic.toValue = @(3*60);  //180秒
    anBasic.duration = 3*60;    //持续3分钟
    anBasic.beginTime = CACurrentMediaTime() + 1.0f;    //延迟1秒开始
    [wLabel pop_addAnimation:anBasic forKey:@"countdown"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView
{
    self.view = [UIView new];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)testAnimation
{
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"position"];
    ani.duration = 0.5f;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
}



@end
