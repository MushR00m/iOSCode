//
//  TCPServer.h
//  照片传输服务端
//
//  Created by chen cheng on 14-9-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCPServer : NSObject
{
    int       _listenSocket;
    uint16_t  _port;
    
    BOOL      _isStarted;
}

- (id)initWithListenPort:(uint16_t)port;

- (BOOL)start;

@end
