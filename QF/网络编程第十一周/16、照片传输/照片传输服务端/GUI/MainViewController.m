//
//  MainViewController.m
//  照片传输服务端
//
//  Created by chen cheng on 14-9-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tcpServer = [[TCPServer alloc] initWithListenPort:8096];
}

- (IBAction)startServerButtonClick:(id)sender
{
    [_tcpServer start];
}

@end
