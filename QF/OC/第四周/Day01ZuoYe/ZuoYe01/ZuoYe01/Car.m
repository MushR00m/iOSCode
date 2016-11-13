//
//  Car.m
//  ZuoYe01
//
//  Created by bencai on 14-8-4.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "Car.h"

@implementation Car
  //初始化方法
- (id)init{
  return [self initWithSpeed:120.00];
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"该车的最大时速为：%.2lf", _speed];
}

- (id)initWithSpeed:(double)aSpeed{
  if (self = [super init]) {//nil
    _speed = aSpeed;
  }
  
  return self;
}

  //时速的setter方法
- (void)setSpeed:(double)aSpeed{
//  if (_speed != aSpeed) {
//    _speed = aSpeed;
//  }
  _speed = aSpeed;
}

  //时速的getter方法
- (double)speed{

  return _speed;
}

@end
