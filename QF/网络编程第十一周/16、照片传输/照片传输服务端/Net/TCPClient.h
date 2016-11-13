//
//  TCPClient.h
//  照片传输客户端
//
//  Created by chen cheng on 14-9-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocketTool.h"

@interface TCPClient : NSObject
{
    int _socketfd;
    
    NSString  *_ip;
    uint16_t _port;
}

- (id)initWithServerIp:(NSString *)ip serverPort:(uint16_t )port;

- (void)connectCompletionHandler:(void (^)(BOOL flag)) handler;

@end
