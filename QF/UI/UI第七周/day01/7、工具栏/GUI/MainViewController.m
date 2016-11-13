//
//  MainViewController.m
//  导航视图控制器
//
//  Created by chen cheng on 14-8-26.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)dealloc
{
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _view1Controller = [[View1Controller alloc] init];
    _view1Controller.delegate = self;
    
    _view2Controller = [[View2Controller alloc] init];
    _view2Controller.delegate = self;

    
    _view1Controller.view.frame = self.view.bounds;
    [self.view addSubview:_view1Controller.view];
    
    
    _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 480-44, 320, 44)];
    _toolbar.barTintColor = [UIColor greenColor];
    _toolbar.tintColor = [UIColor blackColor];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:nil action:nil];
    
    [_toolbar setItems:[NSArray arrayWithObjects:barButtonItem, nil] animated:YES];
    
    
    [self.view addSubview:_toolbar];

}

- (void)showView2WithAnimated:(BOOL)animated
{
    _view2Controller.view.layer.transform = CATransform3DIdentity;
    _view2Controller.view.frame = self.view.bounds;
    
    _view2Controller.view.layer.transform = CATransform3DMakeTranslation(320, 0, 0);
    
    
    
    UIBarButtonItem *barButtonItem1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:nil action:nil];
    
    UIBarButtonItem *barButtonItem2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
    
    UIBarButtonItem *barButtonItem3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:nil action:nil];
    
    [_toolbar setItems:[NSArray arrayWithObjects:barButtonItem1, barButtonItem2, barButtonItem3, nil] animated:YES];
    
    [self.view insertSubview:_view2Controller.view belowSubview:_toolbar];
    
    
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        _view2Controller.view.layer.transform = CATransform3DIdentity;
        
    } completion:^(BOOL finished) {
        
        [_view1Controller.view removeFromSuperview];
    }];
    
}

- (void)backWithAnimated:(BOOL)animated
{
    _view1Controller.view.layer.transform = CATransform3DIdentity;
    _view1Controller.view.frame = self.view.bounds;
    
    [self.view insertSubview:_view1Controller.view belowSubview:_view2Controller.view];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:nil action:nil];
    
    [_toolbar setItems:[NSArray arrayWithObjects:barButtonItem, nil] animated:YES];
    
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        _view2Controller.view.layer.transform = CATransform3DMakeTranslation(320, 0, 0);
        
    } completion:^(BOOL finished) {
        
        [_view2Controller.view removeFromSuperview];
    }];

}


@end
