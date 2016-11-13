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
    
    NSLog(@"View1_2Controller :: viewDidLoad");
    
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)QF_viewDidUnload
{
    self.view = nil;
}


@end
