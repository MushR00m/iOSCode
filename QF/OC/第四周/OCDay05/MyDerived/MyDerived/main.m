//
//  main.m
//  MyDerived
//
//  Created by bencai on 14-8-8.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>
  //#import "Person.h"
#import "Female.h"
#import "Male.h"
#import "Person+Print.h"

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    Person* aBaby = [[Person alloc] init];
    
    [aBaby Print];
      //[aBaby song:@"wo xin yong heng"];
    
    Female* aGirl = [[Female alloc] init];
    Male* aBoy = [[Male alloc] init];
    
    Female* bGirl = [[Female alloc] initWithLongHair:@"波浪型长发" andWenRou:NO];
    Male* bBoy = [[Male alloc] initWithHuZi:@"山羊胡" andHouJie:YES];
    
      //Female* cGirl = [[Female alloc]init];
    Female* cGirl = [[Female alloc]initWithName:@"小红" andAge:28 andSex:NO];
    cGirl.longHair = @"小清新型";
    cGirl.wenRou = YES;
      //Male* cBoy = [[Male alloc] init];
    Male* cBoy = [[Male alloc] initWithName:@"小明" andAge:29 andSex:YES];
    cBoy.huZi = @"山羊胡子";
      //cBoy.houJie = YES;//readonly
      //laugh方法是父类中实现的方法，任何继承于其的子类都能直接调用。
    [aGirl laugh];
    [aBoy laugh];
      //saJiao方法是Female子类中实现的方法，只有 Female 实例对象能调用。
    [aGirl saJiao];
      //[aBoy saJiao];
    [aBoy paoNiu];
      //description 方法实现了多态，是因为子类重写了父类的方法，将父类的同名方法进行了覆盖。
    NSLog(@"%@",[aBaby description]);
    NSLog(@"%@",[aGirl description]);
    NSLog(@"%@",aBoy);
    NSLog(@"%@",bGirl);
    NSLog(@"%@",bBoy);
    NSLog(@"%@",cGirl);
    NSLog(@"%@",cBoy);
      //reset name//failure because of readonly name
      //cGirl.name = @"xiaoHong";
      //cBoy.name = @"xiaoMing";
      //paoNiu
    [cBoy paoNiu];
    [cBoy paoNiu:cGirl];
      //saJiao
    [cGirl saJiao];
    [cGirl saJiao:cBoy];
    
    [Female test];
    [Male test];
    
    [aBaby song:@"BABY BABY" withPassPortCode:88888];
    [aBaby showPassPort];
  }
    return 0;
}

