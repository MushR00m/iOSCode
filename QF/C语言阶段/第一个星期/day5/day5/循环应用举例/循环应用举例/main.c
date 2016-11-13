//
//  main.c
//  循环应用举例
//
//  Created by qianfeng on 14-7-18.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>

//break;
//用在switch 中跳出switch语句, 执行后面的程序
//用在循环中, 跳出当前循环,只跳出一层循环
//contiue :


/*int main(int argc, const char * argv[])
{
    int i;
    for (i=0; i<10; i++) {
        if (i==5) {
            continue;
        }
        printf("i = %d\n", i);
    }
    return 0;
}*/
//1.求1~100之间的素数(质数)
/*int main(int argc, const char *argv[])
{
    int i,j;
    for (i=1; i<=100; i++) {
        
        for (j=2; j<i; j++) {
            if (i%j==0) {
                break;
            }
        }
        if (!(j==i)) {
            continue;
        }
        
        printf("%d ",i);
    }
    return 0;
}*/

//2.输入一个大写字母，如F
//比如：
//输入:F
//输出：
//A
//ABA
//ABCBA
//ABCDCBA
//ABCDEDCBA
//ABCDEFEDCBA
//
//输入:C
//输出:
//A
//ABA
//ABCBA

/*int main(int argc, const char *argv[])
{
    int i, j;
    char ch;
    scanf("%c", &ch);
    
    for (i=0; i<ch-'A'+1; i++) {
        for (j=0; j<=i; j++) {
            printf("%c",'A'+j);
        }
        for (j=i; j>0; j--) {
            printf("%c", 'A'+j-1);
        }
        printf("\n");
    }

    return 0;
}*/

//
/*int main(int argc, const char *argv[])
{
    char ch;
    int cnt=0;
    //while (scanf("%c",&ch),(ch !='\n'))
    while (ch=getchar(),(ch !='\n'))
    {
        
        if ((ch>='A'&&ch<='Z')||(ch>='a' && ch <= 'z')) {
            cnt++;
        }
    }
    printf("%d\n", cnt);

    return 0;
}*/

//4. 输入年月日, 判断是一年中的第多少天

/*int main(int argc, const char *argv[])
{
    int i;
    int year,month,day;
    int totalday=0;
    int tmp;
    scanf("%d,%d,%d",&year,&month,&day);
    
    for (i=1; i<month; i++) {
        switch (i) {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                tmp=31;
                break;
            case 2:
                if ((year % 4==0 && year%100!=0)||(year%400==0)) {
                    tmp=29;
                }
                else
                    tmp=28;
                break;
            case 4:
            case 6:
            case 9:
            case 11:
                tmp=30;
                break;
            default:
                return -1;
        }
        totalday+=tmp;
    }
    totalday +=day;
    printf("%d\n",totalday);
    return 0;
}*/

//流程控制（for求阶乘的和 ）	输入n(int类型)，打印1！+2！+3！+4！+5！+。。。+n!的值
/*
 比如：
 
 输入：2
 输出：
 3
 
 输入：3
 
 输出:
 */

/*int main(int argc, const char *argv[])
{
    int i;
    int Sn=0;
    int tmp=1;
    int n;
    scanf("%d",&n);
    for (i=1; i<=n; i++) {
        tmp *=i;
        Sn +=tmp;
    }
    printf("%d\n", Sn);
    return 0;
}*/

//7.
//流程控制（数值序列2）	输出数字序列 2/1，3/2，5/3，8/5，13/8，21/13...，输出个数由键盘输入。注意输入使用scanf输入
/*
 比如：
 
 输入 3输出为
 
 2/1
 3/2
 5/3
 
 输入 4 输出为
 2/1
 3/2
 5/3
 8/5
 */

/*int main(int argc, const char *argv[])
{
    int n;
    int i;
    int a=1, b = 1;
    scanf("%d", &n);
    for (i=1; i<=n; i++) {
        printf("%d/%d ",a+b, a);
        int tmp;
        tmp = a+b;
        b = a;
        a=tmp;
    }
    printf("\n");
    return 0;
}*/
//8.
//辗转相除法求最大公约数
//
/*int main(int argc, const char *argv[])
{
    int a, b;
    scanf("%d%d", &a, &b);
    int  tmp;
    while ((tmp=a%b)) {
        //int tmp =a%b;
        a=b;
        b=tmp;
    }
    printf("%d\n",b);
    return 0;
}*/
//9.一球从 100 米高度自由落下,每次落地后反跳回原高度的一半;再落下,求它在第10 次落地时,共经过多少米
/*int main(int argc, const char *argv[])
{
    float s=0.00;
    int i;
    float t=100.00;
    for (i=1; i<10; i++) {
        s+=t;
        t/=2;
    }
    s+=100;
    printf("%f\n",s);
    return 0;
}*/
//3.输入一个大写字符，如F
//比如：
//输入:F
//输出：
//FEDCBA
//EDCBAB
//DCBABC
//CBABCD
//BABCDE
//ABCDEF
//
//输入 B
//输出:
//BA
//AB

//int main(int argc, const char *argv[])
//{
//    char ch;
//    int i, j;
//    scanf("%c", &ch);
//    for (i=0; i<ch-'A'+1; i++) {
//        for (j=i; j<ch-'A'+1; j++) {
//            printf("%c",ch-j);
//        }
//        for (j=0; j<i; j++) {
//            printf("%c",'A'+1+j);
//        }
//        printf("\n");
//    }
//    return 0;
//}
//5.
//流程控制（for循环）	输入一个大写字母，如 F，输出
//\
//比如：
//\
//输入：F
//\
//输出：
//F
//EFE
//DEFED
//CDEFEDC
//BCDEFEDCB
//ABCDEFEDCBA




/*int main(int argc, const char *argv[])
{
    int i;
    int year,month,day;
    int totalday=0;
    int tmp;
    scanf("%d %d %d",&year,&month,&day);
    
    for (i=1; i<month; i++) {
        switch (i) {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                tmp=31;
                break;
            case 2:
                if ((year % 4==0 && year%100!=0)||(year%400==0)) {
                    tmp=29;
                }
                else
                    tmp=28;
                break;
            case 4:
            case 6:
            case 9:
            case 11:
                tmp=30;
                break;
            default:
                return -1;
        }
        totalday+=tmp;
    }
    totalday +=day;
    printf("%d\n",totalday);
    return 0;
}*/


//#include"stdio.h"
//int main(int argc, const char *argv[])
//{
//    char ch;
//    scanf("%c",&ch);
//    for (int i=0; i<=ch-'A'; i++) {
//        int j;
//        for (j=0; j<ch-'A'-i; j++) {
//            printf(" ");
//
//        }
//        for (j=0; j<=i; j++) {
//            printf("%c",'A'+j);
//        }
//        for (j=0; j<i; j++) {
//             printf("%c",'A'+i-j-1);
//        }
//        printf("\n");
//    }
//}
//





int main(int argc, const char *argv[])
{
    int i;
    int year,month,day;
    int totalday=0;
    int tmp;
    scanf("%d %d %d",&year,&month,&day);
    
    for (i=1; i<month; i++) {
        switch (i) {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                tmp=31;
                break;
            case 2:
                if ((year % 4==0 && year%100!=0)||(year%400==0)) {
                    tmp=29;
                }
                else
                    tmp=28;
                break;
            case 4:
            case 6:
            case 9:
            case 11:
                tmp=30;
                break;
            default:
                return -1;
        }
        totalday+=tmp;
    }
    totalday +=day;
    printf("%d\n",totalday);
    return 0;
}










