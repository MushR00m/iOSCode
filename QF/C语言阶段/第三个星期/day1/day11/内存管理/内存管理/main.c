//
//  main.c
//  内存管理
//
//  Created by qianfeng on 14-5-27.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//
/*欢迎进入内存这片雷区。伟大的Bill Gates 曾经失言：
640K ought to be enough for everybody  — Bill Gates 1981


程序员们经常编写内存管理程序，往往提心吊胆。如果不想触雷，唯一的解决办法就是发现所有潜伏的地雷并且排除它们，躲是躲不了的。本章的内容比一般教科书的要深入得多，读者需细心阅读，做到真正地通晓内存管理。

7.1内存分配方式
内存分配方式有三种：
（1）       从静态存储区域分配。内存在程序编译的时候就已经分配好，这块内存在程序的整个运行期间都存在。例如全局变量，static变量。
（2）       在栈上创建。在执行函数时，函数内局部变量的存储单元都可以在栈上创建，函数执行结束时这些存储单元自动被释放。栈内存分配运算内置于处理器的指令集中，效率很高，但是分配的内存容量有限。
（3）       从堆上分配，亦称动态内存分配。程序在运行的时候用malloc或new申请任意多少的内存，程序员自己负责在何时用free或delete释放内存。动态内存的生存期由我们决定，使用非常灵活，但问题也最多。

7.2常见的内存错误及其对策

发生内存错误是件非常麻烦的事情。编译器不能自动发现这些错误，通常是在程序运行时才能捕捉到。而这些错误大多没有明显的症状，时隐时现，增加了改错的难度。有时用户怒气冲冲地把你找来，程序却没有发生任何问题，你一走，错误又发作了。
常见的内存错误及其对策如下：

内存分配未成功，却使用了它。
编程新手常犯这种错误，因为他们没有意识到内存分配会不成功。常用解决办法是，在使用内存之前检查指针是否为NULL。如果指针p是函数的参数，那么在函数的入口处用assert(p!=NULL)进行检查。如果是用malloc或new来申请内存，应该用if(p==NULL) 或if(p!=NULL)进行防错处理。

内存分配虽然成功，但是尚未初始化就引用它。
犯这种错误主要有两个起因：一是没有初始化的观念；二是误以为内存的缺省初值全为零，导致引用初值错误（例如数jj组）。
内存的缺省初值究竟是什么并没有统一的标准，尽管有些时候为零值，我们宁可信其无不可信其有。所以无论用何种方式创建数组，都别忘了赋初值，即便是赋零值也不可省略，不要嫌麻烦。

内存分配成功并且已经初始化，但操作越过了内存的边界。
例如在使用数组时经常发生下标“多1”或者“少1”的操作。特别是在for循环语句中，循环次数很容易搞错，导致数组操作越界。

忘记了释放内存，造成内存泄露。
含有这种错误的函数每被调用一次就丢失一块内存。刚开始时系统的内存充足，你看不到错误。终有一次程序突然死掉，系统出现提示：内存耗尽。
动态内存的申请与释放必须配对，程序中malloc与free的使用次数一定要相同，否则肯定有错误（new/delete同理）。
释放了内存却继续使用它。
有三种情况：
（1）程序中的对象调用关系过于复杂，实在难以搞清楚某个对象究竟是否已经释放了内存，此时应该重新设计数据结构，从根本上解决对象管理的混乱局面。
（2）函数的return语句写错了，注意不要返回指向“栈内存”的“指针”或者“引用”，因为该内存在函数体结束时被自动销毁。
（3）使用free或delete释放了内存后，没有将指针设置为NULL。导致产生“野指针”。

【规则7-2-1】用malloc或new申请内存之后，应该立即检查指针值是否为NULL。防止使用指针值为NULL的内存。
【规则7-2-2】不要忘记为数组和动态内存赋初值。防止将未被初始化的内存作为右值使用。
【规则7-2-3】避免数组或指针的下标越界，特别要当心发生“多1”或者“少1”操作。
【规则7-2-4】动态内存的申请与释放必须配对，防止内存泄漏。
【规则7-2-5】用free或delete释放了内存之后，立即将指针设置为NULL，防止产生“野指针”。*/

