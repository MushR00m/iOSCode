//
//  PinchGestureViewController.m
//  GestureDemo
//
//  Created by huangwenchen on 15/3/2.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "PinchGestureViewController.h"
@interface PinchGestureViewController()

@property (strong, nonatomic) UIImageView *imageview;
@property (nonatomic) BOOL isLargeView;
@property (strong,nonatomic) UIView * backgroundView;
@property (nonatomic) CGRect oldFrame;
@end

@implementation PinchGestureViewController
-(void)viewWillAppear:(BOOL)animated{
    CGRect imageFrame;
    if ([[UIDevice currentDevice].model isEqualToString:@"ipad"]) {
        imageFrame = CGRectMake(0,0,300,200);
    }else
    {
        imageFrame = CGRectMake(0,0,240,160);
    }
    self.imageview = [[UIImageView alloc] initWithFrame:imageFrame];
    self.imageview.image = [UIImage imageNamed:@"Image3.jpg"];
    self.imageview.center = self.view.center;
    [self.view addSubview:self.imageview];
    [self.imageview setUserInteractionEnabled:YES];
    UIPinchGestureRecognizer * pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [self.imageview addGestureRecognizer:pinch];
    self.isLargeView = NO;
    self.oldFrame = self.imageview.frame;
}

-(void)pinch:(UIPinchGestureRecognizer *)pinch{
    if (pinch.state == UIGestureRecognizerStateRecognized) {
        if (!self.isLargeView && pinch.velocity > 0) {
            self.backgroundView = [[UIView alloc] initWithFrame:self.view.frame];
            self.backgroundView.backgroundColor = [UIColor blackColor];
            self.backgroundView.alpha = 0.0;
            self.imageview.backgroundColor = [UIColor blueColor];
            [self.view insertSubview:self.backgroundView belowSubview:self.imageview];
            [UIView animateWithDuration:0.8
                                  delay:0.0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 self.backgroundView.alpha = 1.0;
                                 if ([[UIDevice currentDevice].model isEqualToString:@"ipad"]) {
                                     self.imageview.frame = CGRectMake(0,300,768,512);
                                 }else
                                 {
                                     self.imageview.frame = CGRectMake(0,220,320,210);
                                 }
                             }
                             completion:^(BOOL finished) {
                                 self.isLargeView = YES;
                                 
                             }];
        }
        if (self.isLargeView &&  pinch.velocity < 0) {
            [UIView animateWithDuration:0.8
                             animations:^{
                                 self.backgroundView.alpha = 0.0;
                                 self.imageview.frame = self.oldFrame;
                                 
                             }
                             completion:^(BOOL finished) {
                                 [self.backgroundView removeFromSuperview];
                                 self.backgroundView = nil;
                                 self.isLargeView = NO;
                             }];
        }
    }
}
@end
