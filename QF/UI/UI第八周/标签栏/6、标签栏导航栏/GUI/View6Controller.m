//
//  View6Controller.m
//  标签栏视图控制器
//
//  Created by chen cheng on 14-9-3.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "View6Controller.h"

@interface View6Controller ()

@end

@implementation View6Controller

- (id)init
{
    self = [super init];
    if (self)
    {
        self.tabBarItem = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:6] autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
}


@end
