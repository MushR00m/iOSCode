//
//  D.m
//  通知中心
//
//  Created by chen cheng on 14-8-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "D.h"

@implementation D

- (void)dealloc
{
    //1、获取通知中心对象
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter removeObserver:self];
    
    [super dealloc];
}


- (id)init
{
    self = [super init];
    
    if (self != nil)
    {
        //1、获取通知中心对象
        NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
        
        /**
         *  告诉通知中心 对什么样通知感兴趣
         *
         *  @param observer  感兴趣的对象（谁对通知感兴趣）
         *  @param aSelector 当通知收到通知时、通知中心需要回调的接口
         *  @param aName     感兴趣的通知名称
         *  @param anObject  对哪一个对象发送的通知感兴趣（如果为nil、表示对所有人发送通知都感兴趣）
         */
        //- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject
        
        //告诉通知中心 对什么样通知感兴趣
        [notificationCenter addObserver:self selector:@selector(recvNotification:) name:@"C::sendData" object:nil];
    }
    
    return self;
}

- (void)recvNotification:(NSNotification *)notification
{
    NSNumber *number = [notification.userInfo valueForKey:@"intValue"];
    
    _data = [number intValue];
    
    NSLog(@"D::recvData _data = %d", _data);
}

@end
