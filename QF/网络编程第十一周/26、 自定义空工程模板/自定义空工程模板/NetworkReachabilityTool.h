//
//  NetworkReachabilityTool.h
//  自定义空工程模板
//
//  Created by chen cheng on 14-6-9.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum networkStatus
{
    NotReachable,
    ReachableViaWiFi,
    ReachableVia3G,
    ReachableVia2G
} NetworkStatus;

@interface NetworkReachabilityTool : NSObject

//检查当前网络连接是否正常
+ (BOOL)connectedToNetWork;

//检查网络连接类型
+ (NetworkStatus)checkNetworktype;

//每当网络连接发生变化时自动检查一次
+ (void)startAsyncCheckNetworktype;

@end
