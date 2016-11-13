//
//  main.c
//  指针
//
//  Created by qianfeng on 14-7-8.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
#include "string.h"
//什么是地址: 我们说变量都有自己的地址, 计算机要找到某个变量,必须知道该变量的地址.我们可以通过 & 获得变量地址
//取地址符 : &
//通过取地址符就能把变量的地址给取出来
/*int main(int argc, const char * argv[])
{
    int a;
    printf("%p\n", &a);
    return 0;
}*/

//什么是指针?
//假如我们是做销售的, 我们拥有很多客户的地址, 那么我们需要一个通讯录来保存这些客户的地址, 同样对于计算机来说, 也需要用一个工具来保存变量的地址, 那么这个工具,就是指针
//指针就是用来保存内存地址的变量,本质是变量,变量存放的是地址,指针变量同样具有变量名,变量类型,变量值
//我们可以通过图形来表示
//指针定义
//一般形式: 类型 * 标示符
//标示符: 表示指针变量的名字
//类型: 表示指针指向的数据类型

/*int main(int argc, const char *argv[])
{
    int a;
    int *p;// 定义一个指针类型的变量p
    p= &a;
    printf("%p\n", p);
    printf("%p\n", &a);
    return  0;
}*/

//间接寻址符: *
//通过指针进行读取
//如果知道上海图书馆的地址, 那么我们可以找到上海图书馆,并在上海图书馆内阅览;
//同理, 如果指针p保存了变量a的地址, 那么就可以通过指针p来找到变量a, 并读取变量a 的值
//通过指针进行修改
//只要知道恐怖分子的地址, 那么我们就能对恐怖分子进行有效的打击
//同理, 知道变量的地址,那么我们就能修改变量的值
/*
int main(int argc, const char *argv[])
{
    int a= 10;
    int *p= &a;
    printf("a== %d\n", *p);
    return  0;
}
*/

/*int main(int argc, const char *argv[])
{
    int a= 10;
    int *p= &a;
    *p = 20;
    printf("a == %d", a);
    return  0;
}*/

//指针类型变量大小
//
/*
 int main(int argc, const char *argv[])
 {
 printf("%ld\n", sizeof(char *));
 printf("%ld\n", sizeof(short *));
 printf("%ld\n", sizeof(int *));
 printf("%ld\n", sizeof(long *));
 printf("%ld\n", sizeof(long long *));
 printf("%ld\n", sizeof(float *));
 
 return 0;
 }
 */

//指针与数组
/*int main(int argc, const char *argv[])
{
    int a[5] = {5,4,3,2,1};
    int *p = a;
    printf("%p\n", p);
    printf("%d\n", (*p)++);
    printf("%d\n", *p++);
    printf("%p\n", p);
    printf("%d\n", *p);
    
    return 0;
}*/

//void * 指针
//
//#define NULL ((void *) 0)
//空指针 NULL  #define NULL ((void *)0)
//指针就是用来保存内存地址的变量, 因此定义一个指针后一定要用它来保存一个内存地址, 假如不那么做, 那么该指针就是一个野指针, 它的默认值是随机的, 因此会造成混乱
//NULL = (void *)0
/*int main(int argc, const char *argv[])
{
    int a = 10;
    char ch = 'a';
    void *p=&a;
    void *q = &ch;
    //  *p = 10;
    printf("%d\n", *(int *)p);
    printf("%c\n",*(char *)q);
    //printf("%d", *p);
    return  0;
}*/
//野指针
//当一个指针指向内容非法时, 那这就是一个野指针
//定义一个指针没有赋初值, 这个指针就是野指针
//一个指针指向的内容被销毁了,这个指针就是野指针

/*int main(int argc, const char *argv[])
{
    int *p=NULL;//undefine
    *p = 10;
    printf("%d\n",*p);
    return 0;
}*/

//变更指针保存的地址
//指针直接对指针赋值
/*
int main(int argc, const char *argv[])
{
    int a= 10, b= 20;
    int *p= &a;
    printf("a==%d\n", *p);
    p = &b;
    printf("b==%d\n", *p);
    return 0;
}
*/

//指针自身的地址
//指针是变量,也占用内存,因此也有自己的地址

