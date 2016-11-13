//
//  QFWebImageView.m
//  异步加载图片
//
//  Created by chen cheng on 14-9-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFWebImageView.h"

@implementation QFWebImageView

- (void)dealloc
{
    [_imageURL release];
    _imageURL = nil;
    
    [_stateLabel release];
    _stateLabel = nil;
    
    [_imageMutableData release];
    _imageMutableData = nil;
    
    [super dealloc];
}

- (void)setImageURL:(NSURL *)imageURL
{
    [imageURL retain];
    [_imageURL release];
    _imageURL = imageURL;
    
    
    
    //先看缓存里面是否有数据
    NSMutableURLRequest  *mutableURLRequest = [[NSMutableURLRequest alloc] initWithURL:_imageURL cachePolicy:NSURLRequestReturnCacheDataDontLoad timeoutInterval:0];
    
    NSError *error = nil;
    //发起同步请求
    NSData *imageData = [NSURLConnection sendSynchronousRequest:mutableURLRequest returningResponse:nil error:&error];
    if (error == nil)//从缓存加载图片数据成功
    {
        self.image = [UIImage imageWithData:imageData];
        
        [mutableURLRequest release];
        return;
    }
    
    
    //缓存没有这张图片
    [mutableURLRequest setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [mutableURLRequest setTimeoutInterval:10];
    
    
    if (_imageMutableData == nil)
    {
        _imageMutableData = [[NSMutableData alloc] init];
    }
    else
    {
        //把数据清空
        [_imageMutableData setData:nil];
    }
    
    if (_stateLabel == nil)
    {
        _stateLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _stateLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    _stateLabel.text = @"努力加载中...";
    [self addSubview:_stateLabel];
    
    NSURLConnection *urlConnection = [NSURLConnection connectionWithRequest:mutableURLRequest delegate:self];
    
    //发起异步请求
    [urlConnection start];
    [mutableURLRequest release];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    _stateLabel.text = @"网络不给力!";
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_imageMutableData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [_stateLabel removeFromSuperview];
    
    self.image = [UIImage imageWithData:_imageMutableData];
}




@end
