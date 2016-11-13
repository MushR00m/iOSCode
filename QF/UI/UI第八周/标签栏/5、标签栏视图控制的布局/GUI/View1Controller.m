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
        self.tabBarItem = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1] autorelease];
        
        //设置布局属性（>=iOS7）  告诉标签栏视图控制器  如何设置我的self.view.frame属性
        if ([[[UIDevice currentDevice] systemVersion] UTF8String][0] >= '7')
        {
            self.edgesForExtendedLayout = UIRectEdgeLeft| UIRectEdgeRight;
        }
        else
        {
            //( NS_DEPRECATED_IOS(3_0, 7_0))
            self.wantsFullScreenLayout = NO;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    self.view.backgroundColor = [UIColor greenColor];
}


@end