/*int main(int argc, const char *argv[])
{
    int a=10;
    int *p = &a;
    printf("p 指针的地址为: %p\n", &p);
    printf("a 变量的地址为: %p\n", p);
    printf("a 的值为: %d\n", *p);
    return  0;
}*/

//指针运算
//指针的 自增自减运算
/*int main(int argc, const char *argv[])
{
    int i= 10;
    int *p = &i;
    printf("指针保存的地址为: %p\n", p);
    p++;
    printf("指针保存的地址为: %p\n", p);
    p++;
    printf("指针保存的地址为: %p\n", p);
    p--;
    printf("指针保存的地址为: %p\n", p);
    p--;
    printf("指针保存的地址为: %p\n", p);
    return 0;
}*/

//指针的相减运算
//指针不能进行加法运算
/*int main(int argc, const char *argv[])
{
    int i= 0, j= 1;
    int *p1= &i;
    int *p2= &j;
    printf("p1: %p\n", p1);
    printf("p2: %p\n", p2);
    long a = p1-p2;
    printf("两块内存的地址差: ");
    printf("%ld\n", a);
    return 0;
}*/

//指针的比较运算
//我们也可以比较两个指针的大小

/*int main(int argc, const char *argv[])
{
    int a= 1, b= 2;
    int *p = &a;
    int *q = &b;
    printf("p: %p\n" , p);
    printf("q: %p\n" , q);
    if (p>q) {
        printf("p的内存地址大于q的内存地址\n");
    }
    else {
        printf("p的内存地址小雨q的内存地址\n");
    }
    return  0;
}*/

//指针运算符
// & 取地址符
// * 间接寻址符
// & * 为一对互逆运算符
/*int main(int argc, const char *argv[])
{
    int a= 10;
    int *p = &a;
    printf("%d\n",*p);
    printf("%d\n",*&a);
    return 0;
}*/

//指针变量作为函数参数
//封装一个函数交换两个值
/*void swap(int a, int b)
{
    int temp;
    temp = a;
    a = b;
    b = temp;
    return ;
}
int main(int argc, const char *argv[])
{
    int a = 10;
    int b = 20;
    printf("交换前 a== %d b== %d\n", a, b);
    swap(a, b);
    printf("交换后 a== %d b== %d\n", a, b);
    return 0;
}*/
//思考下为什么上面的函数值没有交换过来呢
//用什么方法能够解决这个问题呢?

/*
void swap(int *a , int *b)
{
    int temp;
    temp = *a;
    *a = *b;
    *b = temp;
    return ;
}

int main(int argc, const char *argv[])
{
    int a= 10, b= 20;
    printf("交换前 a== %d b== %d\n", a, b);
    swap(&a, &b);
    printf("交换后 a== %d b== %d\n", a, b);
    return 0 ;
}
*/

//const 与指针
/*
 int main(int argc, const char *argv[])
 {
 int i = 1;
 int *const p = &i;
 *p = 3;
 //p++; //p 的指向不能被修改
 printf("%d", i);
 
 return 0;
 }
 */

// 指向常量的指针
/*int main(int argc, const char *argv[])
 {
 int i= 1;
 const int *p = &i;
 printf("%p\n", p);
 p++;
 printf("%p\n", p);
 
 return 0 ;
 }*/

//指向常量的常量指针
// const int * const p;

/*int main(int argc, const char *argv[])
 {
 int i = 10;
 const char *const p = &i;
 p++;
 *p = 20;
 printf("%d\n", *p);
 return  0;
 }*/

//指针与数组
//数组名就是数组的首元素地址,数组名是一个常量
/*int main(int argc, const char *argv[])
{
    int a[5]={1, 2, 3, 4, 5};
    printf("%p\n", a);
    printf("%p\n", &a);
    printf("%p\n", &a[0]);
    return  0;
}*/

/*int main(int argc, const char *argv[])
{
    int a[5]= {1, 2, 3, 4, 5};
    int *p=a;
    for (int i = 0; i<5; i++) {
        printf("a[%d]==%d\n", i,*(p+i));
    }
    return  0;
}*/

//指针作为参数

/*void print(int *src,int len)
{
    for (int i=0; i<len; i++) {
        printf("%d ", *(src+i));
    }
    printf("\n");
}
//数组名作为地址传入的时候会丢失数组长度
int main(int argc, const char *argv[])
{
    int a[5]={1, 2, 3, 4, 5};
    print(a, 5);

    return  0;
}*/

