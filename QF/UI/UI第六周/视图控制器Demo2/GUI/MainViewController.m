//
//  MainViewController.m
//  视图控制器Demo1
//
//  Created by chen cheng on 14-8-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated  //视图即将显示的时候会调用
{
    NSLog(@"viewWillAppear animated = %d", animated);
}

- (void)viewDidAppear:(BOOL)animated//视图即将显示完成后的会调用
{
    NSLog(@"viewDidAppear animated = %d", animated);
}


- (void)loadView
{
    [super loadView];//该函数作用是生成self.view
    
    NSLog(@"loadView");
    
    
    UILabel   *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 40)];
    label.text = @"主视图";
    
    [self.view addSubview:label];
    
    [label release];
}

- (void)viewDidLoad// 没当视图加载完成的时候、该函数会被自动回调
{
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad");
}

- (void)didReceiveMemoryWarning//当iOS系统内存不足、并且该程序占用过多内存的时候 该函数会被自动回调
{
    //一般在该函数中做释放多余内存的操作
    NSLog(@"didReceiveMemoryWarning");
}

//在iOS 2.0  至  iOS 6.0中有效   返回值为YES表示支持旋转  否则表示不支持旋转
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
   /* if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft
        ||
        toInterfaceOrientation == UIDeviceOrientationLandscapeRight)
    {
        return YES;
    }
    else
    {
        return NO;
    }*/
    
    return YES;
    
}

// New Autorotation support.
- (BOOL)shouldAutorotate NS_AVAILABLE_IOS(6_0)
{
    return YES;
}

//app向视图控制询问支持哪些方向上旋转
- (NSUInteger)supportedInterfaceOrientations NS_AVAILABLE_IOS(6_0)
{
    return UIInterfaceOrientationMaskAll;//UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}


@end
