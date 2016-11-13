//
//  main.c
//  指针深入
//
//  Created by qianfeng on 14-7-24.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
//指针与一维数组

/*int main(int argc, const char * argv[])
{
    int a[5]={1,2,3,4,5};
    
//    for (int i=0; i<5; i++) {
//        printf("%d ", *(a+i));
//        printf("%p \n", a+i);
//    }
    
//    int *p= a;
//    for (int i=0; i<5; i++) {
//        printf("%d ", *(p+i));
//    }
    
//    int *q = a;
//    for (int i=0; i<5; i++) {
//        printf("%d ", *q++);
//    }
    return 0;
}*/

/*int main(int argc, const char *argv[])
{
    int a[10];
    int *p = a;
    for (int i=0; i<10; i++) {
        scanf("%d", p++);
    }
    p=a;
    for (int i=0; i<10; i++) {
        printf("%d ", *p++);
    }
    return 0;
}*/
//4.指针实现数组逆序

void func(int *a,int len)
{
    int i;
    int temp;
    for (i=0; i<len/2; i++) {
        temp = *(a+i);
        *(a+i)=*(a+len-i-1);
        *(a+len-i-1)=temp;
    }
}

/*int main(int argc , const char *argv[])
{
    int a[5]={1, 2, 3, 4, 5};
    func(a,5);
    for (int i=0; i<5; i++) {
        printf("%d ",*(a+i));
    }
    return 0;
}*/
//5.练习:编写函数 replace, 在一个字符数组里面查找指定字符,并用相应的字符替代。函数原型如下:
//char * replace(char *src,char old, char new, int len)
#include <string.h>

char * replace(char *src,char old, char new, int len)
{
    for (int i=0; i<len; i++) {
        if (*(src+i)== old) {
            *(src+i)=new;
        }
    }
    return src;
}
/*int main(int argc, const char **argv)
{
    char str[100]="qianfengjiaoyu";
    printf("%s\n",replace(str, 'f', 'F', (int)strlen(str)));
    return 0;
}*/

int checkchar(const char *str, char ch, int len)
{
    for (int i =0; i<len; i++) {
        if (*(str+i)==ch) {
            return i;
        }
    }
    return -1;
}

//int main(int argc, const char **argv)
//{
//    char str[100]="hello world\n";
//    printf("%d ", checkchar(str, 'o', (int)strlen(str)));
//    
//    return  0;
//}
//6.练习:编写函数 insert, 向一个字符数组指定位置插入一个字符,后 面的字符依次向后移动。函数原型如下:
//char * intsert(char *src, int index, char new, int len)

char *intsert(char *src, int index, char new, int len)
{
    int i;
    for (i=len; i>=0; i--) {
        *(src+i) = *(src + i-1);
        if (i==index) {
            break;
        }
    }
    *(src + i)= new;
    return src;
}
/*int main(int argc, const char *argv[])
{
    char str[100]="hello world";
    printf("%s\n", intsert(str, 5, 'F', (int)strlen(str)));
 
    return 0;
}*/
//指针的数组
// int *a[10]
//

//定义char *类型的指针数组

/*int main(int argc, const char *argv[])
{
    char *a[5]={"qian","feng","jiao","yu","hello"};
    for (int i=0; i<5; i++) {
        printf("%s\n", a[i]);
    }

    
}*/

//定义一个指针数组, 接收终端输入的多个字符串,并打印输出
//
#include <stdlib.h>
/*int main(int argc, const char *argv[])
{
    char *str[10];
    for (int i=0; i<10; i++) {
        str[i]=malloc(sizeof(char)*100);
    }
    for (int i=0; i<10; i++) {
        scanf("%s",str[i]);
        printf("%s\n",str[i]);
        if (getchar()=='\n') {
            break;
        }
        //printf("%p\n",str[i]);
    }
    return 0;
}*/

//指针与二维数组
//定义一个二维数组,用指针数组指向这个二维数组,并打印输出

//int main(int argc, const char *argv[])
//{
//    int a[3]={1,2,3};
//    int *p = &a;
//    
//    printf("%d \n", p[0]);
//    
//    return 0;
//}
/*int main(int argc, const char *argv[])
{
    int a[3][4]={1,2,3,4,5,6,7,8,9,10,11,12};
    int *p[3];
    for (int i=0; i<3; i++) {
        p[i]=a[i];
    }// 指针数组赋值
    for (int i=0; i<3; i++) {
        for (int j=0; j<4; j++) {
            printf("%d ", *(p[i]+j));
        }
    }
    

    return 0;
}*/

//指向数组的指针
// int (*p)[5]
//

int sum(int (*p)[3])
{
    int sum=0;
    for (int i=0; i<3; i++) {
        sum += *(*p+i);
    }
    return sum;
}

/*int main(int argc, const char *argv[])
{
    int a[5]={1,2,3,4,5};
    int (*p)[5]=&a;
    printf("%d\n", sum(p));
    return 0;
}*/

//int main(int argc, const char *argv[])
//{
//    int a[4][3]={1,2,3,4,5,6,7,8,9,10,11,12};
//    int (*p)[3];
//    p = &a[0];
//    int temp=0;
//    for (int i=0; i<4; i++) {
//        temp+= sum(p++);
//    }
//    printf("%d \n", temp);
//    return 0;
//}
// int *(&a[0])[3]

/*int main(int argc, const char *argv[])
{
    int a[4][3]={1,2,3,4,5,6,7,8,9,10,11,12};
    int (*p[4])[3];
    p[0] = &a[0];
    for (int i=0; i<4; i++) {
        p[i]=&a[i];
    }
    int temp=0;
    for (int i=0; i<4; i++) {
        temp+= sum(p[i]);
    }
    printf("%d \n", temp);
    return 0;
}*/
//二级指针
/*int main(int argc, const char *argv[])
{
    int a = 10;
    int *p = &a;
    int **q = &p;
    
    printf("%d\n", *p);
    printf("%p\n",&a);
    printf("%p\n",p);
    printf("%p\n",*q);
    printf("%p\n",&p);
    printf("%d\n",**q);
    printf("%p\n",q);
    
    return 0;
}*/

//
int add(int a, int b)
{

    return a+b;
}

// int (*pfunc)(int, int)

/*int main(int argc,const char *argv[])
{
    int (*pfunc)(int, int)=add;
    //pfunc = add;
    printf("%d\n",pfunc(3,5));

    return 0;
}*/

//回调函数
void printwelcome(int cnt)
{
    printf("Hello world! %d\n", cnt);
}

void printbye(int cnt)
{
    printf("Good Bye! %d\n", cnt);
}

void callfunc(int times, void (*func)(int))
{
    for (int i=0; i<times; i++) {
        func(i);
    }
}

int main(int argc, const char *argv[])
{
    callfunc(10,printwelcome);
    callfunc(10,printbye);
    printbye(5);
    return 0;
}