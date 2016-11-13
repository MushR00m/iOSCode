//
//  main.m
//  Personal
//
//  Created by bencai on 14-8-4.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>
  //导入类的头文件
#import "BenPerson.h"

int main(int argc, const char * argv[])
{

  @autoreleasepool {
      //用类作为模板来创建对象
      //对象的数据类型是指针类型，并且它是指向堆空间的指针类型
      //OC中，所有对象，都用指针来引用
    BenPerson* xiaoLi = [[BenPerson alloc] initWithNumber:23 andName:@"小李" andAge:38];
      //NSLog(@"xiaoLi对象的自描述信息为：%@",[xiaoLi description]);
      NSLog(@"xiaoLi对象的自描述信息为：%@",xiaoLi);
      //写入 xiaoLi的属性信息
      //在 OC中必须通过方法，对对象属性进行操作，以便保护对象的封装性
      //[xiaoLi setName:@"小李"];
      //方法调用，又称为发送消息，对象接受消息
//    [xiaoLi setAge:28];
//    [xiaoLi setNumber:13];
//[xiaoLi initWithNumber:23 andName:@"小李" andAge:18];
    NSLog(@"xiaoLi name:%@",[xiaoLi name]);
    NSLog(@"xiaoLi age:%d",[xiaoLi age]);
    NSLog(@"xiaoLi number:%d",[xiaoLi number]);
    BenPerson* Guo=[[BenPerson alloc] init];
    [Guo setNumber:10];
    [Guo setName:@"郭阳阳"];
    [Guo setAge:24];
    
    NSLog(@"姓名:%@ 学号:%d 年龄：%d",[Guo name],[Guo number],[Guo age]);
    
  }
    return 0;
}
