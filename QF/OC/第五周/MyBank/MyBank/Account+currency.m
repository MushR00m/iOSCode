//
//  Account+currency.m
//  MyBank
//
//  Created by bencai on 14-8-14.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "Account+currency.h"
#import "Account_dollar.h"

@implementation Account (currency)
  //外币存款方法
- (void)deposit:(double)money withForeignCurrency:(char)type//存款
{
  double fa = self.foreign_amount;
  fa += money;
  self.foreign_amount = fa;
  NSLog(@"存款后的当前外币(%c)账户余额：%.2lf",type,self.foreign_amount);
}
  //外币取款方法有 bug，请自行修改正确！！！
- (double)withdraw:(double)money withForeignCurrency:(char)type//提款
{
  self.foreign_amount += [self settlementOnWithdraw:self.foreign_amount];
  self.foreign_amount -= money;
  NSLog(@"取款后的当前外币(%c)账户余额：%.2lf",type,self.foreign_amount);
  return self.foreign_amount;
}


@end
