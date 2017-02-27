//
//  LongPressGestureViewController.m
//  GestureDemo
//
//  Created by huangwenchen on 15/3/2.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "LongPressGestureViewController.h"

@interface LongPressGestureViewController()<UIAlertViewDelegate,UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@end
@implementation LongPressGestureViewController
-(void)viewDidLoad{
    self.imageview.userInteractionEnabled = YES;
    UILongPressGestureRecognizer * longpress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longpress:)];
    longpress.minimumPressDuration = 0.5;
    longpress.numberOfTapsRequired = 0;
    longpress.cancelsTouchesInView = YES;
    longpress.delegate = self;
    [self.imageview addGestureRecognizer:longpress];
}
-(void)longpress:(UILongPressGestureRecognizer *)sender{
    if (sender.state == UIGestureRecognizerStateBegan){
        UIAlertView * alertview = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                             message:@"Delete this image?"
                                                            delegate:self
                                                   cancelButtonTitle:@"Cancel"
                                                   otherButtonTitles:@"OK", nil];
        [alertview show];
        [sender cancelsTouchesInView];
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [UIView animateWithDuration:1.0
                              delay:0.0
                            options:0
                         animations:^{
                             self.imageview.alpha = 0.0;
                         } completion:^(BOOL finished) {
                             [self.imageview removeFromSuperview];
                         }];
    }
    self.imageview.userInteractionEnabled = YES;
}
@end
