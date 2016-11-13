//
//  Account.m
//  MyBank
//
//  Created by bencai on 14-8-13.
//  Copyright (c) 2014年 bencai. All rights reserved.
//
//1. 创建一个双币（人民币和美元）定期银行储蓄账户的类
//属性:
//账户号码
//密码（保密，不明码显示）
//账户余额
//储蓄时间（已经存了几年，可以0.5年）
//存款利率（一年期）
//扩展属性：币种，外币余额，外币利率（一年期）
//方法:
//构造方法；
//账户号码，密码，年限，币种，利率的属性读写方法
//双币存款
//双币取款
//取款结息（取款时结算清本息，结清之后的账户余额重新作为下一期的本金）；
//年度结息（满一年结算本息一次，结清之后的账户余额重新作为下一期的本金）；
//利息计算（计算方法：储蓄时间/1年 >1的，年度结算时本金+1年期利息，作为下一周期的本金）
//到期本息计算


#import "Account.h"
#import "Account+currency.h"
  //#include "Account_dollar.h"

@implementation Account
@synthesize uid=_uid;
@synthesize uamount=_uamount;
@synthesize upasswd=_upasswd;
@synthesize rate=_rate;
@synthesize uperiod=_uperiod;

- (void)deposit:(double)money{
  _uamount += money;
  NSLog(@"存款后的当前账户余额：%.2lf",_uamount);
}

- (double)withdraw:(double)money{
  _uamount += [self settlementOnWithdraw:_uamount];
  _uamount -= money;
  NSLog(@"取款后的当前账户余额：%.2lf",_uamount);
  return _uamount;
}
- (double)settlementOnWithdraw:(double)money//取款时结算利息
{
  double RetMoney = money;
  
  return RetMoney *= (_rate * _uperiod);
}
- (double)settlementUponYear//年度结算利息
{
  
  return _uamount *= (1+_rate);
}
- (double)interestCaculate//到期利息计算
{
  double interest = 0.0;
  
  return interest = _uamount * _rate;
}
- (double)incomeCaculate//到期本息收益
{
  double income = 0.0;

  return income = _uamount*(1+_rate);
}
+ (void)testBySelf//本类的自测方法
{
    //新建一个账户实例
  Account* aAccount = [[Account alloc]init];
    //显示账户初始状态
  NSLog(@"%@",aAccount);
    //存款测试
  [aAccount deposit:100.00];
  NSLog(@"%@",aAccount);
    //模拟的日期间隔
  int n = 36;
  for(int i=1;i<=n;i++){
    aAccount.uperiod = (double)i/(double)365;
  }

    //取款测试
  [aAccount withdraw:50.00];
  NSLog(@"%@",aAccount);
    //模拟存一笔前，并到一年期
  [aAccount deposit:100.00];
    //模拟时间流逝
  for(int i=n;i<=365;i++){
    aAccount.uperiod = (double)i/(double)356;
  }
  [aAccount settlementUponYear];
   NSLog(@"%@",aAccount);
    //外币存款
  aAccount.foreign_amount = 1.0;
  [aAccount deposit:200.00 withForeignCurrency:'$'];
  
}
- (id)initWithUid:(NSUInteger)aUid andUpasswd:(NSString*)aUpasswd andUamount:(double)aUamount{
  if (self = [super init]) {
    _rate = RATE;
    _uperiod = 1/365;
    _uid = aUid;
    _upasswd = aUpasswd;
    _uamount = aUamount;
  }
  
  return self;
}
-(id)init
{
  return [self initWithUid:1 andUpasswd:@"888888" andUamount:1.0];
}
- (NSString *)description
{
  NSString* passwd_des = @"******";
  
  return [NSString stringWithFormat:@"用户账号：%06lu 用户口令：%@ 账户余额：%.2lf（元） 当前定期存款利率（一年期）：%.4lf 存储时间：%.2lf(年)", _uid,passwd_des,_uamount,_rate,_uperiod];
}
@end
