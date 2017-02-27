//
//  PanGestureViewController.m
//  GestureDemo
//
//  Created by huangwenchen on 15/3/2.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "PanGestureViewController.h"

@interface  PanGestureViewController()
@property (strong, nonatomic)  UIImageView *imageview;
@property (nonatomic)CGPoint initalCenter;

@end

@implementation PanGestureViewController
-(void)viewDidLoad{
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
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    self.imageview.userInteractionEnabled = YES;
    [self.imageview addGestureRecognizer:pan];
    self.initalCenter = self.imageview.center;
}
-(void)pan:(UIPanGestureRecognizer *)sender{
    if (sender.state == UIGestureRecognizerStateBegan) {
       
    }else if(sender.state == UIGestureRecognizerStateChanged){
        CGPoint translation = [sender translationInView:self.view];
        self.imageview.center = CGPointMake(self.initalCenter.x + translation.x,self.initalCenter.y + translation.y);
    }else{
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut animations:^{
                                self.imageview.center = self.initalCenter;
                            } completion:^(BOOL finished) {
                            
                        }];
    }
}
@end
