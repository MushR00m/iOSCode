//
//  QFNetWorking.h
//  QFNetWorkingDemo
//
//  Created by chen cheng on 14-9-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QFNetWorking : NSObject

+ (void)sendAsynchronousRequestWithURL:(NSString *)urlStr cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval completionHandler:(void (^)(NSURLResponse* response, NSData* data, NSError* error)) handler;

+ (void)sendAsynchronousRequestWithURL:(NSString *)urlStr completionHandler:(void (^)(NSURLResponse* response, NSData* data, NSError* error)) handler;

@end