//内存从下往上.text)
/*
 1.代码段：代码段（code segment/text segment）通常是指用来存放程序执行代码的一块内存区域。
 
 2.数据段：数据段（data segment）通常是指用来存放程序中已初始化的全局变量和静态变量的一块内存区域。数据段属于静态内存分配，可以分为只读数据段和读写数据段。 字符串常量等，但一般都是放在只读数据段中 。
 
 3.BSS段：BSS段（bss segment）通常是指用来存放程序中未初始化的全局变量和静态变量(static)
 
 4.堆（heap）：堆是用于存放进程运行中被动态分配的内存段，它的大小并不固定，可动态扩张或缩减。向上递增
 
 5.栈 (stack)：栈又称堆栈， 是用户存放程序临时创建的局部变量，也就是说我们函数括弧“{}”中定义的变量（但不包括static声明的变量，static意味着在数据段中存放变 量）。
*/
//static关键字
//1.在函数体内，一个被声明为静态的变量在这一函数被调用过程中维持其值不变（该变量存放在静态变量区）。\
//2.在模块内（但在函数体外），一个被声明为静态的变量可以被模块内所用函数访问，但不能被模块外其它函数访问。它是一个本地的全局变量。
//3.在模块内，一个被声明为静态的函数只可被这一模块内的其它函数调用。那就是，这个函数被限制在声明它的模块的本地范围内使用。

//（1）设置变量的存储域，函数体内static变量的作用范围为该函数体，不同于auto变量，该变量的内存只被分配一次，因此其值在下次调用时仍维持上次的值；
//（2）限制变量的作用域，在模块内的static全局变量可以被模块内所用函数访问，但不能被模块外其它函数访问；
//（3）限制函数的作用域，在模块内的static函数只可被这一模块内的其它函数调用，这个函数的使用范围被限制在声明它的模块内；

/*#include "file.h"
#include <stdio.h>

int main(int argc, const char *argv[])
{
    //a=200;
    //printf("a=%d\n", a);
    //printf("%d\n",add(3, 5));
    //print(3, 5);
    //chagevalue();
    func()  ;
    func()  ;
    return 0;
}*/

//堆空间
//需要使用规模较大的内存,但是不能预先确定所需的容量
//规模较大:K、M级别
//不能预先确定:只有在运行时刻,才能根据要处理的数据 内容确定其容量
//       静态内存分配                    动态内存分配
//  小场合,可以预先确定占用内存大小        大场合, 不能预先确定占用内存大小
//      K级以下                        K级以上
// char str[512]                    char *str=(char *)malloc(2048*sizeof(char))
// 数据区,栈区                           堆区
// 不需要释放                          需要调用free();函数释放申请的空间
// 技术要求简单                         技术要求复杂


//malloc 函数
//void	*malloc(size_t size);
//void * : 返回申请到堆的内存空间的首地址,申请失败返回空
//size_t = unsigned long : 申请内存空间的大小
//size
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//手动申请空间
//动态数组
//使用sizeof()提高可移植性

/*int main(int argc, const char *argv[])
{
    int *score;
    int num;
    printf("请输入学生的数目: ");
    scanf("%d",&num);
    printf("请输入%d个学生的成绩: ",num);
    score = (int *)malloc(num*sizeof(int));
    for (int i=0; i<num; i++) {
        scanf("%d",&score[i]);
    }
    for (int i=0; i<num; i++) {
        printf("%d ", score[i]);
    }
    printf("\n");
    return 0;
}*/

//C99新标准可以输入变长数组
//变长数组,但并不是说数组的长度可以随便改变

/*int main(int argc, const char *argv[])
{
    int n;
    int sum=0;
    scanf("%d",&n);
    int a[n];
    for (int i=0; i<n; i++) {
        scanf("%d",&a[i]);
    }
    for (int i=0; i<n; i++) {
        sum+=a[i];
    }
    printf("%d\n",sum);
    return 0;
}*/

//手动释放空间
//void free(void *pstr);
//pstr: 申请到的内存空间的首地址
//释放动态申请的内存空间
//free应该和malloc成对出现
//对于申请的内存不能free两次

//保证了资源的及时清理
//释放内存后,原来申请的内存空间不能再用,ptr被称作野指针,不可再有*ptr = ... 的操作,通常在释放后会将ptr = NULL
//

//堆空间申请、释放函数使用基本流程
//Step1: p = malloc(size);
//Step2: 使用申请到的内存
//Step3: free(p);
//p的值在第2步中没有修改
//Step4: p = NULL;


/*int main(int argc, const char *argv[])
{
    int *p = (int *)malloc(10*sizeof(int));
//    for (int i=0; i<10; i++) {
//        printf("%d ", p[i]);
//    }
//    *p = 4;
//    printf("%d\n",*p);
//    free(p);
//    p = NULL;
//    free(p);
    return 0;
}*/

//void	*calloc(size_t, size_t);
//void *calloc(size_t nmemb, size_t size)
//参数:nmemb:申请存放nmemb个元素的空间
//size:每个元素占用size字节
//申请的空间为:size * nmemb字节
//返回值:与malloc返回值相同

//1.将申请nmemb*size字节
//2.将申请的每个字节清零

