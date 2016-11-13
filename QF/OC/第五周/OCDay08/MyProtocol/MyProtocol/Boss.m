//
//  Boss.m
//  MyProtocol
//
//  Created by bencai on 14-8-13.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "Boss.h"

@implementation Boss
+ (void)testProgrammer:(Student*) aDaNa{
    //Boss* aBoss = [[Boss alloc] init];
    //[aBoss code];
  [aDaNa code];
  [aDaNa writeDocument];
  [aDaNa debug];
    //调用协议声明的可选方法前，必须检查该可选方法有没被实现
  if ([aDaNa respondsToSelector:@selector(report)]) {
      [aDaNa report];
      //[aDaNa performSelector:@selector(report)];
  }
  
  
    //return;
}

@end
