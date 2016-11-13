//
//  UIDevice+UIDeviceCategory.m
//  P2P
//
//  Created by chen cheng on 14-07-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//


#import <sys/types.h>
#import <sys/sysctl.h>

#import "UIDevice+UIDeviceCategory.h"

@implementation UIDevice (UIDeviceCategory)

static float mainScreenWidth = 0;
static float mainScreenHeight = 0;
static int systemVersionFirstNumber = -1;

+ (int)modelId
{
    CGFloat  deviceWidth = [UIDevice width];
    if (deviceWidth == 768)
    {
        return DEVICE_MODELID_IPAD;
    }
    else if (deviceWidth == 320)
    {
        CGFloat deviceHeight = [UIDevice height];
        if (deviceHeight == 480)
        {
            return DEVICE_MODELID_IPHONE_480h;
        }
        else if (deviceHeight == 568)
        {
            return DEVICE_MODELID_IPHONE_568h;
        }
    }
    
    return DEVICE_MODELID_EOOR;
}

+ (CGFloat)width
{
    if (mainScreenWidth == 0)
    {
        mainScreenWidth = [UIScreen mainScreen].bounds.size.width;
    }
    return mainScreenWidth;
}

+ (CGFloat)height
{
    if (mainScreenHeight == 0)
    {
        mainScreenHeight = [UIScreen mainScreen].bounds.size.height;
    }

    return mainScreenHeight;
}

+ (int)screenType
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)]
        && ([UIScreen mainScreen].scale == 2.0))
    {
        return SCREEN_RETINA;
    }
    else
    {
        return SCREEN_NORMAL;
    }
}

+ (int)systemVersionFirstNumber
{
    if (systemVersionFirstNumber == -1)
    {
        NSString *systemVersionString = [[UIDevice currentDevice] systemVersion];
        systemVersionFirstNumber = [systemVersionString UTF8String][0] - '0';
    }
    
    return systemVersionFirstNumber;
}


+ (NSString *)machineName
{
    size_t size;
    if (sysctlbyname("hw.machine", NULL, &size, NULL, 0) < 0) {
        return nil;
    }
    char *name = (char *)malloc(size);
    if (sysctlbyname("hw.machine", name, &size, NULL, 0) < 0) {
        free(name);
        return nil;
    }
    
    NSString *machine = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
    free(name);
    return machine;
}


@end
