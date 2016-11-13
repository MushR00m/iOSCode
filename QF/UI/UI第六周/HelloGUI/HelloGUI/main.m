//
//  main.m
//  HelloGUI
//
//  Created by chen cheng on 14-8-18.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"


int main(int argc, char * argv[])
{
    @autoreleasepool
    {
        /**
         *  1、创建UIApplication类的对象 2、创建AppDelegate类的对象 3、设置UIApplication类的对象的delegate为AppDelegate类的对象。之后当应用程序的状态发生变化的时候、AppDelegate类的对象的相应接口会被回调。4、该函数进行其他初始化后会进入一个无限的消息循环。
         *
         *  @param argc  主函数的命令行参数
         *  @param argv  主函数的命令行参数
         *  @param @"UIApplication" 为应用程序类的类名、如果为nil、等价于@"UIApplication"
         *  @param @"AppDelegate"  应用程序代理类的类名
         *
         *  @return ret、返回值。（一般该函数不会返回）。
         */
        int ret = UIApplicationMain(argc, argv, @"UIApplication", @"AppDelegate");
        
        return ret;
    }
}
