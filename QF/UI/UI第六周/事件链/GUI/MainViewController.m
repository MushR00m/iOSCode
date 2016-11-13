//
//  MainViewController.m
//  事件链
//
//  Created by chen cheng on 14-8-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"

@interface MainViewController ()

@end

@implementation MainViewController

//事件相应函数 凡是相应者收到事件、touchesBegan等系列函数都会被自动回调
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"MainViewController :: touchesBegan self.nextResponder = %@", self.nextResponder);
    [super touchesBegan:touches withEvent:event];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        
    }
    return self;
}

- (void)loadView
{
    self.view = [[[MainView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)] autorelease];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}


@end
