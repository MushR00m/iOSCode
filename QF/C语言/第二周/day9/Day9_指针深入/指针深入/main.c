//
//  main.c
//  指针深入
//
//  Created by qianfeng on 14-7-23.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>


//指针与数组
//指针作为参数的这种特性的实际意义:
//最重要的一个就是可以实现多个返回值。
//(从函数带回多个值)
//函数不能返回数组
//函数返回指针值:不能返回局部变量的地址

//下标访问数组
//数组名访问数组
/*int main(int argc, const char *argv[])
{
    int a[5]={1,2,3,4,5};

    printf("%d\n", *a);
    printf("%d\n", *(a+2));
    printf("%d\n", *(a+3) );

    return 0;
}*/
//指针访问数组
/*int main(int argc, const char *argv[])
{
    int a[5]={1,2,3,4,5};
    int *p = a;
    printf("%d\n",*(p+=2));
    printf("%d\n",*(++p));
    return 0;
}*/

//利用指针,输入10个数到数组中, 再输出
/*int main(int argc, const char *argv[])
{
    int a[10];
    int *p = a;
    for (int i=0; i< 10; i++) {
        scanf("%d", p++);
    }
    p = a;
    for (int i=0; i<10; i++) {
        printf("%d ", *p++);
    }

    return 0;
}*/

//指针实现数组逆序
/*int main(int argc, const char **argv)
{
    int a[10]={1,2,3,4,5,6,7,8,9,10};
    int *p = a;
    int temp;
    for (int i=0; i<10/2; i++) {
        temp = *(p+i);
        *(p+i)=*(p+9-i);
        *(p+9-i)=temp;
    }
    
    for (int i=0; i<10; i++) {
        printf("%d ", *(p++));
    }
    return 0;
}*/

//练习:编写函数 replace, 在一个字符数组里面查找指定字符,并用相应的字符替代。函数原型如下:
//void replace(char *array, char old, char new, int length)

/*#include <string.h>

char * replace(char *src,char old, char new, int len)
{
    for (int i=0; i<len; i++) {
        if (*(src+i)==old) {
            *(src+i) = new;
        }
    }
    return src;
}

int main(int argc, const char *argv[])
{
    char str[100]="qianfengjiaoyu";
    printf("%s\n", replace(str, 'f', 'z', (int)strlen(str)));
    return 0;
}*/

//练习:编写函数 insert, 向一个字符数组指定位置插入一个字符,后 面的字符依次向后移动。函数原型如下:
//void insert(char *array, int index, char new, int length)
#include <string.h>

/*char * intsert(char *src, int index, char new, int len)
{
    int i;
    for (i=len; i>=index; i--) {
        *(src+i+1)= *(src+i);
    }
    *(src+i) = new;
    return src;
}

int main(int argc, const char *argv[])
{
    char str[100]="zhongguohaoshengyin";
    printf("%s\n", intsert(str, 5, 'A', (int)strlen(str)));

    return 0;
}*/
//数组作为函数参数
//传递一个数组,从数组中查找某个值

/*int findvalue(int a[], int len, int n)
{
    for (int i=0; i<len; i++) {
        if (n == *(a+i)) {
            return i;//返回下标
        }
    }
    return -1;//返回下标
}


int main(int argc, const char *argv[])
{
    int a[5]={1,2,3,4,5};
    printf("%d\n", findvalue(a,5,5));
    return 0;
}*/


//指针的数组(指针数组)
//数组中的每个元素都是一个指针(若干个指针的集合)
//如: int *p[10]
//p中的每个元素都是一个int *型的指针

/*int main(int argc, const char * argv[])
{
    char *ps[4]={"hello","world","qian","feng"};
    
    for (int i =0; i<4; i++) {
        printf("%s\n", ps[i]);
    }
    return 0;
}*/

/*int main(int argc, const char **argv)
{
    char *p[10];
    int i;
    for (i=0; i<10; i++) {
        p[i] = malloc(sizeof(char)*100);
    }
    
    for (i=0; i<10; i++) {
        scanf("%s", p[i]);
        printf("%s\n",p[i]);
        if (getchar()=='\n') {
            break;
        }
    }
    return 0;
}*/

//指针数组与二维数组
//int *a[5] int a[5][10]

/*int main(int argc, const char  *argv[])
{
    int a[3][4]={1,2,3,4,5,6,7,8,9,10,11,12};
    int *b[3];
    for (int i=0; i<3; i++) {
        b[i]=a[i];
        printf("%p\n", b[i]);
    }
    for (int i= 0; i<3; i++) {
        for (int j=0; j<4; j++) {
            printf("%d ",*b[i]++);
            printf("%p\n", b[i]);
        }
        printf("\n");
    }

    return 0;
}*/



