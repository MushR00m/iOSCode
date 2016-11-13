//
//  ViewController3.m
//  获取系统开机时间
//
//  Created by chensongqi on 16/7/15.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@property (weak, nonatomic) IBOutlet UILabel *brightnessLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *vProgress;

@end

@implementation ViewController3

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self  name:UIScreenBrightnessDidChangeNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat brightness = [UIScreen mainScreen].brightness;//0 .. 1.0, where 1.0 is maximum
    self.brightnessLabel.text = [NSString stringWithFormat:@"%f",brightness];
    self.vProgress.progress = brightness;
    NSLog(@"---- brightness : %f",brightness);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(brightnessChange:) name:UIScreenBrightnessDidChangeNotification object:nil];

}

- (void)brightnessChange:(NSNotification *)notification
{
    CGFloat brightness = [UIScreen mainScreen].brightness;
    self.brightnessLabel.text = [NSString stringWithFormat:@"%f",brightness];
    self.vProgress.progress = brightness;

    NSLog(@"---- brightness chage : %f",brightness);
    NSLog(@"--- notification %@",notification);
}


@end
