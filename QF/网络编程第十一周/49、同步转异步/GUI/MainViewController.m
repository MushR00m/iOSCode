//
//  MainViewController.m
//  同步转异步
//
//  Created by chen cheng on 14-9-23.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"
#import "NSURLConnection+NSURLConnectionCategory.h"

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
- (IBAction)downloadButtonClick:(id)sender
{
    NSURLRequest  *urlRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://127.0.0.1"] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60 * 2];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError == nil)
        {
            NSLog(@"response = %@", response);
            NSLog(@"data = %@", data);
        }
        else
        {
            NSLog(@"connectionError = %@", connectionError);
        }
    }];
}

@end
