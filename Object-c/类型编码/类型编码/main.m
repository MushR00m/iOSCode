//
//  main.m
//  类型编码
//
//  Created by chensongqi on 17/2/28.
//  Copyright © 2017年 chensongqi. All rights reserved.
//

#import <Foundation/Foundation.h>

//为了帮助运行时系统，编译器将每个方法的返回值和参数编码成一个C字符串，并将这个字符串和OC的方法选择器进行关联。

@interface TypeEncodingObject : NSObject

- (void)testMethod;

@end

@implementation TypeEncodingObject

- (void)testMethod
{
    NSLog(@"char --> %s",@encode(char));
    NSLog(@"int --> %s",@encode(int));
    NSLog(@"short --> %s",@encode(short));
    NSLog(@"long --> %s",@encode(long));
    NSLog(@"long long --> %s",@encode(long long));
    NSLog(@"unsigned char --> %s",@encode(unsigned char));
    NSLog(@"unsigned int --> %s",@encode(unsigned int));
    NSLog(@"unsigned short --> %s",@encode(unsigned short));
    NSLog(@"unsigned long --> %s",@encode(unsigned long long));
    NSLog(@"float --> %s",@encode(float));
    NSLog(@"bool --> %s",@encode(bool));
    NSLog(@"void --> %s",@encode(void));
    NSLog(@"char * --> %s",@encode(char *));
    NSLog(@"id --> %s",@encode(id));
    NSLog(@"Class --> %s",@encode(Class));
    NSLog(@"SEL --> %s",@encode(SEL));
    int array[] = {1,2,3};
    NSLog(@"int[] --> %s",@encode(typeof(array)));
    

}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        TypeEncodingObject *obj = [[TypeEncodingObject alloc] init];
        [obj testMethod];
    }
    return 0;
}
