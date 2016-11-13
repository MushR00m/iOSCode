//
//  main.m
//  MyDelegate
//
//  Created by bencai on 14-8-13.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
#import "Cat.h"

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    
    NSString* path = @"/Users/bencai/Desktop/myDelegate.archive";
      //人是委托方
  Person* xiaoXin = [[Person alloc]initWithName:@"小新" andAge:10];
    NSLog(@"%@",xiaoXin);
    
      //狗是代理方
  Dog* xiaoBai = [[Dog alloc]initWithName:@"小白"];
    NSLog(@"%@",xiaoBai);
    [NSKeyedArchiver archiveRootObject:xiaoBai toFile:path];
    
    Dog* aDog = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"aDog:%@",aDog);
 
      //创建一只猫
    Cat* tomCat = [[Cat alloc]initWithName:@"汤姆猫"];
    
      //建立人和狗之间的委托关系
      //xiaoXin.myDog = aDog;
      //xiaoXin.delegate = xiaoBai;
      //建立人和猫之间的委托关系
    xiaoXin.delegate = tomCat;
    xiaoXin.count = 5;
      //实现委托事件的运行
    [xiaoXin doBark];
    
    [NSKeyedArchiver archiveRootObject:xiaoXin toFile:path];
    
    Person* aPerson = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    NSLog(@"xiaoXin:%@",xiaoXin);
    NSLog(@"aPerson:%@",aPerson);
    
  }
    return 0;
}

