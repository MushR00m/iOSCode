//
//  View1_2Controller.m
//  标签栏视图控制器
//
//  Created by chen cheng on 14-9-3.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "View1_2Controller.h"

@interface View1_2Controller ()

@end

@implementation View1_2Controller

- (id)init
{
    self = [super init];
    if (self)
    {
        self.navigationItem.title = @"视图1_2";
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
