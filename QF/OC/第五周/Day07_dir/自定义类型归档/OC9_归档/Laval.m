//
//  Laval.m
//  OC9_归档
//
//  Created by xuan on 14-3-28.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "Laval.h"
#define AGE @"age"
#define NAME @"name"

@implementation Laval
//归档的时候调用的方法

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInt:self.age forKey:AGE];
    [aCoder encodeObject:self.name forKey:NAME];
}
//解归档的时候要调用的函数
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {//如果父类也遵守归档协议那么这里要调用 [super initWithCoder:];
        self.age = [aDecoder decodeIntForKey:AGE];
        self.name = [aDecoder decodeObjectForKey:NAME];
    }
    return self;
}
@end
