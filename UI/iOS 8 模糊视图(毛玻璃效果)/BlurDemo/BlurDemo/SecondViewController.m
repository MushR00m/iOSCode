//
//  SecondViewController.m
//  BlurDemo
//
//  Created by huangwenchen on 15/5/8.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Add blur effect
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *bluredEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    [bluredEffectView setFrame:CGRectMake(30,self.imageview.bounds.size.height - 50,self.imageview.bounds.size.width - 60, 40)];
    bluredEffectView.layer.cornerRadius = 15;
    bluredEffectView.layer.masksToBounds = YES;

    bluredEffectView.layer.borderWidth = 2;
    bluredEffectView.layer.borderColor = [UIColor greenColor].CGColor;

    [self.imageview addSubview:bluredEffectView];
    
    UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
    UIVisualEffectView *vibrancyEffectView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
    [vibrancyEffectView setFrame:self.imageview.bounds];

    vibrancyEffectView.layer.borderColor = [UIColor redColor].CGColor;
    vibrancyEffectView.layer.borderWidth = 1;

    [bluredEffectView.contentView addSubview:vibrancyEffectView];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,self.imageview.bounds.size.width - 60, 40)];
    label.text = @"Highlight";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    [label setTextColor:[UIColor blackColor]];
    [vibrancyEffectView.contentView addSubview:label];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
