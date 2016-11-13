//
//  Laval.h
//  OC9_归档
//
//  Created by xuan on 14-3-28.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
//如果我们想把自定义类的对象进行永久保存，那么就必须要归档
//但是归档类制定了一个NSCoding 协议
//所有要归档的类必须要遵守协议实现规范的方法

@interface Laval : NSObject <NSCoding>
{
    int _age;
    NSString *_name;
}
@property (nonatomic) int age;
@property (nonatomic,copy) NSString *name;
@end
