//
//  MainViewController.m
//  视图切换(视图控制器)
//
//  Created by chen cheng on 14-8-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

#import "AppDelegate.h"


static MainViewController *g_mainViewController = nil;

@interface MainViewController ()

@end

@implementation MainViewController

+ (MainViewController *)shareMainViewController
{
    return g_mainViewController;
}

- (void)dealloc
{
    [_view1Controller release];
    _view1Controller = nil;
    
    [_view2Controller release];
    _view2Controller = nil;

    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        g_mainViewController = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _view1Controller  = [[View1Controller alloc] init];
    
    _view2Controller = [[View2Controller alloc] init];
    
    _currentPage = 1;
    _view1Controller.view.frame = self.view.bounds;
    [self.view addSubview:_view1Controller.view];
}

//当发生内存警告信息后、window的根视图控制器的didReceiveMemoryWarning函数是百分百会被回调
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    NSLog(@"MainViewController didReceiveMemoryWarning");
    
    
    if (_currentPage == 1)
    {
        //把视图二的内存给卸载掉
        [_view2Controller QF_viewDidUnload];
    }
    else if (_currentPage == 2)
    {
        //把视图一的内存给卸载掉
        [_view1Controller QF_viewDidUnload];
    }
    
}

- (void)showView2WithAnimated:(BOOL)animated
{
    _currentPage = 2;
    
    
    //外观的风格 只影响iPad上面的外观  iPhone统统为全屏
    _view2Controller.modalPresentationStyle = UIModalPresentationFormSheet;
    
    //动画风格
    _view2Controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    
    [self presentViewController:_view2Controller animated:animated completion:^{
        
    }];
}

- (void)backView1WithAnimated:(BOOL)animated
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end
