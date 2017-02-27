//
//  ScreenEdgePanGestureViewController.m
//  GestureDemo
//
//  Created by huangwenchen on 15/3/2.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "ScreenEdgePanGestureViewController.h"
@interface ScreenEdgePanGestureViewController()
@property (strong,nonatomic)UIView * edgeView;
@property (nonatomic)CGPoint  offsetCenter;
@end
@implementation ScreenEdgePanGestureViewController
-(void)viewDidLoad{
    UIScreenEdgePanGestureRecognizer * edge = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePan:)];
    edge.edges = UIRectEdgeRight;
    [self.view addGestureRecognizer:edge];
}
-(void)edgePan:(UIScreenEdgePanGestureRecognizer *)sender{
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.edgeView = [[UIView alloc] initWithFrame:CGRectOffset(self.view.frame,CGRectGetWidth(self.view.frame),0)];
        self.edgeView.backgroundColor = [UIColor blueColor];
        self.offsetCenter = self.edgeView.center;
        [self.view addSubview:self.edgeView];
    }else if(sender.state == UIGestureRecognizerStateChanged){
        CGPoint translation = [sender translationInView:self.view];
        self.edgeView.center = CGPointMake(self.offsetCenter.x + translation.x,self.offsetCenter.y);
    }else if(sender.state == UIGestureRecognizerStateEnded)
    {
        if ([sender velocityInView:self.view].x < 0) {
            [UIView animateWithDuration:0.3 animations:^{
                self.edgeView.center = self.view.center;
            }];
        }else{
            [UIView animateWithDuration:0.3
                                  delay:0.0
                                options:UIViewAnimationOptionBeginFromCurrentState
                             animations:^{
                                 self.edgeView.center = self.offsetCenter;
                             }
                             completion:^(BOOL finished) {
                                 [self.edgeView removeFromSuperview];
                                 self.edgeView = nil;
                             }];
        }
    }else{
        [UIView animateWithDuration:0.3
                              delay:0.0
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.edgeView.center = self.offsetCenter;
                         }
                         completion:^(BOOL finished) {
                             [self.edgeView removeFromSuperview];
                             self.edgeView = nil;
                         }];
    }
}
@end
