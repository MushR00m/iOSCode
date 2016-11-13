//
//  main.m
//  OC9_归档
//
//  Created by xuan on 14-3-28.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Laval.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
#if 0
       //系统自带类的对象进行归档
        NSArray *array = @[@"ios",@"oc"];
        //对数组归档
        //归档的类 包括这个类中的元素 所属类的都必须要遵守NSCoding 协议才能归档和解归档

        BOOL ret = [NSKeyedArchiver archiveRootObject:array toFile:@"/Users/apple/Desktop/arr.data"];
        if (ret) {
            NSLog(@"归档成功");
        }else{
            NSLog(@"归档失败");
        }
#else
        //解档之后要注意强引用 防止释放
        //解归档、读档
        NSArray *array = [[NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/apple/Desktop/arr.data"] retain];
        NSLog(@"array = %@",array);
        
#endif
        
#if 0
        //自定义类的对象进行归档
        //如果自定义的类对象要进行归档那么这个对象的属性所属的类也必须要遵守归档协议
        
        Laval *xiaohong = [[Laval alloc] init];
        
        xiaohong.age = 2;
        xiaohong.name = @"xiaohong";
        //对xiaohong指向的对象进行归档（永久保存）
        BOOL ret2 = [NSKeyedArchiver archiveRootObject:xiaohong toFile:@"/Users/apple/Desktop/laval.data"];
        if (ret2) {
            NSLog(@"虫子归档成功");
        }else {
            NSLog(@"虫子归档失败");
        }
        
#else
        //解归档
        
        Laval *laval = [(Laval *)[NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/apple/Desktop/laval.data"] retain];
        NSLog(@"age = %d name = %@",laval.age,laval.name);
        
#endif
        
        
    }
    return 0;
}

