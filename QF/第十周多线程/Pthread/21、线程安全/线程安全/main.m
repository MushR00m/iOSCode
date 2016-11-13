//
//  main.m
//  线程安全
//
//  Created by chen cheng on 14-9-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    NSString    *_name;
}

@property(copy, readwrite, nonatomic)NSString *name;//这个是非线程安全的。这样会提供程序的性能。

@end

@implementation Student

/*- (void)setName:(NSString *)name
{
    NSString *newName = [name copy];
    [_name release];
    _name = newName;
}*/


@end


//如果一个函数当中使用了全局变量、或静态变量、该函数就是非线程安全的。除非你有同步措施



int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
    }
    return 0;
}

