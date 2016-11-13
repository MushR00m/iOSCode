//
//  NetworkReachabilityTool.m
//  自定义空工程模板
//
//  Created by chen cheng on 14-6-9.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "NetworkReachabilityTool.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>

@interface NetworkReachabilityTool()

+ (NetworkStatus) networkStatusForFlags: (SCNetworkReachabilityFlags) flags;

@end

static void ReachabilityCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags flags, void* info)
{
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(target, &flags);
    
    NetworkStatus networkStatus;
    
    //如果不能获取连接标志，则不能连接网络，直接返回
    if (!didRetrieveFlags)
    {
        networkStatus = NotReachable;
    }
    
    
    networkStatus = [NetworkReachabilityTool networkStatusForFlags:flags];
    
    UIAlertView *alertView = [[[UIAlertView alloc] initWithTitle: @"提示" message:[NSString stringWithFormat:@"网络连接状态变成:%d", networkStatus] delegate: nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil] autorelease];
    [alertView show];
}

@implementation NetworkReachabilityTool

+ (NetworkStatus) networkStatusForFlags: (SCNetworkReachabilityFlags) flags
{
    if ((flags & kSCNetworkReachabilityFlagsReachable) == 0)
    {
        return NotReachable;
    }
    
    BOOL retVal = NotReachable;
    
    if ((flags & kSCNetworkReachabilityFlagsConnectionRequired) == 0)
    {
        retVal = ReachableViaWiFi;
    }
    if ((((flags & kSCNetworkReachabilityFlagsConnectionOnDemand ) != 0) ||
         (flags & kSCNetworkReachabilityFlagsConnectionOnTraffic) != 0))
    {
        if ((flags & kSCNetworkReachabilityFlagsInterventionRequired) == 0)
        {
            retVal = ReachableViaWiFi;
        }
    }
    if ((flags & kSCNetworkReachabilityFlagsIsWWAN) == kSCNetworkReachabilityFlagsIsWWAN)
    {
        if((flags & kSCNetworkReachabilityFlagsReachable) == kSCNetworkReachabilityFlagsReachable)
        {
            if ((flags & kSCNetworkReachabilityFlagsTransientConnection) == kSCNetworkReachabilityFlagsTransientConnection)
            {
                retVal = ReachableVia3G;
                if((flags & kSCNetworkReachabilityFlagsConnectionRequired) == kSCNetworkReachabilityFlagsConnectionRequired)
                {
                    retVal = ReachableVia2G;
                }
            }
        }
    }
    return retVal;
}
//检查当前网络连接是否正常
+ (BOOL)connectedToNetWork
{
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;

    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    if (!didRetrieveFlags)
    {
        printf("Error. Count not recover network reachability flags\n");
        return NO;
    }
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    return (isReachable && !needsConnection) ? YES : NO;
}

//检查网络连接类型
+ (NetworkStatus)checkNetworktype
{
    struct sockaddr_in zeroAddress;
    
    memset(&zeroAddress, 0, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    SCNetworkReachabilityRef reachabilityRef = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    
    SCNetworkReachabilityFlags flags;
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(reachabilityRef, &flags);
    if (!didRetrieveFlags)
    {
        return NotReachable;
    }
    
    return [NetworkReachabilityTool networkStatusForFlags:flags];
}

//每当网络连接发生变化时自动检查一次
+ (void)startAsyncCheckNetworktype
{
    //创建零地址，0.0.0.0的地址表示查询本机的网络连接状态
    struct sockaddr_in zeroAddress;
    
    memset(&zeroAddress, 0, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    SCNetworkReachabilityRef reachabilityRef = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    
    //第一次检查
    SCNetworkReachabilityFlags flags;
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(reachabilityRef, &flags);
    
    NetworkStatus networkStatus;
    
    if (!didRetrieveFlags)
    {
        networkStatus = NotReachable;
    }
    
    networkStatus = [NetworkReachabilityTool networkStatusForFlags:flags];
    
    UIAlertView *alertView = [[[UIAlertView alloc] initWithTitle: @"提示" message:[NSString stringWithFormat:@"当前网络连接状态为:%d", networkStatus] delegate: nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil] autorelease];
    [alertView show];
    
    
    //之后设置成当网络发生变化检查一次
    if(SCNetworkReachabilitySetCallback(reachabilityRef, ReachabilityCallback, nil))
	{
		SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode);
	}
}


@end
