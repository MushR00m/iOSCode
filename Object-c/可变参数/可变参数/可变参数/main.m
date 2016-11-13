//
//  main.m
//  可变参数
//
//  Created by chen songqi on 15/6/9.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdarg.h>

//http://gracelancy.com

/*
 可变参数函数（Variadic Function），即是指一个可以接受可变数量的参数的函数。在C语言中，对该特性的支持，即是通过可变参数列表（Variable Argument list）来实现的，其定义在stdarg.h头文件。(若使用C++则在cstdarg头文件)。
 */
int addemUp(int firstNum,...) {
    //1。参数后面添加省略号。。。
    va_list args;//2.创建一个va_list类型的变量
    int sum = firstNum;
    int number;
    va_start(args, firstNum);// 3. 初始化va_list，此时va_list指向firstNum之后的第一个参数
    while (1) {
        number = va_arg(args, int);// 4. 获取当前指向的参数的值，并移动到下一个参数
        sum += number;
        if (number == 0) {
            //用0表示结束
            break;
        }


    }
     va_end(args); //5. 清理
     return  sum;
}

/*
 要创建一个可变参数函数，需要把一个省略号（…)放在函数的参数列表后面。
 接着需要声明一个一个va_list类型的变量，这个va_list类型的变量类似于一个指向参数的指针。
 接着我们调用va_start()并传入函数的最后一个声明的参数的变量名，来使得va_list变量指向第一个附加的参数。
 接着我们调用va_arg()并传入我们期待的参数类型，程序就会返回与该类型匹配数量的字节（即参数的值），并且移动va_list指向下一个参数。之后不断的调用va_arg()，获得更多的参数的值，直到完成整个参数处理的过程。
 最后调用va_end()来进行清理。
 */


@interface Dog : NSObject

- (NSString *)printName:(NSString *)name,... NS_REQUIRES_NIL_TERMINATION;

- (void)printDog:(NSString *)name,... NS_FORMAT_FUNCTION(1,2);

@end

@implementation Dog


- (void)printDog:(NSString *)name, ...
{
//    va_list args;
//    NSMutableString *resultStr = [[NSMutableString alloc] initWithString:name];
//    va_start(args, name);
//    NSString *nextObj = nil;
//
//    while ((nextObj = va_arg(args, id))) {
//        [resultStr appendString:nextObj];
//
//    }
//    NSLog(@"printDog  resultStr: %@",resultStr);

    if (!name) {
        return;
    }
    va_list argList;
    va_start(argList, name);
    NSString *outStr = [[NSString alloc] initWithFormat:name arguments:argList];
    va_end(argList);
    NSLog(@"------- outStr =  %@",outStr);


}
- (NSString *)printName:(NSString *)name, ...
{

    va_list args;
    NSMutableString *resultStr = [[NSMutableString alloc] initWithString:name];
    va_start(args, name);
    NSString *nextObj = nil;

    while ((nextObj = va_arg(args, id))) {
        [resultStr appendString:nextObj];

    }


    return resultStr;

}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSLog(@"-----  %d",addemUp(1,2,3,4,5,0));

        Dog *dd = [[Dog alloc] init];

        NSLog(@"--- %@",[dd printName:@"helllo--",@"world", nil]);

        [dd printDog:@"%@%@%d",@"haha",@"hehe",2];

    }
    return 0;
}
