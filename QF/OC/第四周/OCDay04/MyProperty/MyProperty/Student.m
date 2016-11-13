//
//  Student.m
//  MyProperty
//
//  Created by bencai on 14-8-7.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "Student.h"

@implementation Student
  //OC 2.0版本，@synthesize 可以省略
  //Xcode 4.6之后
  //@synthesize uid=_uid;//实现方法

//-(int)uid
//{
//  return _uid;
//}

-(void)setName:(NSString*)aName
{
  if (_name != aName) {
    _name = aName;
  }
  NSLog(@"_name:%@",_name);
}

-(NSString*)name{
  return _name;
}

@synthesize age=_age;
//-(int)age
//{
//  return _age;
//}
//-(void)setAge:(int)aAge
//{
//  _age = aAge;
//
//}
- (instancetype)initWithUid:(int)aUid
                    andName:(NSString*)aName
                     andAge:(int)aAge
{
  if (self = [super init]) {
    _uid = aUid;
    _name = aName;
    _age = aAge;
  }

  return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"Student学号：%d 姓名：%@ 年龄：%d", _uid,_name,_age];
}


@end