/*int main(int argc, const char *argv[])
{
    char *str=(char *)calloc(100,1);
    scanf("%s",str);
    printf("%s\n",str);
    return 0;
}*/

/*int main(int argc, const char *argv[])
{
    int *a=(int *)calloc(5, 4);
    for (int i=0; i<5; i++) {
        printf("%d ", a[i]);
    }
//    for (int i=0; i<5; i++) {
//        scanf("%d",&a[i]);
//    }
//    
//    for (int i=0; i<5; i++) {
//        printf("%d ", a[i]);
//    }
//    printf("\n");
    return 0;
}*/


//练习使用malloc函数实现calloc

//不能申请一个0字节空间
/*int main(int argc, const char *argv[])
{
    int *p=(int *)malloc(0);
    scanf("%d", &p[0]);
    printf("%d ",p[0]);

    return 0;
}*/

//不能释放非动态申请的空间
/*int main(int argc, const char *argv[])
{
    int a[10];
    free(a);
    
    return 0;
}*/


//realloc
//void	*realloc(void *ptr, size_t size);
//功能:修改占用的动态内存大小
//参数:ptr:只能是曾经动态获取的内存块
//的首地址 size:修改后的动态内存字节数
//返回值:与malloc相同
//先判断当前的指针是否有足够的连续空间，如果有，扩大ptr指向的地址，并且将ptr返回，如果空间不够，先按照size指定的大小分配空间，将原有数据从头到尾拷贝到新分配的内存区域，而后释放原来ptr所指内存区域（注意：原来指针是自动释放，不需要使用free），同时返回新分配的内存区域的首地址。即重新分配存储器块的地址
//两个特殊用法:
//realloc(NULL,size) === malloc(size ‏)
//realloc(ptr, 0) ==== free(ptr)
//
//memset()函数
/*int main(int argc, const char *argv[])
{
    char *p=malloc(sizeof(char)*100);
    memset(p, 'a', 100);
    for (int i=0; i<100; i++) {
        printf("%c", p[i]);
    }

    return 0;
}
*/
//内存字符查找函数,返回查找到的首地址
//memchr
//void	*memchr(const void *, int, size_t);
/*int main(int argc, const char *argv[])
{
    char *str=malloc(sizeof(char)*100);
    scanf("%s", str);
    printf("%s\n",str);
    
    char *p=memchr(str, 'a', 100);
    printf("%s\n",p);

    return 0;
}*/

//memcpy()函数
//void	*memcpy(void *, const void *, size_t);

//1、复制的内容不同。strcpy只能复制字符串，而memcpy可以复制任意内容，例如字符数组、整型、结构体、类等。
//2、复制的方法不同。strcpy不需要指定长度，它遇到被复制字符的串结束符"\0"才结束，所以容易溢出。memcpy则是根据其第3个参数决定复制的长度。
//3、用途不同。通常在复制字符串时用strcpy，而需要复制其他类型数据时则一般用memcpy

/*int main(int argc, const char *argv[])
{
    int *a=(int *)malloc(sizeof(int)*10);
    int *b=(int *)malloc(sizeof(int)*20);
    if ((a==NULL) || (b==NULL)) {
        return -1;
    }

    printf("请输入十个学生的成绩: ");
    for (int i=0; i<10; i++) {
        scanf("%d", &a[i]);
    }
    
    memcpy(b, a, sizeof(int)*10);
    for (int i=0; i<10; i++) {
        printf("%d ",b[i]);
    }

    return 0;
}*/

//memcmp()函数
//int	 memcmp(const void *, const void *, size_t);
//跟strcmp对比下分析它们间的区别

/*int main(int argc, const char *argv[])
{
    int a[5]={12,13,14,15,27};
    int b[5]={12,13,14,15,27};
    
    printf("%d\n", memcmp(a, b, 20));

    return 0;
}*/

//memmove()函数
//void	*memmove(void *, const void *, size_t);
//memmove用于从src拷贝count个字符到dest，如果目标区域和源区域有重叠的话，memmove能够保证源串在被覆盖之前将重叠区域的字节拷贝到目标区域中。但复制后src内容会被更改。但是当目标区域与源区域没有重叠则和memcpy函数功能相同。
//指向的内容可以
/*int main(int argc, const char *argv[])
{
    char str[100]="hello world";
    memmove(&str[4], &str[6], 5);
    printf("%s\n", &str[4]);
    printf("%s\n", &str[6]);
    return 0;
}*/

//memmem
//内存查找函数
//void	*memmem(const void *, size_t, const void *, size_t);
/*int main(int argc, const char *argv[])
{
    char str[100]="hello world hello world";
    char *pstr=memmem(str, 100, "world", 5);
    printf("%s\n",pstr);
    return 0;
}*/

