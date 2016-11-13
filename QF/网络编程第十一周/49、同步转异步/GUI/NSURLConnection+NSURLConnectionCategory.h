//
//  NSURLConnection+NSURLConnectionCategory.h
//  同步转异步
//
//  Created by chen cheng on 14-9-23.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLConnection (NSURLConnectionCategory)

+ (void)sendAsynchronousRequest:(NSURLRequest*) request completionHandler:(void (^)(NSURLResponse* response, NSData* data, NSError* connectionError)) handler;


@end
