//
//  main.c
//  常量变量
//
//  Created by qianfeng on 14-7-16.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
//常量: 常量是计算机中的罪基本元素, 字符常量,字符串常量,整型常量,浮点型常量,枚举常量
//字符常量: 'a'  '}'  '\n' '\0' '\r'
//ASCII码(美国信息标准交换码)
//'A' 65
//'a' 97
//'0' 48
//字符常量特点: 单引号括起来
//转义字符: '\n' '\0' '\r' '\\' '\'' '\"'

//字符串常量: 如 "qianfeng" "hello world"
//字符串常量特点:
// 1. 用双引号包含起来
// 2. 每一个元素都是一个字符
// 3. 字符串中的每个元素占用1个字节
// 4. 字符串以'\0'表示字符串的结束
//
//'a'  "a"
//1.一个是单引号,一个双引号
//2.'a'表示字符,"a"表示字符串
//3.'a' 占用4字节内存空间 "a"占用2字节内存空间
//4. "a"有\0表示结束

//整型: 12 678
//浮点型常量: 3.14 45.5678

//变量: 内存中一段命名的存储空间
//int a
//变量定义: 数据类型 + 变量名
//变量名必须为一个标识符
//标识符: 以字母或下划线开头后面跟若干个字母数字下划线
//1. 必须以字母或者下划线开头
//2. 标识符不能跟C语言中的关键字相同
//3. _开头的标识符通常给编译器使用

//command + /  注释/取消注释

//int main(int argc, const char * argv[])
//{
//    printf("%ld\n" , sizeof('a'));
//    return 0;
//}

/*int main(int argc, const char *argv[])
{
    //char ch = 'a';//隐式转换
    char ch1,ch2;
    printf("请输入两个字符\n");
    scanf("%c",&ch1);
    getchar();//读取一个字符
    scanf("%c",&ch2);
    
    printf("%c %c\n",ch1,ch2);
   // printf("%c\n",ch);//%c表示char类型数据
    //printf("ch = %ld a = %ld\n", sizeof(ch), sizeof('a'));
    return 0;
}*/

/*int main(int argc, const char *argv[])
{
    char str[100];
    char str1[100];
    scanf("%s",str);
    scanf("%s",str1);
    printf("%s\n",str);
    printf("%s\n", str1);
    return 0;
}*/

/*int main(int argc, const char *argv[])
{
   // char str[100];
    char str1[100];
    scanf("%[abcdefg]",str1);
    printf("%s\n", str1);
//    scanf("%[^\n]",str);
//    printf("%s\n",str);

    return 0;
}*/

/*int main(int argc, const char *argv[])
{
    char str[100];
    gets(str);
    printf("%s\n", str);
    return 0;
}*/

//int main(int argc , const char *argv[])
//{
//    //%d %ld %lld
//    int a = 12;
//    long b = 345345;
//    long long c = 234567892345678;
//    printf("a = %d b = %ld c= %lld\n", a, b, c);
//
//    return 0;
//}
//%u %lu %llu
//unsigned
//unsigned char
//unsigned int
//unsigned short
//unsigned long
//unsigned long long
//无符号整型数据

/*int main(int argc, const char *argv[])
{
    unsigned char a=0xff;
    unsigned short b=0xffff;
    unsigned int c=0xffffffff;
    unsigned long d=0xffffffffffffffff;
    
    printf("char max == %u\n", a);
    printf("short max == %u\n",b);
    printf("int max == %u\n",c);
    printf("long max == %lu\n", d);
    return 0;
}*/

int main(int argc, const char *argv[])
{
    //%f %lf %Lf
    float f;
    double f1 = 34567.4545;
    long double f2 = 234567.23456789;
    scanf("%f", &f);
    printf("%f\n", f);
    printf("%lf\n", f1);
    printf("%.10Lf\n", f2);
    return  0;
}


