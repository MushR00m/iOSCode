//
//  main.c
//  简单项目
//
//  Created by qianfeng on 14-7-18.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
#include "culator.h"

//递归: 一个函数调用它自己,我们称为递归调用
//
//
/*int main(int argc, const char * argv[])
{
    printf("%d\n",add(12, 13));
    printf("%d\n",divi(20, 10));
    printf("%d\n",mul(10, 20));
    printf("%d\n",sub(50, 21));
    printf("%d\n",func());
    printf("number = %d\n",number = 100);
    return 0;
}*/

//求n!
long long factoral(int n)
{
    if (n==1) {
        return 1;
    }
    else
    {
        return n*factoral(n-1);
    }
}

//
//int main(int argc, const char *argv[])
//{
//    printf("%lld\n" , factoral(10));
//    
//    return 0;
//}
//1、斐波那契数列
//1 1 2 3 5 8 13 21 34 55 89 144 ....

int fabonaci(int n)
{
    if (n==1 || n==0) {
        return 1;
    }
    else
    {
        return fabonaci(n-1)+fabonaci(n-2);
    }
}

//int main(int argc, const char *argv[])
//{
//    for (int i= 0; i< 20; i++) {
//        printf("%d ",fabonaci(i));
//    }
//    printf("\n");
//    return 0;
//}

int Euclid(int a, int b)
{
    if (a%b==0) {
        return b;
    }
    else
    {
        return Euclid(b, a%b);
    }
}

//int main(int argc, const char *argv[])
//{
//    printf("%d\n",Euclid(12,24));
//    
//    return 0;
//}

//3、趣味问题——年龄。有5个人坐在一起，问第五个人多少岁？他说比第4个人大2岁。问第4个人岁数，他说比第3个人大2岁。问第三个人，又说比第2人大两岁。问第2个人，说比第一个人大两岁。最后问第一个人，他说是10岁。请问第五个人多大？用递归算法实现。

int age(int n)
{
    if (n==1) {
        return 10;
    }
    else{
        return age(n-1)+2;
    }
}

int main(int argc, const char *argv[])
{
    printf("%d\n", age(5));
    return 0;
}