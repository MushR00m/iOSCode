//
//  View1_1Controller.m
//  标签栏视图控制器
//
//  Created by chen cheng on 14-9-3.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "View1_1Controller.h"
#import "View1Controller.h"

@interface View1_1Controller ()

@end

@implementation View1_1Controller

- (id)init
{
    self = [super init];
    if (self)
    {
        self.navigationItem.title = @"视图1_1";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"View1_1Controller :: viewDidLoad");
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton  *nextPageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [nextPageButton setTitle:@"下一页" forState:UIControlStateNormal];
    [nextPageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    nextPageButton.frame = CGRectMake(10, 80, 300, 40);
    
    [nextPageButton addTarget:self action:@selector(nextPageButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:nextPageButton];
    
}

- (void)QF_viewDidUnload
{
    self.view = nil;
}


- (void)nextPageButtonClick:(id)sender
{
    [self.delegate showView1_2];
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
