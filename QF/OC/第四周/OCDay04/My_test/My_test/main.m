//
//  main.m
//  My_test
//
//  Created by bencai on 14-8-7.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyDictionary.h"

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    MyDictionary* oneDic = [[MyDictionary alloc]initWithDictionaryId:1 andDictionary:[NSDictionary dictionary]];
    
    NSLog(@"%@",oneDic);
  }
    return 0;
}

