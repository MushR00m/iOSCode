//
//  MyNumber.m
//  MyNSNumber
//
//  Created by bencai on 14-8-6.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "MyNumber.h"

@implementation MyNumber
  //实例方法，只能在对象中使用
- (void)setFenzi:(int)aFenzi
{
    //if (_fenzi != aFenzi) {
    _fenzi = aFenzi;
    //}
}
  //类方法，只能被类模板调用，对象不能使用该方法
+ (void)testMyNumber
{
  MyNumber* a = [[MyNumber alloc]init];
    //_fenzi = 78;
  [a setFenzi:78];

}

@end
