//
//  View3Controller.m
//  标签栏视图控制器
//
//  Created by chen cheng on 14-9-3.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "View3Controller.h"

@interface View3Controller ()

@end

@implementation View3Controller

- (id)init
{
    self = [super init];
    if (self)
    {
        self.tabBarItem = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:3] autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"View3Controller :: viewDidLoad");
    
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)QF_viewDidUnload
{
    self.view = nil;
}




@end
