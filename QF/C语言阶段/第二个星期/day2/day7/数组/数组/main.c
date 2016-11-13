//
//  main.c
//  数组
//
//  Created by qianfeng on 14-7-22.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
//数组定义: int score[100];
//数组下标: 从0开始,score[0],score[1]...score[99];
//a[n], a[0].....a[n-1]
// 数据类型 标示符[常量表达式]
// 1. 数组中的每个元素的类型相同
// 2. 数组的长度必须为常量(长度指的是数组元素个数)
// 3. 数组名必须符合标示符定义
// 4. 数组下标从0开始
// 5. 数组名是一个地址常量,不是变量
// 6. 数组中的每个元素是变量

//数组在内存中占用的大小 = 数据类型长度 * 数组元素个数
//数组访问不能越界操作,

//数组遍历
/*int main(int argc, const char * argv[])
{
    int a[10];
    int i;
    for (i=0; i<10; i++) {
        a[i]=i;
    }
    for (i=0; i<10; i++) {
        printf("a[%d]==%d\n", i,a[i]);
    }
    return 0;
}*/

//int main(int argc, const char *argv[])
//{
//    int n;
//    scanf("%d",&n);//
//    int a[n];//不能这样定义,错误   c99允许这样定义
//}

/*int main(int argc, const char *argv[])
{
    int a[20];
    printf("a==%ld\n", sizeof(a));
    return 0;
}*/

/*int main(int argc, const char *argv[])
{
    int a[5];
    for (int i=0; i<10; i++) {
        a[i]=i;
    }
    for (int i=0; i<10; i++) {
        printf("a[%d]==%d\n", i, a[i]);
    }
    return  0;
}*/

// 倒序操作数组

/*int main(int argc, const char *argv[])
{
    int a[5];
    for (int i = 4; i >=0; i--) {
        scanf("%d",&a[i]);
    }
    for (int i=0; i<5; i++) {
        printf("a[%d]==%d\n", i, a[i]);
    }
    return 0;
}*/

//数组初始化
//完全初始化
//
/*int main(int argc, const char *argv[])
{
    int a[5]={1,2,3,4,5};
    for (int i=0; i<5; i++) {
        printf("a[%d]==%d\n", i, a[i]);
    }
    
    return 0;
}*/

//不完全初始化
/*int main(int argc, const char *argv[])
{
    int a[5]={3,6};
    for (int i=0; i< 5; i++) {
        printf("a[%d]==%d\n",i, a[i]);
    }
    return 0;
}*/

//初始化为0
/*int main(int argc, const char *argv[])
{
    //int a[5]={};
    int a[5]={0};
    for (int i=0; i<5; i++) {
        printf("a[%d]==%d\n", i,a[i]);
    }
    return 0;
}*/


/*int main(int argc, const char *argv[])
{
    int a[]={1,2,3,4,5,6};
    printf("%ld\n",sizeof(a)/sizeof(int));
    
    return 0;
}*/

//求学生的平均成绩
/*int main(int argc, const char *argv[])
{
    int total=0;
    float average;
    int a[10];
    for (int i=0; i<10; i++) {
        scanf("%d",&a[i]);
        total+=a[i];
    }
    average = (float)(total/10);
    printf("average == %.2f\n", average);
    
    return 0;
}*/

//斐波那契数列
//输出斐波那契数列的前20项
// 1 1 2 3 5 8 13 21 34 55 89 ....
// a[n]=a[n-1]+a[n-2]

/*int main(int argc, const char *argv[])
{
    
    int a[20]={1,1};
    for (int i=2; i<20; i++) {
        a[i]=a[i-1]+a[i-2];
    }
    for (int i=0; i<20; i++) {
        printf("%d ",a[i]);
    }

    return 0;
}*/

//输入10个数据, 查找该数据中的最大数,并将其输出到屏幕上
/*int main(int argc, const char *argv[])
{
    int a[10];
    int max;
    for (int i=0; i<10; i++) {
        scanf("%d", &a[i]);
    }
    max = a[0];
    for (int i=1; i<10; i++) {
        if (a[i]>max) {
            max = a[i];
        }
    }
    printf("The max value is : %d \n", max);
    return 0;
}*/

//查找某个数值

/*int main(int argc, const char *argv[])
{
    int a[10]={12,34,56, 67, 78, 65, 43, 32,90,88};
    int n;
    int i=0;
    scanf("%d", &n);
    for (i=0; i<10; i++) {
        if (n==a[i]) {
            break;
        }
    }
    if (i==10) {
        printf("没有该数据\n");
    }
    else
    {
        printf("%d %d\n", i,a[i]);
    }

    return 0;
}*/

/*#define LEN  100

int main(int argc, const char *argv[])
{
    int a[LEN];
    for (int i=0; i<LEN; i++) {
        a[i]=i;
    }
    for (int i=0; i<LEN; i++) {
        printf("%d ", a[i]);
    }
    return 0;
}*/

//字符数组
// char str[100];
// 每个元素占用1个字节的空间
//

/*int main(int argc, const char *argv[])
{
    char str[100];
    scanf("%s",str);
    printf("%s\n", str);
    
    return 0;
}*/

/*int main(int argc, const char *argv[])
{
    char str[5]={'a','b','c','d','e'};
    for (int i=0 ; i<5; i++) {
        printf("%c",str[i]);
    }
    putchar('\n');
    return 0;
}*/
//字符串初始化
/*int main(int argc, const char *argv[])
{
    char str[100]="qianfengjiaoyu";
    printf("%s\n", str);
}*/

/*int main(int argc, const char *argv[])
{
    char str[12]="hello world!";
    //str[12]='\0';
    //printf("%s",str);
    for (int i=0; i<12; i++) {
        printf("%c",str[i]);
    }
    return 0;
}*/

/*int main(int argc, const char *argv[])
{
    int p[8]={11,12,13,14,15,16,17,18};
    int i=0,j=0;
    while(i<7)
    {   printf("i==%d\n",i);
        if(p[i]%2)
        j+=p[i];
        i++;
    }
        printf("%d\n",j);
    return 0;
}*/
/*int main(int argc, const char *argv[])
{
    int p[7]={11,13,14,15,16,17,18},i=1,k=1;
    while(i<7&&p[i]%2)
	{
        k=k+p[i];
        i++;
    }
    printf("%d\n",k);
}*/


