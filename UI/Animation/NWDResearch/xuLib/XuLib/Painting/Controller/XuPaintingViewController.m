//
//  XuPaintingViewController.m
//  XuLib
//
//  Created by xuwenyuan on 2017/5/22.
//  Copyright © 2017年 xu. All rights reserved.
//

#import "XuPaintingViewController.h"
#import "XuCustomView.h"

@interface XuPaintingViewController ()

@end

@implementation XuPaintingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    XuCustomView *wView = [[XuCustomView alloc] init];
    [self.view addSubview:wView];
    [wView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@300);
        make.center.equalTo(self.view);
    }];
    wView.backgroundColor = [UIColor lightGrayColor];
    
    CAGradientLayer *dLayer = [CAGradientLayer layer];
    dLayer.colors = @[(id)[UIColor yellowColor].CGColor,(id)[UIColor grayColor].CGColor,(id)[UIColor redColor].CGColor,(id)[UIColor greenColor].CGColor];
    dLayer.startPoint = CGPointMake(0, 0);
    dLayer.endPoint = CGPointMake(1, 1);
    dLayer.locations = @[@0.0,@0.2,@0.5,@01];//0-1
    dLayer.frame = CGRectMake(10, 10, 320, 100);
    [self.view.layer addSublayer:dLayer];
    
    
    [UIView animateWithDuration:1.f animations:^{
        
    }];
    
    [UIView animateWithDuration:1.f delay:0.25 options:UIViewAnimationOptionCurveLinear animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView
{
    self.view = [UIView new];
    self.view.backgroundColor = [UIColor whiteColor];
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
