//
//  main.c
//  C第一周测试
//
//  Created by qianfeng on 14-3-21.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#include <stdio.h>

//简答题:

//题目1(10分)：
//我们1406班目前总共有47人，请写出他的2、8、16进制表示形式；以及47和-47的原反补码!(需要有计算过程)

//题目2(10分)：
//小明是个刚入职的程序员，但是对++a与a++分不清楚，请举例来帮助小明。
printf("%d %d",a++,++a);
//题目3(10分):
//int a = 88, b= 23 ,c = 35, d = 68 ;
// int k = a > b ? a : c > d ? c : d
//计算k的值？

//题目3(5分):
//你是如何看待苹果这个公司的,以及iOS发展未来趋势的。

//题目4(5分):
//说说你所知道的面向对象编程和面向过程编程。。。


//编程题 :

//题目1(10分):有红白黑三色的球若干个,从中拿出三个球,编写程序计算出三个球不同色的排列有多少种,并打印出每种排列.
#if 0
void test(int num)
{
    switch(num)
    {
        case 0:
            printf("RED ");
            break;
        case 1:
            printf("WHITE ");
            break;
        case 2:
            printf("BLACK ");
            break;
    }
}

int main()
{
    for(int i = 0; i <3;i++)
    {
        for(int j = 0; j <3; j++)
        {
            if( i != j)
            {
                for(int k = 0; k <3; k++)
                {
                    if(k != j && i != k )
                    {
                        test(i);
                        test(j);
                        test(k);
                        printf("\n");
                    }
                }
            }
        }
    }
}
#endif
//题目2(10分):已知abc+cba = 1333,其中a,b,c均为一位数,例如617+716=1333,编程求出符合这一规律的a,b,c,并输出结果.
#if 0
int main()
{
    int num1,num2;
    for(int a = 1; a<=9 ; a++)
    {
        for(int b = 0;b <= 9; b++)
        {
            for(int c = 1; c<=9; c++)
            {
                num1 = a*100+b*10+c;
                num2 = c*100+b*10+a;
                if(num1+num2 == 1333)
                {
                    printf("a = %d\nb = %d\nc = %d\n",a,b,c);
                }
            }
        }
    }
}

#endif





//题目3(10分):输入一个正整数num以及该数的位数n，返回这个数字逆序后的数!(逆序部分用函数封装);
#if 0
int test(int num,int m)
{
    int temp = 0;
    int number = 0;
    for(int i = 0;i<m;i++)
    {
        temp = num%10;
        number = number*10+temp;
        num = num/10;
        if(num == 0)
        {
            break;
        }
    }
    return number;
}

int main()
{
    int num,m;
    int number;
    scanf("%d %d",&m,&num);
    number = test(num,m);
    printf("number = %d\n",number);
}
#endif


//题目4(20分):输入一个大写字母，如 F，输出
//     F
//    EFE
//   DEFED
//  CDEFEDC
// BCDEFEDCB
//ABCDEFEDCBA
// BCDEFEDCB
//  CDEFEDC
//   DEFED
//    EFE
//     F

//注：此题打印上半个三角10分,打印全部正确20分
//     F
//    EFE
//   DEFED
//  CDEFEDC
// BCDEFEDCB
//ABCDEFEDCBA

int main()
{
    for(int i=0;i <= 'F'-'A'; i++)
    {
        for(int j = 'F'-'A'-i; j > 0; j--)
        {
            printf(" ");
        }
//        for(int k = 'F'-i;k<'F';k++)
//        {
//            printf("%c",k);
//        }
//        for(int n = 'F';n >= 'F' - i; n--)
//        {
//            printf("%c",n);
//        }
        for(int k = -i; k <= i; k++)
        {
            printf("%c",'F'+k < 'F'?'F'+k:'F'-k);
        }
        
        printf("\n");
    }
}







//题目5(5分):
//不是用临时变量交换两个数的值,并说出这样做有没有缺陷
//例如 交换前：  int a = 5 ;
//             int b = 6 ;
//
//    交换后    a == 6
//             b == 5
a = a+b;
b=a-b;
a = a-b;


a = b;
b =a;



//题目6(5分):输入一个数字(整数),编程打印其出其二进制的的原码,反码,补码;
//例如: 输入：-100
//     输出：
//     原码：11100100,
//     反码：10011011,
//     补码: 10011100


//int main(int argc, const char * argv[])
//{
//
//    // insert code here...
//    printf("Hello, World!\n");
//    return 0;
//}

