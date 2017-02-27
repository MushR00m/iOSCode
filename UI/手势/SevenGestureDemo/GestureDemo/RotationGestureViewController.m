//
//  RotationGestureViewController.m
//  GestureDemo
//
//  Created by huangwenchen on 15/3/2.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "RotationGestureViewController.h"

@interface RotationGestureViewController()
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@end

@implementation RotationGestureViewController
-(void)viewDidLoad{
    self.imageview.userInteractionEnabled = YES;
    UIRotationGestureRecognizer * rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
    [self.imageview addGestureRecognizer:rotate];
}
-(void)rotate:(UIRotationGestureRecognizer *)sender{
    if (sender.state == UIGestureRecognizerStateChanged) {
        self.imageview.transform = CGAffineTransformMakeRotation(sender.rotation);
    }
}
@end

