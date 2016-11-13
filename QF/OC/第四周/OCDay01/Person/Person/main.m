//
//  main.m
//  Person
//
//  Created by bencai on 14-8-4.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>
  //类的声明
@interface Person : NSObject{
    NSString* nsName;
    //char* name;
    int age;
}
  //'-'号开始的方法是实例方法；'+'号开始的方法是类方法
- (void)setAge:(int)_age;

@end


  //类的实现
@implementation Person

- (void)setAge:(int)_age
{
  age = _age;
}

@end


int main(int argc, const char * argv[])
{

  @autoreleasepool {
      //类的使用
    Person* zhangfei = [[Person alloc] init];
    [zhangfei setAge:21];

  }
    return 0;
}

