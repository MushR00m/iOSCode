//
//  File.c
//  内存管理
//
//  Created by qianfeng on 14-7-27.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#include <stdio.h>

static int a=100;

static int add(int a, int b)
{
    return a+b;
}

int min(int a, int b)
{
    return a>b? b:a;
}

void print(int a, int b)
{
    printf("%d\n",add(3, 5));
}

void chagevalue(void)
{
    a = 100;
    printf("a=%d\n",a);
}

void func(void)
{
    static int a=100;
    for (int i=0; i<10; i++) {
        a++;
    }
    printf("%d\n", a);
}