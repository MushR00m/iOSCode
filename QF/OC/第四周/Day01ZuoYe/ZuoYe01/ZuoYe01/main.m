//
//  main.m
//  ZuoYe01
//
//  Created by bencai on 14-8-4.
//  Copyright (c) 2014年 bencai. All rights reserved.
//
//题目描述
  //1. 创建一辆汽车，属性有速度，编写关于速度的构造方法init和setter方法。

#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, const char * argv[])
{

  @autoreleasepool {
      //创建一辆宝马车
    Car* myBaoMa = [[Car alloc] init];
    NSLog(@"我的宝马的最大时速为：%.2lf km/h",[myBaoMa speed]);
      //调用 set 方法设置最大时速
    [myBaoMa setSpeed:125.00];
    NSLog(@"我的宝马的最大时速为：%.2lf km/h",[myBaoMa speed]);
      //创建一辆奔驰车
    Car* myBenChi = [[Car alloc] initWithSpeed:300.00];
    NSLog(@"我的奔驰的最大时速为：%.2lf km/h",[myBenChi speed]);
      //调用 description 自描述方法，显示某个对象实例的属性信息
    NSLog(@"myBenChi: %@",[myBenChi description]);
    NSLog(@"myBaoMa: %@",myBaoMa);
  }
    return 0;
}

