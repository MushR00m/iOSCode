//
//  Person.m
//  MyDerived
//
//  Created by bencai on 14-8-8.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "Person.h"

@interface Person(){
  NSUInteger _passPortCode;
}
@property (assign,nonatomic) NSUInteger passPortCode;
- (void)song:(NSString*)aSong;
- (void)song:(NSString*)aSong withPassPortCode:(NSUInteger)aCode;


@end


@implementation Person
  //@synthesize name=_name;
//-(NSString*)name{
//  return _name;
//}
- (void)laugh{
  NSLog(@"Ha,Ha,Ha!");
}
  //在 Person 类中 重写了其父类 NSObject类中的 init 方法//重写是一种多态的表现
- (instancetype)init{

  return [self initWithName:@"MouMou" andAge:0 andSex:YES];
}

- (instancetype)initWithName:(NSString*)aName
                      andAge:(int)aAge
                      andSex:(BOOL)aSex
{
  if (self = [super init]) {
    _name = aName;
    _age = aAge;
    _sex = aSex;
  }
  
  return self;
}
- (NSString *)description
{
  return [NSString stringWithFormat:@"姓名：%@,年龄：%d，性别：%@", _name,_age,_sex?@"男":@"女"];
}
+ (void) test{
    //Person* aPerson = [[Person alloc]init];
    //
}


- (void)song:(NSString*)aSong{
  NSLog(@"sing %@",aSong);
}
- (void)song:(NSString*)aSong withPassPortCode:(NSUInteger)aCode{
  _passPortCode = aCode;
  NSLog(@"sing %@ With %lu",aSong,_passPortCode);

}
- (void)showPassPort{
  NSLog(@"PassPortCode:%lu",_passPortCode);
}

@end
