//
//  TapGestureViewController.m
//  GestureDemo
//
//  Created by huangwenchen on 15/3/2.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "TapGestureViewController.h"
@interface TapGestureViewController()
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@end

@implementation TapGestureViewController
-(void)viewWillAppear:(BOOL)animated{
    self.imageview.userInteractionEnabled = YES;
}
- (IBAction)tap:(UITapGestureRecognizer *)sender {
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    NSInteger initalPositionX = self.imageview.layer.position.x;
    animation.values = @[@(initalPositionX),
                         @(initalPositionX + 10),
                         @(initalPositionX - 10),
                         @(initalPositionX + 10),
                         @(initalPositionX)];
    animation.keyTimes = @[
                           @(0),
                           @(1/6.0),
                           @(3/6.0),
                           @(5/6.0),
                           @(1)];
    animation.removedOnCompletion = YES;
    [self.imageview.layer addAnimation:animation forKey:@"keyFrame"];
}

@end
