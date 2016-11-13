//
//  MainViewController.m
//  XIBDemo1
//
//  Created by chen cheng on 14-8-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"
#import "SettingView.h"

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SettingView *settingView = [[[NSBundle mainBundle] loadNibNamed:@"SettingView" owner:nil options:nil] lastObject];
    
    settingView.switchControl.on = NO;
    settingView.segmentedControl.selectedSegmentIndex = 1;
    
    [settingView.button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    settingView.frame = CGRectMake(10, 30, 300, 200);
    
    settingView.layer.borderColor = [UIColor blackColor].CGColor;
    settingView.layer.borderWidth = 1;
    
    [self.view addSubview:settingView];

}

- (void)buttonClick:(id)sender
{
    NSLog(@"buttonClick");
}


@end
