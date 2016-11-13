//
//  main.c
//  字符串
//
//  Created by qianfeng on 14-7-25.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <ctype.h>

//字符串
//char ch[5]={'a','b','c','d','e'};
//"qianfeng"
//双引号括起来
//每个字符占用一个字节
//以'\0'表示字符串结束
//


/*int main(int argc, const char * argv[])
{
    char str[100]="qianfeng\0jiaoyu\0helloworld";
    printf("%s\n",str);
    printf("%s\n",&str[9]);
    printf("%s\n",&str[16]);
    return 0;
}*/

//求字符串长度
//字符串有效长度不包含'\0'
//sizeof 是一个运算符, 求变量或者常量占用内存空间大小
//strlen是一个函数, 求字符串有效字符个数

int mystrlen(const char * src)
{
    int i=0;
    while (src[i]!='\0')
    {
        i++;
    }
    return i;
}

/*int main(int argc, const char *argv[])
{
    char str[100]="hello world";
    printf("%d \n", mystrlen(str));
    printf("%ld \n", sizeof(str));
    printf("%ld \n", sizeof("hello world"));
    printf("str == %ld \n", strlen(str));
    return 0;
}*/
/*
int     isdigit(int);
int     islower(int);
int     isspace(int);
int     isupper(int);
int     tolower(int);
int     toupper(int);
int     digittoint(int);
int     isnumber(int);
*/


/*int main(int argc, const char *argv[])
{
    printf("digit = %d\n ",isdigit('9'));
    printf("lower = %d\n ",islower('z'));
    printf("space = %d\n ",isspace('h'));
    printf("upper = %d\n ",isupper('A'));
    printf("tolower = %c\n", tolower('A'));
    printf("toupper = %c\n",toupper('a'));
    printf("int = %d\n",digittoint('9'));
    printf("isnumber = %d\n", isnumber('9'));
    return 0;
}*/

//字符串拷贝
//strcpy
//char	*strcpy(char *, const char *);
//strncpy
//char	*strncpy(char *, const char *, size_t);
//s1的内存空间足够容纳s2字符串
//strncpy 选择拷贝的字节数, 不一定包含'\0';
char *mystrcpy(char *dst, const char *src)
{
    int i =0;
    while (src[i]) {
        dst[i]=src[i];
        i++;
    }
    dst[i]='\0';
    return dst;
}
/*int main(int argc, const char *argv[])
{
    char s1[100];
    char s2[50]="hello world\n";
    //char *str = strcpy(s1, s2);
    //printf("%s\n",strcpy(s1, s2));
    //printf("%s\n",str);
    //printf("%s\n",mystrcpy(s1, s2));
    strncpy(s1, s2, 10);
    s1[10]='\0';
    printf("%s\n", s1);
    
    return 0;
}*/

//字符串拼接函数
//strcat
//char	*strcat(char *, const char *);
//strncat
//char	*strncat(char *, const char *, size_t);
//strncat在拼接后的新字符串后会添加一个'\0';

char *mystrcat(char *s1, const char *s2)
{
    int i=0,j;
    while (s1[i]) {
        i++;
    }
    for (j=0; s2[j]!='\0'; j++) {
        s1[i+j]=s2[j];
    }
    s1[i+j]='\0';
    return s1;
}
/*int main(int argc, const char *argv[])
{
    char s1[100]="hello world";
    char s2[50]="qianfeng";
    
    //printf("%s\n",strcat(s1, s2));
    //printf("%s\n",mystrcat(s1, s2));
    printf("%s\n",strncat(s1, s2, 5));
    
    return 0;
}*/

//字符串比较函数
//strcmp
//int	 strcmp(const char *, const char *);
//strncmp
//int	 strncmp(const char *, const char *, size_t);
// s1 > s2 返回一个正数
// s1 == s2 返回0
// s1 < s2 返回一个负数






int mystrcmp(const char* s1, const char *s2)
{
    int i;
    for (i=0; (s1[i]!='\0')&&(s2[i]!='\0') ; i++) {
        if (s1[i]==s2[i]) {
            continue;
        }
        else
        {
            break;
            //return  s1[i]-s2[i];
        }
    }
    return s1[i]-s2[i];
}
/*int main(int argc, const char *argv[])
{
    char *str1 = "hello borld";
    char *str2 = "hello zorld";
    
    //printf("%d\n", mystrcmp(str1, str2));
    printf("%d\n", strncmp(str1, str2, 7));
    //char s1[30]="hello world";
    
    return 0;
}*/

