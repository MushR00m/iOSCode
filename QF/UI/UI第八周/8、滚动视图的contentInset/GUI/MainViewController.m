//
//  MainViewController.m
//  滚动视图的contentInset
//
//  Created by chen cheng on 14-9-3.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _view1Controller = [[View1Controller alloc] init];

    
    _navigationController = [[UINavigationController alloc] initWithRootViewController:_view1Controller];
    
    _navigationController.delegate = self;
    
    [self.view addSubview:_navigationController.view];
    
    
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == _view1Controller)
    {
        NSLog(@"contentInset.top = %f", _view1Controller.scrollView.contentInset.top);
    }
}




@end
