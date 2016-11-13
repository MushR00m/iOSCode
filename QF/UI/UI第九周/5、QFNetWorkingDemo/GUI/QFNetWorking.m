//
//  QFNetWorking.m
//  QFNetWorkingDemo
//
//  Created by chen cheng on 14-9-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFNetWorking.h"

typedef void (^CompletionHandler)(NSURLResponse* response, NSData* data, NSError* error);


@interface QFHttpRequest : NSObject<NSURLConnectionDelegate, NSURLConnectionDataDelegate>
{
    NSURL   *_requestURL;
    NSURLRequestCachePolicy _cachePolicy;
    NSTimeInterval _timeoutInterval;
    
    //存放应答包得包头的数据
    NSURLResponse *_response;
    
    //存放应答包得包体的数据
    NSMutableData  *_mutableData;
    
    //存放错误信息
    NSError *_error;
    
    CompletionHandler _completionHandler;
}

@property(retain, readwrite, nonatomic)NSURL *requestURL;
@property(assign, readwrite, nonatomic)NSURLRequestCachePolicy cachePolicy;
@property(assign, readwrite, nonatomic)NSTimeInterval timeoutInterval;
@property(copy, readwrite, nonatomic)CompletionHandler completionHandler;

- (void)start;


@end



@implementation QFHttpRequest

- (void)dealloc
{
    [_response release];
    _response = nil;
    
    [_mutableData release];
    _mutableData = nil;
    
    [_error release];
    _error = nil;
    
    [_requestURL release];
    _requestURL = nil;
    
    [_completionHandler release];
    _completionHandler = nil;
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        _mutableData = [[NSMutableData alloc] init];
    }
    
    return self;
}

- (void)start
{
    [self retain];
    
    NSMutableURLRequest *mutableURLRequest = [[NSMutableURLRequest alloc] initWithURL:self.requestURL cachePolicy:self.cachePolicy timeoutInterval:self.timeoutInterval];
    
    
    [_response release];
    _response = nil;
    
    [_mutableData setData:nil];
    
    [_error release];
    _error = nil;
    
    NSURLConnection  *urlConnection = [NSURLConnection connectionWithRequest:mutableURLRequest delegate:self];
    
    [urlConnection start];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    _error = [error retain];
    
    if (_completionHandler != nil)
    {
        _completionHandler(_response, _mutableData, _error);
    }
    
    [self release];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _response = [response retain];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_mutableData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if (_completionHandler != nil)
    {
        _completionHandler(_response, _mutableData, _error);
    }
    
    [self release];
}

@end



@implementation QFNetWorking


+ (void)sendAsynchronousRequestWithURL:(NSString *)urlStr cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval completionHandler:(void (^)(NSURLResponse* response, NSData* data, NSError* error)) handler
{
    QFHttpRequest  *httpRequest = [[QFHttpRequest alloc] init];
    
    httpRequest.requestURL = [NSURL URLWithString:urlStr];
    httpRequest.cachePolicy = cachePolicy;
    httpRequest.timeoutInterval = timeoutInterval;
    httpRequest.completionHandler = handler;
    
    
    [httpRequest start];
    
    [httpRequest release];
}

+ (void)sendAsynchronousRequestWithURL:(NSString *)urlStr completionHandler:(void (^)(NSURLResponse* response, NSData* data, NSError* error)) handler
{
    [self sendAsynchronousRequestWithURL:urlStr cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60 completionHandler:handler];
}

@end
