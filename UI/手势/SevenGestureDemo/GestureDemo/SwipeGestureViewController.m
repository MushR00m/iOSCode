//
//  SwipeGestureViewController.m
//  GestureDemo
//
//  Created by huangwenchen on 15/3/2.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "SwipeGestureViewController.h"

@interface SwipeGestureViewController()
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIView *containview;
@end

@implementation SwipeGestureViewController
-(void)viewDidLoad{
    UISwipeGestureRecognizer * swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipe.numberOfTouchesRequired = 2;
    [swipe setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.containview addGestureRecognizer:swipe];
    self.image2.userInteractionEnabled = YES;
    self.image2.hidden = YES;
    self.image3.userInteractionEnabled = YES;
    self.image3.hidden = NO;
}
-(void)swipe:(UISwipeGestureRecognizer *)sender{
    
    if (sender.state == UIGestureRecognizerStateRecognized) {
        [UIView transitionWithView:self.containview
                          duration:0.8
                           options:UIViewAnimationOptionTransitionCurlUp
                        animations:^{
                            self.image3.hidden = !self.image3.hidden;
                            self.image2.hidden = !self.image2.hidden;
                        } completion:^(BOOL finished) {
                            
                        }];
    }
    
}
@end
