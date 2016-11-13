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
    
    self.view.backgroundColor = [UIColor purpleColor];
    
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
