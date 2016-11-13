//
//  TCPClient.m
//  照片传输客户端
//
//  Created by chen cheng on 14-9-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "TCPClient.h"

@interface TCPClient ()

@end

@implementation TCPClient

- (id)initWithServerIp:(NSString *)ip serverPort:(uint16_t )port
{
    self = [super init];
    if (self != nil)
    {
        _ip = [ip retain];
        _port = port;
    }
    
    return self;
}

- (void)connectCompletionHandler:(void (^)(BOOL flag)) handler
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        _socketfd = openClientSocket([_ip UTF8String], _port);
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (_socketfd >= 0)
            {
                handler(YES);
            }
            else
            {
                handler(NO);
            }
            
        });
    });
    
    
}



@end
