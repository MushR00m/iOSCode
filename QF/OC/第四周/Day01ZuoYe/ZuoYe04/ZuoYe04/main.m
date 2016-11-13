//
//  main.m
//  ZuoYe04
//
//  Created by bencai on 14-8-4.
//  Copyright (c) 2014年 bencai. All rights reserved.
//
//题目描述
//4. 创建一个定期银行账户的类
//属性:
//账户号码
//密码（加密）
//存储金额
//存储年限
//方法:
//构造方法
//设置，账户号码，密码
//存款
//设置年限
//取款



#import <Foundation/Foundation.h>
#import "Account.h"

int main(int argc, const char * argv[])
{

  @autoreleasepool {
      //类方法测试
    [Account testAccount];
      //对象方法调用测试
    Account* woAccount = [[Account alloc] initWithUid:1 andPasswd:654321 andAmount:100.00 andYears:2];
    
    NSLog(@"我的账户信息：%@",woAccount);
    [woAccount deposit:50.00];
    NSLog(@"我的账户信息：%@",woAccount);
    [woAccount withdrawing:150.00];
    NSLog(@"我的账户信息：%@",woAccount);
  }
    return 0;
}

