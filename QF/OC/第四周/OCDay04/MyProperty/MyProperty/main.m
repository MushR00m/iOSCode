//
//  main.m
//  MyProperty
//
//  Created by bencai on 14-8-7.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    Student* wo = [[Student alloc] initWithUid:1 andName:@"MouMou" andAge:1000];
      //点语法在没赋值符号的情况下，调用 getter 方法；
      //在有赋值符号的情况下，在该符号的右侧，调用 getter 方法；在该符号的左侧，调用 setter 方法。
    NSLog(@"initial Wo uid:%d name:%@  age:%d",wo.uid,[wo name],[wo age]);
   
    NSLog(@"%@",wo);
      //[wo setName:@"Bencai"];
    wo.name = @"Bencai";
      //wo.sex = 'm';
    NSLog(@"Name:%@",[wo name]);
      //[wo setAge:28];
    wo.age = 28;
    NSLog(@"Age:%d",[wo age]);
    
//    NSLog(@"Wo uid:%d name:%@  age:%d",[wo uid],[wo name],[wo age]);
    NSLog(@"description:%@",wo);
  }
    return 0;
}

