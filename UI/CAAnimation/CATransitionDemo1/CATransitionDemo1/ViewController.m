//
//  ViewController.m
//  CATransitionDemo1
//
//  Created by chensongqi on 16/11/9.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *testImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CATransition *animation = [CATransition animation];
    animation.duration = 3.0f;
    animation.fillMode = kCAFillModeForwards;
    animation.type = @"rippleEffect";
    animation.subtype = kCATransitionFromTop;
    [self.testImageView.layer addAnimation:animation forKey:@"ripple"];
    
    //能用的情况有，imageView切换图片，控制器的push或modal，UIView对象调用exchangeSubviewAtIndex：WithIndex：方法
    
    //还有一些系统私有的动画但是可以安全使用,但是你只能用字符串
    //@"cube" @"moveIn" @"reveal" @"fade"(default) @"pageCurl" @"pageUnCurl" @"suckEffect" @"rippleEffect" @"oglFlip"
    

}

@end
