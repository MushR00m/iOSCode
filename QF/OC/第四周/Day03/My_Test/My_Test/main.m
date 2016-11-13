//
//  main.m
//  My_Test
//
//  Created by bencai on 14-8-6.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArrayTool.h"
#import "MyMutableArray.h"

int main(int argc, const char * argv[])
{

  @autoreleasepool {
      //对象（指针）数组
      //myArray不是对象，他的数据类型是id*
      //它是指向对象（指针）的指针
      //const char *
    id myArray[15] = {@"hello",@"world",@"city",@"hello",@"1234",@"operate",@"thank you"};
      //char* PtrArray[3] = {"HELLO","EVE",NULL};
      //PtrArray 本身是char**类型；
      //char* []类型
         //NSMutableArray* dArray = [NSMutableArray arrayWithObjects:@"ni",@"wo",@"ta", nil];
    NSMutableArray* eArray = [NSMutableArray arrayWithObjects:(myArray) count:3];
      //NSMutableArray* aArray = [NSMutableArray arrayWithArray:bArray];
      //可变数组对象，是一个对象，该对象内部集合了一些对象
    NSMutableArray* cArray = [NSMutableArray arrayWithObjects:myArray  count:7];
    
    NSLog(@"%@",[cArray objectAtIndex:2]);
    
    for (int i = 0; i<[eArray count]; i++) {
      NSLog(@"%@",[eArray objectAtIndex:i]);
    }
    
    NSArray* bArray = [NSArray arrayWithArray:cArray];
//    for (int i = 0; i<[bArray count]; i++) {
//      NSLog(@"%@",[bArray objectAtIndex:i]);
//    }
    [ArrayTool showArray:bArray];
    [ArrayTool showMutableArray:cArray];
    
    NSLog(@"%lu",[cArray indexOfObject:@"city"]);
    [ArrayTool hasObject:@"world" inArray:cArray];
    
    NSLog(@"%@",[cArray componentsJoinedByString:@"__"]);
    [cArray removeObject:@"hello" inRange:NSMakeRange(0, [cArray count])];
    [ArrayTool showMutableArray:cArray];
//    3.9.4 替换指定索引的元素
//    - (void)replaceObjectAtIndex:(NSUInteger)index
//  withObject:(id)anObject;
    [cArray replaceObjectAtIndex:1 withObject:@"Tom Love"];
    [ArrayTool showMutableArray:cArray];
    [cArray exchangeObjectAtIndex:0 withObjectAtIndex:1];
    [ArrayTool showMutableArray:cArray];
    
      //--比较方法测试
    [MyMutableArray testSortWithArray:cArray];
    
  }
    return 0;
}

