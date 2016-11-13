//
//  Account.h
//  ZuoYe04
//
//  Created by bencai on 14-8-4.
//  Copyright (c) 2014年 bencai. All rights reserved.
//
//属性:
//账户号码
//密码（加密）
//存储金额
//存储年限
//方法:
//构造方法
//设置，账户号码，密码
//设置定期存款年限
//存款
//取款
#import <Foundation/Foundation.h>

@interface Account : NSObject{
  int _uid;//user id
  long _passwd;//user password
  long double _amount;//amount of money
  short _years;
}
  //类的测试方法，常常用于演示和检测方法实现的正确性
+ (void)testAccount;
  //构造方法
  //- (id)init;//隐含声明
- (id)initWithUid:(int)aUid
        andPasswd:(long)aPasswd
        andAmount:(long double)aAmount
         andYears:(short)aYears;
  //_uid的 setter 和 getter 方法
  //- (void)setUid:(int)aUid;//只在初始化时设置
- (int)uid;
  //_passwd的 setter 和 getter 方法
- (void)setPasswd:(long)aPasswd;
- (long)passwd;
  //_amount的 setter 和 getter 方法
- (void)setAmount:(long double)aAmount;
- (long double)amount;
  //_years的 setter 和 getter 方法
- (void)setYears:(short)aYears;
- (short)years;
  //存款deposit
- (void)deposit:(double)money;
  //取款withdrawing
- (void)withdrawing:(double)money;


@end
