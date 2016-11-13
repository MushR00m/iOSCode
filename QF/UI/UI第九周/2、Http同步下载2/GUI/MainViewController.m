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
    
    
    NSURL   *url = [NSURL URLWithString:@"http://192.168.83.169/Login"];
    
    //http（URL）请求包
    NSMutableURLRequest *mutableURLRequest = [[NSMutableURLRequest alloc] init];
    
    //- (id)initWithURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval;
    
    
    //设置链接
    [mutableURLRequest setURL:url];
    
    //设置请求的方法 GET or POST  默认是GET方法
    [mutableURLRequest setHTTPMethod:@"GET"];
    
    //设置超时时间
    [mutableURLRequest setTimeoutInterval:60];
    
    //设置缓存策略 NSURLRequestReloadIgnoringLocalCacheData 忽略本地缓存  重新加载数据
    [mutableURLRequest setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    
    
    //带出错误信息
    NSError  *error = nil;
    
    //带出应答包的包头
    NSURLResponse *urlResponse = nil;
    
    //存放应答包得包体的数据
    NSData *data = nil;
    
    //给服务器发送同步请求包 （该函数会阻塞、要等到服务器的数据到达客户端过后才返回)
    data = [NSURLConnection sendSynchronousRequest:mutableURLRequest returningResponse:&urlResponse error:&error];
    if (error != nil)
    {
        NSLog(@"error = %@", error);
    }
    else
    {
        NSLog(@"urlResponse = %@", urlResponse);
        
        NSString  *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
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

    NSLog(@"NSHomeDirectory() = %@", NSHomeDirectory());
}


@end
