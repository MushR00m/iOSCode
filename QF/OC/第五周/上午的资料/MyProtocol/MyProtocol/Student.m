//
//  Student.m
//  MyProtocol
//
//  Created by bencai on 14-8-13.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "Student.h"

@implementation Student
  //非协议规定的本类的方法
- (void) eat{
  NSLog(@"I am enjoying food.");
}
  //协议 QFCoder 中声明的方法
- (void) code{
  NSLog(@"I am coding.");
}
  //协议 QFCoder 中声明的方法
- (void) debug{
  NSLog(@"I am debuging.");
}
  //协议 QFCoder 中声明的方法
- (void) report{
  NSLog(@"I am reporting.");
}
  //协议 QFDocer 中声明的方法
- (void) writeDocument{
  NSLog(@"I am writing a document for my Project.");
}


@end
