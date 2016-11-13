//
//  C.m
//  通知中心
//
//  Created by chen cheng on 14-8-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "C.h"

@implementation C

- (void)sendData:(int)data
{
    //1、获取通知中心对象
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    
    
    /**
     *  创建一个通知
     *
     *  @param name     通知的名称
     *  @param object   谁发送的通知
     *  @param userInfo 通知的信息（字典）
     *
     *  @return 返回一个通知
     */
    //- (instancetype)initWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo
    
    //创建一个通知
    NSNotification *notification = [[NSNotification alloc] initWithName:@"C::sendData" object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:data], @"intValue", nil]];
    
    //把信息交给通知中心 （发送信息）
    [notificationCenter postNotification:notification];
}

@end
