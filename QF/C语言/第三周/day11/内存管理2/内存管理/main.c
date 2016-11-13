//
//  main.c
//  内存管理
//
//  Created by qianfeng on 14-7-28.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

//
//.text段: 存的是我们的可执行程序
//.data段: 定义的全局变量及静态变量(初始化过后的),分为只读区(char *str="hello world"),可读写区;
//.bss段: 没有初始化的全局变量及静态变量
//heap段: malloc动态申请, 向上递增
//stack段: 内存空间是连续的,向下递增(局部变量)


#include <stdio.h>
#include <stdlib.h>

/*int a;
int b =100;

int main(int argc, const char * argv[])
{
    int c;
    char *p="hello world";
    
    char *q=malloc(100);
    return 0;
}*/


//static
//1. static 修饰在函数内定义的变量(初始化后), 变量的作用域在当前函数内有效, 变量在内存中的.data段直到整个源程序结束释放
//2. static 修饰在函数外的变量,作用域从定义的位置开始到当前模块结束,
//3. static 修饰函数, 表示该函数只能被该模块内的函数使用, 对于其它模块不能使用

#include "file.h"


/*int main(int argc, const char *argv[])
{
//    print_a();
//    print_a();
//    printf("%d\n", num);
//    
//    func1();
//    func2();
    printf("%d\n",add(5, 6));
    func3(3, 5);
    return 0;
}*/

//堆空间
//malloc
//void	*malloc(size_t size);
//size : 申请内存空间的大小(sizeof(int)*100),为了增强程序的可移植性
//void *: 返回申请堆内存空间的首地址
//返回值: NULL 申请失败不能使用,需要检查返回值情况





//动态数组
/*int main(int argc, const char *argv[])
{
    int *a=(int *)malloc(sizeof(int)*100);
    if (a==NULL) {// 对申请的动态内存进行判断
        return -1;
    }
    for (int i=0; i<10; i++) {
        scanf("%d", &a[i]);
    }
    for (int i=0; i<10; i++) {
        printf("%d ", a[i]);
    }
    
    return 0;
}*/

//可变长数组

//void func(int n)
//{
//    int a[n];
//    
//}

/*int main(int argc, const char *argv[])
{
    int n;
    scanf("%d", &n);
    int a[n];
    //printf("%ld\n",sizeof(a));
    for (int i=0; i<n; i++) {
        scanf("%d", &a[i]);
    }
    for (int i=0; i<n; i++) {
        printf("%d ", a[i]);
    }
    return 0;
}*/

//free()
//void	 free(void *);
//无返回值,传入申请到的内存空间的首地址

/*int main(int argc, const char *argv[])
{
    char *pstr=(char *)malloc(sizeof(char)*100);
    if (pstr==NULL) {
        exit(0);
    }
    scanf("%[^\n]", pstr);
    printf("%s\n", pstr);
    free(pstr);//释放申请的内存空间
    pstr = NULL;
    
    return 0;
}*/

//1. 申请内存空间
//2. 给申请的这块空间赋初值(memset())
//3. 判断内存空间是否申请成功
//4. 使用这块内存空间
//5. 释放内存空间
//6. 给指针赋值为空(防止野指针的出现)

/*int main(int argc, const char *argv[])
{
    //char *pstr=(char *)malloc(0);//pstr是一个野指针
    
//    char *pstr=(char *)malloc(sizeof(char)*100);
//    scanf("%s",pstr);
//    printf("%s\n", pstr);
//    
//    free(pstr);//不能对同一块堆内存释放两次以上
//    pstr = NULL;
//    free(pstr);

//    int a[10];
//    free(a);//不能释放栈取区上的变量, 对于free() 跟malloc()通常是成对使用
    return 0;
}*/

/*int main(int argc, const char *argv[])
{
    char *pstr;
    while (1) {
        pstr = malloc(1000);
    }
    return 0;
}*/
//
//void	*calloc(size_t, size_t);

/*int main(int argc, const char *argv[])
{
    int *p=calloc(10, 4);
    //printf("%ld\n", sizeof(p));
    for (int i=0; i<10; i++) {
        scanf("%d", &p[i]);
    }
    for (int i=0; i<10; i++) {
        printf("%d ", p[i]);
    }
    printf("\n");
    free(p);
    return  0;
}*/
//memset
//void	*memset(void *, int, size_t);

#include <string.h>

/*int main(int argc, const char *argv[])
{
    char  *pstr= (char *)malloc(100);
//    for (int i=0; i<100; i++) {
//        printf("%d", pstr[i]);
//    }
    memset(pstr, 'a', 50);
    for (int i=0; i<100; i++) {
        printf("%c", pstr[i]);
    }
    printf("\n");
    memset(pstr, 0, 100);
    for (int i=0; i<100; i++) {
        printf("%c", pstr[i]);
    }
    
    return 0;
}*/

//realloc: 修改malloc calloc 申请的内存空间大小
//void	*realloc(void *, size_t);
//

/*int main(int argc, const char *argv[])
{
    int *a=malloc(sizeof(int)*100);
    printf("%p\n", a);
    for (int i=0; i<100; i++) {
        a[i]=i;
    }
    
    a=realloc(a, sizeof(int)*50);
    printf("%p\n",a);
//    if (a) {
//        for (int i=0; i<50; i++) {
//            printf("%d ", a[i]);
//        }
//    }
    
    
    return 0;
}*/

//memcpy
//void	*memcpy(void *dst, const void *src, size_t size);

/*int main(int argc, const char *argv[])
{
    int *a=(int *)malloc(sizeof(int)*100);
    int *b=(int *)malloc(sizeof(int)*100);
    if (!a&&!b) {
        return -1;
    }
    for (int i=0; i<100; i++) {
        b[i]=i+1;
    }
    a = memcpy(a, b, 400);
    
    for (int i=0; i<100; i++) {
        printf("%d ",a[i]);
    }
    printf("\n");
    return 0;
}*/

/*int main(int argc, const char *argv[])
{
    char str[100]="hello world qianfeng";
    
    memcpy(str, &str[6], 14);
    printf("%s\n", str);
    return 0;
}*/
//memcmp
//int	 memcmp(const void *, const void *, size_t);
/*int main(int argc, const char *argv[])
{
    int a[5]={-1,12,13,14,17};
    int b[5]={11,12,13,14,16};
    printf("%d\n",memcmp(a, b, 20));
    

    return 0;
}*/

//memchr
//void	*memchr(const void *, int, size_t);
//找到就返回找到的字符地址, 否则返回空
/*int main(int argc, const char *argv[])
{
    char a[100]="qianfeng";
    char *pa;
    pa=memchr(a, 'f', 8);
    if (pa==NULL) {
        printf("hello world\n") ;
    }
    else
        printf("%s\n", pa);
    return 0;
}*/

//memmove
//void	*memmove(void *, const void *, size_t);

/*int main(int argc, const char *argv[])
{
    char str[100]="hello world qian feng";
    char str2[50];
//    memmove(str, &str[12], 9);
//    printf("%s\n",str);
    
//    memmove(str, &str[6], 15);
//    printf("%s\n",str);
    
    memmove(str2, str, 30);
    printf("%s\n", str2);
    
    return 0;
}*/

//memmem
//void	*memmem(const void *, size_t, const void *, size_t);

int main(int argc, const char *argv[])
{
    char str[100]="hello world qianfeng hello world";
    char str1[5]={'w','o','r','l','d'};
    char *pstr= memmem(str, 100, str1, 5);
    printf("%s\n", pstr);
    
    return 0;
}

