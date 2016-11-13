//
//  View5Controller.m
//  标签栏视图控制器
//
//  Created by chen cheng on 14-9-3.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "View5Controller.h"

@interface View5Controller ()

@end

@implementation View5Controller

- (id)init
{
    self = [super init];
    if (self)
    {
        self.tabBarItem  = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:5] autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"View5Controller :: viewDidLoad");
    
    self.view.backgroundColor = [UIColor purpleColor];
    
}


- (void)QF_viewDidUnload
{
    self.view = nil;
}


@end
