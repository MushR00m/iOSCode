//
//  XuThreeBallViewController.m
//  XuLib
//
//  Created by xuwenyuan on 2017/3/29.
//  Copyright © 2017年 xu. All rights reserved.
//

#import "XuThreeBallViewController.h"
#import "XuThreeBallView.h"

@interface XuThreeBallViewController ()

@end

@implementation XuThreeBallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    XuThreeBallView *ballView = [[XuThreeBallView alloc] init];
    [self.view addSubview:ballView];
    [ballView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(@200);
    }];
    
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