//指向数组的指针
//int (*arr)[5];
//arr是一个指针, 是一个指向有5个整型元素的指针

// int a[10]
// int (*pa)[10]=&a;
//注意:a是一个数组，在&a这个表达式中，数组名做左值，取整个数组的首地址赋给指针pa。
//注意，&a[0]表示数组a的首元素的首地址，而&a表示数组a的首地址，显然这两个地址的数值相同，但这两个表达式的类型是两种不同的指针类型，前者的类型是int *，而后者的类型是int (*)[10]。*pa就表示pa所指向的数组a，所以取数组的a[0]元素可以用表达式(*pa)[0]。注意到*pa可以写成pa[0]，所以(*pa)[0]这个表达式也可以改写成pa[0][0]，pa就像一个二维数组的名字，它表示什么含义呢？下面把pa和二维数组放在一起做个分析。

/*int sum(int (*arr)[5])
{
    int sum=0;
    for (int i=0; i<5; i++) {
        sum+=(*arr)[i];
    }
    return sum;
}


int main(int argc, const char *argv[])
{
    int a[5]={1, 2, 3, 4, 5};
    printf("%d\n", sum(&a));//为什么传&a, 而不是a呢?
    return 0;
}
*/
//指向数组的指针 跟 二维数组
//指向二维数组的指针
/*int main(int argc, const char *argv[])
{
    int a[4][2]={1,2,3,4,5,6,7,8};
    int (*p)[2];
    p=&a[0];
    printf("%p\n",p);
    p++;
    printf("%p\n",p);
    p++;
    printf("%p\n",p);
    p--;
    printf("%p\n",p);
    
    return  0;
}*/

/*int sum(int (*arr)[2])
{
    int sum=0;
    for (int i=0; i<2; i++) {
        sum+=(*arr)[i];
    }
    return sum;
}
int main(int argc, const char *argv[])
{
    int a[4][2]={1,2,3,4,5,6,7,8};
    int (*p[3])[2];
    for (int i=0; i<4; i++) {
        p[i]=&a[i];
    }
    for (int i=0; i<4; i++) {
        printf("%d ", sum(p[i]));
    }
    return  0;
}*/

//指向指针的指针(二级指针)
//int a=10;
//int *p = &a;
//int **q = &p;


/*int main(int argc, const char *argv[])
{
    int a= 10;
    int *p = &a;
    int **q = &p;
    printf("%d\n", a);
    printf("%p\n", p);
    printf("%d\n", *p);
    printf("%p\n", &p);
    printf("%p\n", *q);
    printf("%p\n", q);
    printf("%d\n", **q);
    return 0;
}*/

//指向函数的指针

//int (*pfunc)(int a, int b)//声明函数指针
//int (*pfunc)(int a, int b)//声明函数指针数组
//声明一个指向函数的指针
//a, b: 指向的函数有两个int类型的参数
//pfunc: 指针的变量名为pfunc
//* : 说明是一个指针类型的变量
//int : 指向的函数的返回值类型是int 类型

//int *func(int a, int b)
//声明一个函数func
//函数的返回值是一个int *型的指针


/*int add(int a, int b)
{
    return a+b;
}

int main(int argc, const char *argv[])
{
    int (*pfunc)(int a, int b)=add;
    printf("%d\n",(*pfunc)(3,5));

    return 0;
}*/

//函数指针:
// 数据类型 (*指针变量名) (参数列表)

//函数名代表一个函数的地址
//函数指针可以保存任何一个函数的地址
//
//int *((*q)[3])[3];
//int *(*q[3])[3]


//利用函数指针实现回调函数
#include <stdio.h>

/*
void printWelcome(int len)
{
    printf("Hello world -- %d\n", len);
}

void printGoodbye(int len)
{
    printf("Goodbye -- %d\n", len);
}

void callback(int times, void (* print)(int))
{
    int i;
    for (i = 0; i < times; ++i)
    {
        print(i);
    }
    printf("\n我不知道你是迎客还是送客!\n\n");
}
int main(void)
{
    callback(10, printWelcome);
    callback(10, printGoodbye);
    printWelcome(5);
    return 0;
}*/
void chazhao(char *str ,char *p )
{
    int i;
    int cnt = 0;
    int j;
    for (i = 0; str[i] != '\0'; i++)
    {
      //  j = i;
       
        j = 0;
        
        while (str[i+j] == p[j])
        {
            
            if (p[j+1] =='\0')
            {
                cnt++;
                break;
            }
            
            j++;
        }
        
    }
    printf("%d",cnt);
}

int main(int argc,const char *argv[])
{
    
    char a[100];
    char b[100];
    scanf("%s",a);
    scanf("%s",b);
    chazhao(a,b);
    return 0;
    
}
