//
//  main.m
//  MyNSNumber
//
//  Created by bencai on 14-8-6.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    NSNumber* aNumber = [[NSNumber alloc] initWithChar:'S'];
    NSLog(@"%@",aNumber);
    NSNumber* bNumber = [NSNumber numberWithChar:'s'];
    NSLog(@"%@",bNumber);
      //布尔类型是 OC 语言提供一种基础类型，不是对象，所以我们在放入 OC 数组之前，要将其封装为 NSNumber 对象。
    NSNumber* cNumber = [[NSNumber alloc] initWithBool:YES];
    NSLog(@"%@",cNumber);
    NSNumber* dNumber = [NSNumber numberWithBool:NO];
    NSLog(@"%@",dNumber);

    
  }
    return 0;
}

