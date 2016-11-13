//
//  main.m
//  Method Swizzling 原理
//
//  Created by chen songqi on 15/6/8.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#import "NSArray+Swizzle.h"

//http://blog.csdn.net/yiyaaixuexi/article/details/9374411

/*
  Method Swizzling 原理

 在Objective-C中调用一个方法，其实是向一个对象发送消息，查找消息的唯一依据是selector的名字。利用Objective-C的动态特性，可以实现在运行时偷换selector对应的方法实现，达到给方法挂钩的目的。
 每个类都有一个方法列表，存放着selector的名字和方法实现的映射关系。IMP有点类似函数指针，指向具体的Method实现。
 
 
 可以利用 method_exchangeImplementations 来交换2个方法中的IMP，
 可以利用 class_replaceMethod 来修改类，
 可以利用 method_setImplementation 来直接设置某个方法的IMP，
 ……
 归根结底，都是偷换了selector的IMP
 
 
 使用 Method Swizzling 编程就好比切菜时使用锋利的刀，一些人因为担心切到自己所以害怕锋利的刀具，可是事实上，使用钝刀往往更容易出事，而利刀更为安全。
 Method swizzling 可以帮助我们写出更好的，更高效的，易维护的代码。但是如果滥用它，也将会导致难以排查的bug。

 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");

        Method ori_Method = class_getInstanceMethod([NSArray class], @selector(lastObject));
        Method my_Method = class_getInstanceMethod([NSArray class], @selector(myLastObject));
        method_exchangeImplementations(ori_Method, my_Method);

        NSArray *array = @[@"0",@"1",@"3"];
        NSString *str = [array lastObject];
        NSString *str2 = [array myLastObject];  //  会调到系统的lastObject
        NSLog(@"----- %@  == %@",str,str2);




    }
    return 0;
}
