//
//  XuThreeBallView.m
//  XuLib
//
//  Created by xuwenyuan on 2017/3/29.
//  Copyright © 2017年 xu. All rights reserved.
//

#import "XuThreeBallView.h"

#define kBallCenterDistance (50.f)
#define kBallRaidus (10.f)

@interface XuThreeBallView()

@property (nonatomic, strong) UIView *ball;

@end

@implementation XuThreeBallView


- (instancetype)init
{
    self = [super init];
    self.backgroundColor = [UIColor whiteColor];
    
    self.ball = [UIView new];
    [self addSubview:self.ball];
    self.ball.layer.cornerRadius = kBallRaidus;
    self.ball.center = CGPointMake(self.bounds.size.width/2 - kBallCenterDistance, self.bounds.size.height/2);
    self.ball.bounds = CGRectMake(0, 0, kBallRaidus * 2, kBallRaidus * 2);
    self.ball.backgroundColor = [UIColor greenColor];
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    
    
    UIBezierPath *path1To2 = [[UIBezierPath alloc] init];
    
    [path1To2 addArcWithCenter:CGPointMake(self.bounds.size.width/2 - kBallCenterDistance/2, self.bounds.size.height/2) radius:kBallCenterDistance/2 startAngle:-M_PI endAngle:0 clockwise:YES];
    
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    ani.path = path1To2.CGPath;
    ani.duration = 2.f;
    //ani.repeatCount = FLT_MAX;
    ani.removedOnCompletion = NO;
    
    [self.ball.layer addAnimation:ani forKey:@"ball1To2"];
    
}

@end
