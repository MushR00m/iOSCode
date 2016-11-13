//
//  File.c
//  内存管理
//
//  Created by qianfeng on 14-7-28.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>

static int num=100;


static int add(int a, int b)
{
    return a+b;
}

void print_a(void)
{
    static int a=100;
    
    for (int i=0; i<10; i++) {
        a++;
    }
    printf("%d\n" ,a);
}
void  func1(void)
{
    num = 200;
    printf("%d\n",num);
}
void  func2(void)
{
    num = 300;
    printf("%d\n",num);
}

void func3(int a, int b)
{
    printf("%d\n",add(a, b));
}