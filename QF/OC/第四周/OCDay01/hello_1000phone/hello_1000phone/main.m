//
//  main.m
//  hello_1000phone
//
//  Created by bencai on 14-8-4.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

  //相当于#include，但比其更加智能，避免头文件的重复包含
#import <Foundation/Foundation.h>
  //#import "<#header#>"

int main(int argc, const char * argv[])
{
    //oc语言的关键词以@符号开头，@符号读作at for
  @autoreleasepool {
    NSString* myName = @"Bencai";
      //NS,NEXTSTEP,Cocoa开发环境
      // insert code here...
      //NSLog的输出，在程序的后台，对应于前台，在 iOS 中 UI界面是前台，Command Line Interface是后台
      NSLog(@"Hello, World!");
    NSLog(@"Hello, %@,%@.",myName,@"张三");
    NSLog(@"Hello, %s.","Bencai");
    
  }
    return 0;
}