/*
int main(int argc, const char *argv[])
{
    char str[100];
    int i=0;
    while (1) {
        scanf("%c",&str[i]);
        if (str[i]=='\n') {
            str[i]='\0';
            break;
        }
        i++;
    }
    printf("%s\n", str);
    return 0;
}*/

/*int main(int argc ,const char *argv[])
{
    char str[100];
    char str1[100];
    fscanf(stdin,"%s", str);
    fscanf(stdin, "%s",str1);
    fprintf(stdout,"%s\n", str);
    fprintf(stdout, "%s\n",str1);
    return 0;
}*/

/*int main(int argc, const char *argv[])
{
    char str[100];
    //gets(str);//除了'\n'
    scanf("%[^\n]", str);
    printf("%s\n", str);

    return 0;
}*/

//字符查找函数
//strchr
//strrchr
//char	*strchr(const char *, int);
//char	*strrchr(const char *, int);

char *mystrchr(const char *s1, char ch)
{
    int i=0;
    while (s1[i]) {
        if (s1[i]==ch) {
            break;
        }
        i++;
    }
    return (char *)&s1[i];
}
/*int main(int argc, const char *argv[])
{
    char str[100]="hello world!";
    
    char *pstr = mystrchr(str, 'l');
    printf("%s\n", pstr);
    //printf("%s\n", pstr);

    return  0;
}*/

/*int main(int argc, const char *argv[])
{
    char str[100]="hello world!";
    char *pstr = strrchr(str, 'l');
    printf("%s\n", pstr);
    return 0;
}*/

//查找字符串函数
//strstr
//char	*strstr(const char *, const char *);

// 0 '0' "0" NULL

/*int main(int argc, const char *argv[])
{
    char str1[100]="helloworld helloworld helloworld";
    printf("%p\n",&str1[strlen(str1)]);
//    char *pstr = strstr(str1, "world");
//    printf("%s\n", pstr);
    
    
    char *p = str1;
    while (p)
    {
        p=strstr(p, "world");
        if (p)
        {
            printf("%s\n", p);
            p+=sizeof("world")-1;
        }
    }
    //"helloworld helloworld helloworld"
    return 0;
}*/

//字符串分割函数
//strtok
//char	*strtok(char *, const char *);

/*int main(int argc, const char *argv[])
{
      char str[100]="hello world:good-bye:://qian^feng..miss()you///";
//    char *p=strtok(str, ": ");
//    printf("%s\n",p);
//    while ((p=strtok(NULL , ": /^.()-"))) 
//    {
//        printf("%s\n",p);
//    }
    char *p = str;
    while ((p=strtok(p, ": /^.()-")))
    {
        printf("%s\n",p);
        p=NULL;
    }
//    p = strtok(p, ":");
//    printf("%s\n",p);
    return 0;
}*/








//**************************    sscanf      *****************************




//int	 sscanf(const char * __restrict, const char * __restrict, ...) __scanflike(2, 3);
//sprintf
//int	 sprintf(char * __restrict, const char * __restrict, ...) __printflike(2, 3);

/*int main(int argc, const char *argv[])
{
    char str[100]="12a1234*678";
    int a, b, c;
   int m = sscanf(str, "%da%d*%d", &a,&b,&c);
    printf("%d %d %d\n", a, b, c);
    printf("%d\n",m);
    return 0;
}*/

int main(int argc, const char *argv[])
{
    char buf[100];
    char buf1[100];
    int a = 100;
    char str[50]="hello world!";
    float b = 3.14;
    
   sprintf(buf, "<%d><%s><%f>",a,str,b);
    int m = sprintf(buf1, "%d%s%f",a,str,b);
    printf("%s\n", buf);
    printf("%d\n",m);
    return 0;
}
//atoi
//atof
//double	 atof(const char *);
//int	 atoi(const char *);

/*#include <stdlib.h>

int main(int argc, const char *argv[])
{
    char *str="-12-3.34567";
    char *str1="-123-wesd23456789";
    
    printf("%d\n", atoi(str1));
    printf("%f\n", atof(str));
    
    return 0;
}*/
//itoa

//
//空格作为分割符统计输入单词个数
//

/*int main(int argc, const char *argv[])
{
    char str[200];
    scanf("%[^\n]",str);
    int i=0;
    int flag=1;
    int cnt=0;
    while (str[i]!='\0') {
        if (str[i]==' ') {
            if (!flag) {
                flag = 1;
            }
        }
        else
        {
            if (flag) {
                cnt++;
                flag =0;
            }
        }
        i++;
    }
    printf("%d\n", cnt);

    return 0;
}*/