//编写一个函数, 查找数组中的最大值


/*int findmax(int *src, int len)
{
    int max;
    max = *src;
    for (int i = 1; i< len; i++) {
        if (max < *(src+i)) {
            max = *(src+i);
        }
    }
    return max;
}

int main(int argc, const char *argv[])
{
    int a[5];
    printf("请输入5个整型数据: \n");
    for (int i= 0; i< 5; i++) {
        scanf("%d", &a[i]);
    }
    printf("The max value is: %d\n", findmax(a, 5));
    
    return 0;
}*/

//编写一个对整型数组排序的函数
//选择排序法
/*void sort(int *src, int len)
{
    int i, j, k,temp;
    for (i = 0; i< len -1; i++) {
        k = i;
        for (j= i+1; j<len; j++) {
            if(*(src+k) > *(src + j))
            {
                k = j;
            }
        }
        if (k!=i) {
            temp = *(src+k);
            *(src+k)= *(src+i);
            *(src+i)= temp;
        }
    }
}

int main(int argc, const char *argv[])
{
    int a[5];
    printf("请输入5个整型数据: \n");
    for (int i= 0; i< 5; i++) {
        scanf("%d", &a[i]);
    }
    sort(a, 5);
    for (int i= 0; i< 5; i++) {
        printf("%d ", a[i]);
    }
    printf("\n");
    return 0;
}*/
/*void func(int *p,int *q)
{
    int temp;
    temp=*p;
    *p=*q;
    *q=temp;
    
}
int main(int argc, const char *argv[])
{
    int a,b;
    scanf("%d %d",&a,&b);
    func(&a,&b);
    printf("%d %d\n",a ,b);
    return 0;
}*/
//指针佳作
/*void func(int *p,int len)
{
    int i;
    for (i=0; i<len; i++)
    {
        printf("%d ",*p++);
    }
}
int main(int argc, const char *argv[])
{
    int a[10],i=0,len=0;
    while (1)
    {
        scanf("%d", &a[i]);
        len++;
        i++;
        if (getchar()=='\n' || i>=10)
        {
            break;
        }
        
    }
    func(a,len);
    return 0;
}*/
/*void  func(char *p,int len)
{
    int i;
    for (i=0; i<len; i++)
    {
        if (*(p+i)>='A'&&*(p+i)<='Z')
        {
            *(p+i)=*(p+i)+32;
        }
    }
    for (i=0; i<len; i++)
    {
        printf("%c\n",*p++);
    }
}
int  main(int argc, const char *argv[])
{
   
    char a[100];
    int i=0,len=0;
    while (1)
    {
        scanf("%c", &a[i]);
        len++;
        i++;
        if (getchar()=='\n' || i>=10)
        {
            break;
        }
    }
    func(a, len);
    return 0;
}*/
/*int  main(int argc, const char *argv[])
{
    int a;
    int *p=0;
    scanf("%d",&a);
    p=&a;
    printf("%d\n",*p);
    return 0;
}*/
/*int  main(int argc, const char *argv[])
{
    int a[5];
    int p[5]={1,2,3,4,5},i;
    for (i=0; i<5;i++)
    {
        scanf("%d",&a[i]);
        *(p+i)=a[i];
    }
    for (i=0;i<5;i++)
    {
        printf("%d\n",*(p+i));
    }
    
    return 0;
}
*/
/*int  main(int argc, const char *argv[])
{
    int *p=NULL,a;
    scanf("%d",&a);
    p=&a;
    printf("%d\n",*p+1);
    return 0;
}*/
/*void func(int *p,int *q)
{
    int temp;
    temp=*p;
    *p=*q;
    *q=temp;
}
int  main(int argc, const char *argv[])
{
    int a,b;
    scanf("%d %d",&a,&b);
    int *n,*m;
    n=&a;
    m=&b;
    func(n,m);
    printf("%d %d\n",a,b);
    return 0;
}*/

/*void func(int *p)
{
    int i,*q;
    for (i=0; i<10; i++)
    {
        *(q+i)=*(P+i);
        *(P+i)=
    }
}*/
