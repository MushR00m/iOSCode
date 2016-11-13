//
//  View4Controller.m
//  标签栏视图控制器
//
//  Created by chen cheng on 14-9-3.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "View4Controller.h"

@interface View4Controller ()

@end

@implementation View4Controller

- (id)init
{
    self = [super init];
    if (self)
    {
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:4];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"View4Controller :: viewDidLoad");
    
    self.view.backgroundColor = [UIColor cyanColor];
}

- (void)QF_viewDidUnload
{
    self.view = nil;
}


@end
