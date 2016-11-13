//
//  View1Controller.m
//  标签栏视图控制器
//
//  Created by chen cheng on 14-9-3.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "View1Controller.h"

@interface View1Controller ()

@end

@implementation View1Controller

- (id)init
{
    self = [super init];
    if (self)
    {
        //UITabBarItem不是UIView的子类、这里仅仅是告诉UITabBarController如何绘制我的标签栏
        //self.tabBarItem = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1] autorelease];
        
        
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"视图1" image:[UIImage imageNamed:@"homePage.png"] tag:1] autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
}


@end
