//
//  XuBase2ViewController.m
//  XuLib
//
//  Created by xuwenyuan on 2017/5/26.
//  Copyright © 2017年 xu. All rights reserved.
//

#import "XuBase2ViewController.h"

@interface XuBase2ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UIButton *btn2;

@end

@implementation XuBase2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.imgView setImage:[UIImage imageNamed:@"fat_cat"]];
    
    self.btn2.layer.cornerRadius = self.btn2.frame.size.width / 2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//transform
- (IBAction)doAnimation1:(id)sender
{
    [UIView animateWithDuration:1.f animations:^{
        
        self.imgView.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(M_PI / 2), CGAffineTransformMakeScale(2.0, 0.5f));
    }];
}

- (IBAction)undoAniomation1:(id)sender
{
    [UIView animateWithDuration:1.f animations:^{
        
        self.imgView.transform = CGAffineTransformIdentity;
    }];
}

//spring
- (IBAction)doAnimation2:(id)sender
{
    self.btn2.transform = CGAffineTransformMakeScale(0.7, 0.7);
    
    // 弹簧动画，参数分别为：时长，延时，弹性（越小弹性越大），初始速度
    [UIView animateWithDuration: 0.7 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0.3 options:0 animations:^{
        
        self.btn2.transform = CGAffineTransformMakeScale(1, 1);
    } completion:nil];
}

//keyframe
- (IBAction)doAnimation3:(id)sender
{
    CGPoint p = self.view.center;
    self.imgView.center = p;
    [UIView animateKeyframesWithDuration:3.f delay:0.f options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.2 animations:^{
            self.imgView.center = CGPointMake(p.x + 100, p.y);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.2 relativeDuration:0.2 animations:^{
            self.imgView.center = CGPointMake(p.x + 100, p.y+100);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.4 relativeDuration:0.2 animations:^{
            self.imgView.center = CGPointMake(p.x - 100, p.y+100);
        }];
//        [UIView addKeyframeWithRelativeStartTime:0.6 relativeDuration:0.2 animations:^{
//            self.imgView.center = CGPointMake(p.x - 100, p.y);
//        }];
//        [UIView addKeyframeWithRelativeStartTime:0.8 relativeDuration:0.2 animations:^{
//            self.imgView.center = p;
//        }];
    } completion:^(BOOL finished) {
        
    }];

}


- (void)showMaskView
{
    self.imgView.maskView = [UIView new];
    self.imgView.maskView.frame = self.imgView.bounds;
    //    self.imgView.maskView.backgroundColor = [UIColor blackColor];
    UIView *aa = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 20, 20)];
    aa.backgroundColor = [UIColor blackColor];
    [self.imgView.maskView addSubview:aa];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:2.f animations:^{
            aa.frame = CGRectMake(60, 60, 20, 20);
        }];
    });
}


@end
