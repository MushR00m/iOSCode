//
//  MainViewController.m
//  Http 异步请求
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
    
//    [_mutableData setData:nil];
    
    NSURL * url = [NSURL URLWithString:@"http://www.baidu.com"];
    
   // NSMutableURLRequest *mutableURLRequest = [NSMutableURLRequest alloc] initWithURL:<#(NSURL *)#> cachePolicy:<#(NSURLRequestCachePolicy)#> timeoutInterval:<#(NSTimeInterval)#>;
    NSMutableURLRequest *mutableURLRequest = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];
    
    
    //定义一个异步的NSURLConnection对象 当收到数据会发生错误时 delegate(NSURLConnectionDelegate)里面的相应方法会被自动回调
    NSURLConnection  *urlConnection = [[NSURLConnection alloc] initWithRequest:mutableURLRequest delegate:self startImmediately:NO];
    
    //开始发送异步请求 该函数不会阻塞、立刻返回。
    NSLog(@"start 11");
    [urlConnection start];
    NSLog(@"start 22");
    
    [mutableURLRequest release];
    [urlConnection release];
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    //出现错误的时候会被回调
    NSLog(@"didFailWithError error = %@", error);
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //当收到服务端返回的应答包的包头的时候会被回调
    NSLog(@"didReceiveResponse response = %@", response);
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //当收到服务端返回的包体的数据的时候会被回调 如何包体的数据很大、该接口可能会对次回调
    [_mutableData appendData:data];
    

    
    NSLog(@"didReceiveData data = %@", data);
}
- (void)connectionDidFinishLoading: (NSURLConnection *)connection
{
    //当把服务端的应答包接受完毕（包体和包头都接受完毕）后会被回调
    NSLog(@"connectionDidFinishLoading");
    
    NSString  *html = [[NSString alloc] initWithData:_mutableData encoding:NSUTF8StringEncoding];
    
    NSLog(@"html = %@", html);
    
    [html release];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _mutableData = [[NSMutableData alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"%@ = ",NSHomeDirectory());
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
