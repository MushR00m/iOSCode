//
//  ViewController.m
//  截屏功能
//
//  Created by 好样的 on 15/6/7.
//  Copyright (c) 2015年 好样的. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@property (nonatomic, strong) UIButton *testBtn;

@property (nonatomic ,strong) UIImageView *testIV;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.testBtn setTitle:@"开始截屏" forState:UIControlStateNormal];
    [self.testBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.testBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.testBtn.frame = CGRectMake(0, 0, 100, 30);
    [self.view addSubview:self.testBtn];
    
    
    self.testIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 300)];
    self.testIV.contentMode = UIViewContentModeScaleAspectFit;
    self.testIV.layer.borderColor = [UIColor redColor].CGColor;
    self.testIV.layer.borderWidth = 1;
    
    [self.view addSubview:self.testIV];
    
    
    
    
    
}

- (void)buttonClick:(id)sender
{
    
    UIImage *image= [self captureImageFromView:self.view];
    NSLog(@"--- %@",image);
    self.testIV.image = image;
}  


- (UIImage *)captureImageFromView:(UIView *)view
{

    CGRect screenRect = [view bounds];
    UIGraphicsBeginImageContext(screenRect.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];
    UIImage *im = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return im;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
