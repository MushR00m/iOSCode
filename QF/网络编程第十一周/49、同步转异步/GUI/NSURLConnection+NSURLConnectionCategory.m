//
//  NSURLConnection+NSURLConnectionCategory.m
//  同步转异步
//
//  Created by chen cheng on 14-9-23.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "NSURLConnection+NSURLConnectionCategory.h"

@implementation NSURLConnection (NSURLConnectionCategory)

+ (void)sendAsynchronousRequest:(NSURLRequest*) request completionHandler:(void (^)(NSURLResponse* response, NSData* data, NSError* connectionError)) handler
{
    __block NSURLResponse *response = nil;
    __block NSData *data = nil;
    __block NSError *error = nil;
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        [response retain];
        [data retain];
        [error retain];
        
        if (handler != nil)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                handler([response autorelease], [data autorelease], [error autorelease]);
    
            });
        }
    });
}

@end
