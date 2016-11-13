//
//  Account.h
//  MyBank
//
//  Created by bencai on 14-8-13.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>
#define RATE 0.0325
@interface Account : NSObject{
  NSUInteger _uid;//用户账号
  NSString* _upasswd;//用户密码
  double _uamount;//账户余额
  double _uperiod;//储蓄时间
  double _rate;//一年期的存款利率
}
@property (assign,nonatomic) NSUInteger uid;
@property (copy,nonatomic) NSString* upasswd;
@property (assign,nonatomic) double uamount;
@property (assign,nonatomic) double uperiod;
@property (assign,nonatomic) double rate;
- (void)deposit:(double)money;//存款
- (double)withdraw:(double)money;//提款
- (double)settlementOnWithdraw:(double)money;//取款时结算利息
- (double)settlementUponYear;//年度结算利息
- (double)interestCaculate;//利息计算
- (double)incomeCaculate;//到期本息收益
+ (void)testBySelf;//本类的自测方法
- (id)initWithUid:(NSUInteger)aUid andUpasswd:(NSString*)aUpasswd andUamount:(double)aUamount;

@end
