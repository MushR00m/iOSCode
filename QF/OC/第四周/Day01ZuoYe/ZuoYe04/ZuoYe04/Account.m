//
//  Account.m
//  ZuoYe04
//
//  Created by bencai on 14-8-4.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "Account.h"

@implementation Account
  //类的测试方法，常常用于演示和检测方法实现的正确性
+ (void)testAccount{
  Account* myAccount = [[Account alloc] init];
    //className方法也是 遗传于NSObject的隐式方法，
    //用于返回对象的类名
  NSLog(@"该对象的类名：%@",[myAccount className]);
  NSLog(@"该对象的自描述信息：%@",myAccount);
  
}
  //description自描述方法
- (NSString *)description
{
  return [NSString stringWithFormat:@"uid:%i, passwd:%s, amount:%.2Lf, years:%i", _uid,"******",_amount,_years];
}

  //构造方法
- (id)init{
  return [self initWithUid:0 andPasswd:123456 andAmount:0.0 andYears:1];
}

- (id)initWithUid:(int)aUid
        andPasswd:(long)aPasswd
        andAmount:(long double)aAmount
         andYears:(short)aYears
{
  if (self = [super init]) {
    _uid = aUid;
    _passwd = aPasswd;
    _amount = aAmount;
    _years = aYears;
  }
  
  return self;
}
  //_uid的 setter 和 getter 方法
//- (void)setUid:(int)aUid{
//  _uid = aUid;
//}
- (int)uid{
  return _uid;
}
  //_passwd的 setter 和 getter 方法
- (void)setPasswd:(long)aPasswd{
  _passwd = aPasswd;
}
- (long)passwd{
  return _passwd;
}
  //_amount的 setter 和 getter 方法
- (void)setAmount:(long double)aAmount{
  _amount = aAmount;
}
- (long double)amount{
  return _amount;
}
  //_years的 setter 和 getter 方法
- (void)setYears:(short)aYears{
  _years = aYears;
}
- (short)years{
  return _years;
}
  //存款deposit
- (void)deposit:(double)money{
  _amount += money;
}
  //取款withdrawing
- (void)withdrawing:(double)money{
  _amount -= money;
}


@end
