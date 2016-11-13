//
//  MainViewController.m
//  Http同步下载
//
//  Created by chen cheng on 14-9-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (IBAction)downloadButtonClick:(id)sender
{
    NSURL   *url = [NSURL URLWithString:@"http://www.baidu.com"];
    
    NSURL  *url1 = [NSURL URLWithString:@"http://www.192.168.83.169"];
    
    //http（URL）请求包
    NSURLRequest  *urlRequest = [NSURLRequest requestWithURL:url];
    
    NSURLRequest  *urlRequest1 = [NSURLRequest requestWithURL:url1];
    
    //带出错误信息
    NSError  *error = nil;
    
    NSError *error1 = nil;
    
    //带出应答包的包头
    NSURLResponse *urlResponse = nil;
    
    NSURLResponse *urlResponse1 = nil;
    
    //存放应答包得包体的数据
    NSData *data = nil;

    NSData *data1 = nil;
    
    //给服务器发送同步请求包 （该函数会阻塞、要等到服务器的数据到达客户端过后才返回)
    data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&urlResponse error:&error];
    data1 = [NSURLConnection sendSynchronousRequest:urlRequest1 returningResponse:&urlResponse1 error:&error1];
    
    if (error != nil)
    {
        NSLog(@"error1 = %@", error1);
    }
    else
    {
        NSLog(@"urlResponse1 = %@", urlResponse1);
        
        NSString  *html = [[NSString alloc] initWithData:data1 encoding:NSUTF8StringEncoding];
        
        NSLog(@"html = %@", html);
        
        [html release];
    }
    
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
    
}


@end
