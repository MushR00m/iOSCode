//
//  NSNull+InternalNullExtention.m
//  NSNull扩展
//
//  Created by chen songqi on 15/6/8.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "NSNull+InternalNullExtention.h"

#define NSNullObjects @[@"",@0,@{},@[]]

@implementation NSNull (InternalNullExtention)


- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{

    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        for (NSObject *object in NSNullObjects) {

            signature = [object methodSignatureForSelector:aSelector];
            if (signature) {
                break;
            }
        }
    }

    return signature;
}

/*

 如果一个对象收到一条无法处理的消息，运行时系统会在抛出错误前，给该对象发送一条forwardInvocation:消息，该消息的唯一参数是个NSInvocation类型的对象——该对象封装了原始的消息和消息的参数。
 
 forwardInvocation:方法就像一个不能识别的消息的分发中心，将这些消息转发给不同接收对象。或者它也可以象一个运输站将所有的消息都发送给同一个接收对象。它可以将一个消息翻译成另外一个消息，或者简单的"吃掉“某些消息，因此没有响应也没有错误。forwardInvocation:方法也可以对不同的消息提供同样的响应，这一切都取决于方法的具体实现。该方法所提供是将不同的对象链接到消息链的能力。
 

 */
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    SEL aSelector = [anInvocation selector];
    for (NSObject *object in NSNullObjects) {
        if ([object respondsToSelector:aSelector]) {
            [anInvocation invokeWithTarget:object];
            return;
        }
    }
    [self doesNotRecognizeSelector:aSelector];
}


@end
