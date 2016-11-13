//
//  MainViewController.m
//  QFNetWorkingDemo
//
//  Created by chen cheng on 14-9-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"
#import "QFNetWorking.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (IBAction)buttonClick:(id)sender
{
    [QFNetWorking sendAsynchronousRequestWithURL:@"http://www.baidu.com" completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error == nil)//异步请求成功
        {
            NSLog(@"response = %@", response);
            
            NSLog(@"data = %@", data);
        }
        else //异步请求失败
        {
            NSLog(@"error = %@", error);
        }
    }];
    
    NSLog(@"sendAsynchronous end");
}

- (id)init
{
    self = [super init];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
