//
//  MyNumber.h
//  MyNSNumber
//
//  Created by bencai on 14-8-6.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyNumber : NSObject{
  int _fenzi;
  int _fenmu;
}
  //实例方法，只能在对象中使用
- (void)setFenzi:(int)aFenzi;
  //类方法，只能被类模板调用，对象不能使用该方法
+ (void)testMyNumber;

@end






