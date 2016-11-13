//
//  main.c
//  运算符
//
//  Created by qianfeng on 14-7-16.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
//运算符   算术运算符   关系运算符    逻辑运算符    位操作运算符    赋值运算符   条件运算符    逗号运算符    指针运算符  求字节运算符(sizeof)   特殊运算符
//算术运算符:
//+ - * / %(取模)
//自增自减: ++ --
//关系运算符: > >= == <= !=
//逻辑运算符: && || !
//三目运算符: ? :
//赋值运算符: = +=  -= *= /= %=
//取地址符: &
//逗号运算符:,

//表达式: 由常量 变量 以及运算符组成的式子
//单个的常量变量也是表达式
//如: a+b a*b    (a+b,a*b)  a&&b  a>b !a
//a+b;//表达式语句

//+ - * / %(取模)
/*int main(int argc, const char * argv[])
{
    int a, b,c;
    a = 10;
    b = 20;
    printf("a+b == %d\n", c=a+b);
    printf("a/b == %d\n", a/b);
    printf("a*b == %d\n", a*b);
    printf("a-b == %d\n", a-b);
    printf("a%%b == %d\n", a%b);//第一个%表示转义
    return 0;
}*/

//自增自减: ++ --
/*int main(int argc, const char *argv[])
{
    int a, b, c, d;
    a = 10;
    b = 1;
    c = 5;
    d = 20;
    printf("a = %d\n", a++);//a++ <=> a+=1 a=a+1
    printf("a = %d\n", a);
    printf("b = %d\n", ++b);
    printf("b = %d\n", b);
    printf("c = %d\n", c--);
    printf("c = %d\n", c);
    printf("d = %d\n", --d);
    printf("d = %d\n", d);
    return 0;
}*/

/*int main(int argc, const char *argv[])
{
    int a= 20;
    printf("%d %d %d %d\n", a++, a--, ++a, --a);//a的值是未定义的
    return 0;
}*/
//关系运算符: > >= == <= !=
//表达式成立, 值为1, 表达式不成立, 值为0
/*int main(int argc, const char *argv[])
{
    int a= 20;
    int b= 20;
    printf("(a>b) == %d\n", a>b);//0 表达式不成立, 表达式的值为假
    printf("(a<b) == %d\n", a<b);//1 表示表达式为真
    printf("(a==b) == %d\n", a==b);
    printf("(a>=b) == %d\n", a>=b);
    printf("(a<=b) == %d\n", a<=b);

    return 0;
}*/
//逻辑运算符: && || !

//  真值表
//   表达式1   表达式2  ...表达式n   表达式
//    假         假               假
//    真         假                假
//    假         真               假
//    真         真                真
// 有一个表达式为假, 则整个表达式的值为假

/*int main(int argc, const char *argv[])
{
    int a,b, c, d;
    a= 30 ;
    b = 20;
    c =50;
    d = 40;
    printf("%d\n", (a>b)&&(c>d));
    
    return 0;
}*/

// ||
//   表达式1   表达式2,.... 表达式N   表达式
//    假         假                   假
//    真         假                   真
//    假         真                   真
//     真        真                   真
// 有一个表达式为真, 则整个表达式的值为真

/*int main(int argc, const char *argv[])
{
    int a, b, c,d;
    a= 50 ; b= 20 ;c = 60 ;d = 40;
    printf("%d\n", (a>b)||(c>d));
    return 0;
}*/

//!
// 表达式1         表达式
//  真               假
//  假               真

/*int main(int argc, const char *argv[])
{
    int a = 0;
    printf("%d\n", !a);
    
    return 0;
}*/
//三目运算符: ? :
//表达式1? 表达式2: 表达式3
//表达式1的值为真,则整个表达式的值为表达式2的值
//表达式1的值为假,则整个表达式的值为表达式3的值

/*int main(int argc, const char *argv[])
{
    int a , b, c;
    a = 10;
    b = 20;
    c = 30;
    printf("%d\n", a<b? a: b);
    printf("%d\n", a>b? a : b>c? b:c);//右结合性
    printf("%d\n", a>b? a :(b>c?b :c));
}*/

//赋值运算符: = +=  -= *= /= %=
/*int main(int argc, const char *argv[])
{
    int a;
    a = 10;
    printf("%d\n", a+=10);// a= a+10  20
    
    printf("%d\n", a-=10);// a= a-10   10
    
    printf("%d\n", a*=10);// a = a*10  100
    
    printf("%d\n", a/=10);// a = a/10   10
    printf("%d\n", a%=10);// a = a%10   0
    return 0;
}*/

//取地址符: &
//逗号运算符:,
//表达式1,表达式2,表达式3,表达式4,.......,表达式n
//表达式N的值为表达式的值

/*int main(int argc, const char *argv[])
{
    int a, b, c;
    printf("%d", (a=10,b=20,c=30));

    return 0;
}*/

//运算符优先级
//括号>单目运算符>算术运算符>关系运算符>逻辑运算符>三目运算符>赋值运算符>逗号运算符
//* / % > + -
//&& > ||
//加括号能够改变优先级

/*int main(int argc, const char *argv[])
{
    int a, b,c,d;
    a = 10;
    b = 20;
    c = 30;
    d = 40;
    printf("%d\n", a+b*c/d);

    return 0;
}*/

// 短整型向长整形看齐
// 整形向浮点型看齐
// 单精度向双精度看齐
//
//int main(int argc, const char *arv[])
//{
//    char a = 0x12;
//    short c = 0x13;
//    long  d = 0x78;
//    
//    int b = 0x00000087;
//    printf("%d\n",a+b);//隐式转换
//    printf("%d\n",a+c);
//    printf("%ld\n", a+d);
//    return 0;
//}
//位扩展
//对于正数高位补0 对于负数 高位补1

// 1111 1111 1111 1111 1111 1111 1001 0010
//+0000 0000 0000 0000 0000 0000 1000 0111
//

/*int main(int argc, const char *argv[])
{
    int a= 20;
    float  f= 3.14;
    double f1 = 4.345673456;
    printf("%d\n",(int)(a+f));//强制转换
    printf("%f\n",a+f);
    printf("%f\n", f+f1);
    return 0;
}*/
//http://192.168.88.73/1408
//
//int a= 511    0x1ff
// char b =a; b = 0xff = -1
//
// float a = 3.14
// int b = (int)a%2;
