//
//  View2Controller.m
//  标签栏视图控制器
//
//  Created by chen cheng on 14-9-3.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "View2Controller.h"

@interface View2Controller ()

@end

@implementation View2Controller

- (id)init
{
    self = [super init];
    if (self)
    {
        self.tabBarItem = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:2] autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
}

@end
