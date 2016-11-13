//
//  NSArray+Swizzle.m
//  Method Swizzling 原理
//
//  Created by chen songqi on 15/6/8.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "NSArray+Swizzle.h"

@implementation NSArray (Swizzle)

- (id)myLastObject
{
    id ret = [self myLastObject];
    NSLog(@"**********  myLastObject *********** ");
    return ret;
}


@end
