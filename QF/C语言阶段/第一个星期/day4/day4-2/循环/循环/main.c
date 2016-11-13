//
//  main.c
//  循环
//
//  Created by qianfeng on 14-7-17.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>

//goto
//标号 + :
//通常配合条件语句使用
//只能在同一个函数内使用goto 语句

//void func(void)
//{
//lable:
//    printf("hello world\n");
//
//}


/*int main(int argc, const char * argv[])
{
    int a;
    scanf("%d", &a);
dece:
    printf("hello world\n");
    if (a>10) {
        goto dece;
    }
    
    return 0;
}*/

/*int main(int argc, const char *argv[])
{
    int sum = 0, i=1;
    
number:
    sum+=i;
    i++;
    if (i<=100)
    {
        goto number;
    }
    printf("%d\n", sum);
}*/

/*while(表达式)//判断表达式的值, 表达式的值为真,执行语句体, 为假就不执行
{
    语句体;
}*/

/*int main(int argc, const char *argv[])
{
    int i=1, sum=0;
    while (i<=100) {
        sum += i;
        i++;
    }
    printf("%d\n", sum);
}*/

/*int main(int argc, const char *argv[])
{
    int cnt = 0;
    while (getchar() != '\n') {
        cnt++;
    }
    printf("%d\n", cnt);

    return 0;
}*/

/*do{
    语句块;

}while();*/

/*int main(int argc, const char *argv[])
{
    int sum=0, i =1;
    do{
        if (i%2) {
            sum += i;
        }
        i++;
    }while (i<=100);
    printf("%d\n", sum);
    return 0;
}*/

//int main(int argc, const char *argv[])
//{
//    int i = 0;
//    while (i< 10) {
//        printf("i=%d hello world\n", i);
//        i++;
//    }
//}

/*int main(int argc, const char *argv[])
{
    int i = 0;
    do{
        printf("i = %d hello world\n", i);
        //i++;
    }while (i++<10);
    return 0;
}*/

/*
    for(表达式1;表达式2;表达式3)
    {
        语句块;
    }
 */

/*int main(int argc, const char *argv[])
{
    int i;
    for (i=0; i<10; i++)
    {
        printf("i = %d hello world\n", i);
    }
    return 0;
}*/
/*int main(int argc, const char *argv[])
{
    int i =0;
    for (; i<10; i++) {
 
 
        printf("hello world\n");
    }

    return 0;
}*/
//循环中用break跳出一层循环
/*int main(int argc, const char *argv[])
{
    int i= 0;
    
    for (; ; i++) {
        if (i<10) {
            printf("hello world\n");
        }
        else
            break;
    }
    return 0;
}*/

/*int main(int argc, const char *argv[])
{
    int i= 0;
    for (; ; ) {
        if (i<10) {
            printf("hello world\n");
        }
        else
            break;
        i++;
    }

    return 0;
}*/

/*int main(int argc ,const char *argv[])
{
    int a;
    int i;
    scanf("%d", &a);
    printf("%d=", a);
    for (i=2; a!=1; i++) {
        if (a%i==0) {
            printf("%d ", i);
            a/=i;
            i--;
        }
    }
    return 0;
}*/

/*int main(int argc, const char *argv[])
{
    int i, j;
    for (i = 0; i<6; i++) {
        for (j= 0; j<20; j++) {
            printf("*");
        }
        printf("\n");
    }

    return 0;
}*/

/*int main(int argc, const char *argv[])
{
    int i, j;
    for (i=1; i<=9; i++) {
        for (j=1; j<=i; j++) {
            printf("%d*%d=%d ", i,j,i*j);
        }
        printf("\n");
    }
    return 0;
}*/

int main(int argc, const char *argv[])
{
    int i, j;
    for (i= 1; i<=4; i++) {
        for (j=1; j<=5; j++) {
            printf("%d   ", i*j);
        }
        printf("\n");
    }
    return 0;
}



