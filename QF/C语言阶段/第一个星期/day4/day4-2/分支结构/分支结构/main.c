//
//  main.c
//  分支结构
//
//  Created by qianfeng on 14-7-17.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
//单分支结构
//if(表达式) 表达式成立(真),则执行括号中的代码块,否则不执行
//{
//  代码块;
//}
//
/*int main(int argc, const char * argv[])
{
    int a;
    scanf("%d", &a);
    if (a== 10) {
        printf("hello world\n");
    }
   
    return 0;
}*/

/*#include <stdlib.h>

int main(int argc, const char *argv[])
{
    int score;
    printf("请输入学生的分数 : ");
    scanf("%d", &score);
    if (score < 0 || score >100) {
        printf("输入错误\n");
        exit(0);
        //return -1;
    }
    if (score>=0 && score <60) {
        printf("不及格\n");
    }
    if (score>=60 && score <70) {
        printf("该学生的成绩凑合\n");
    }
    if (score >=70 && score <80) {
        printf("该学生的成绩正常\n");
    }
    if (score >= 80 && score < 90) {
        printf("该学生的成绩良好\n");
    }
    if (score >= 90 && score <= 100) {
        printf("该学生的成绩优秀\n");
    }

    return 0;
}*/
//双分支结构
//if(表达式)表达式为真, 执行语句列表1,为假执行语句列表2
//{
//  语句列表1;
//}
//else
//{
//  语句列表2;
//}

/*int main(int argc, const char *argv[])
{
    int a;
    scanf("%d", &a);
    if (a>=60 && a<=100)
    {
        printf("及格\n");
    }
    else{
        printf("不及格\n");
    }

}*/

/*int main(int argc, const char *argv[])
{
    int year;
    printf("请输入一个年份: ");
    scanf("%d", &year);
    if ((year%4 == 0 && year%100!=0) || (year%400==0))
    {
        printf("%d年是闰年\n", year);
    }
    else
    {
        printf("%d年是平年\n" ,year);
    }    return 0;
}*/

//if(表达式1)
//{
//    语句列表1;
//}
//else if(表达式2)
//{
//    语句列表2;
//}
//else if(表达式3)
//{
//    语句列表3;
//}
//...
//else if(表达式n)
//{
//  语句列表n;
//}
//else
//{
//    语句列表;
//}

/*int main(int argc, const char *argv[])
{
    int month;
    printf("请输入月份: ");
    scanf("%d", &month);
    if (month<1 || month >12) {
        printf("输入月份错误\n");
        return  -1;
    }
    
    if (month >=2 && month <= 4) {
        printf("春季\n");
    }
    else if (month >= 5 && month <= 7)
    {
        printf("夏季\n");
    }
    else if (month >= 8 && month <= 10)
    {
        printf("秋季\n");
    }
    else
    {
        printf("冬季\n");
    }
    return 0;
}*/

//if(表达式)
//{
//    if(表达式)
//    {
//        
//    }
//    else
//    {
//    
//    }
//}
//else
//{
//    if(表达式)
//    {
//    
//    }
//    else
//    {
//    
//    }
//}
/*int main(int argc, const char *arv[])
{
    int sex, choice;
    printf("(1)酒心巧克力   (2)扇贝巧克力 (3)果仁巧克力\n");
    printf("请选择你喜欢的巧克力(1, 2, 3): ");
    scanf("%d", &choice);
    printf("请输入您的性别(1: 男生 2: 女生): ");
    scanf("%d", &sex);
    
    if (sex ==1) {
        if (choice == 1) {
            printf("您是一个恋爱高手, 很会讨女孩子喜欢\n");
        }
        else if (choice ==2)
        {
            printf("您是一个胆小的人, 总是担心自己不够好\n");
        }
        else if(choice ==3)
        {
            printf("您对女孩子一心一意, 但是她总是感觉不到\n");
        }
        else{
            printf("您输入了一个错误选项\n");
        }
    }
    else if(sex ==2)
    {
        if (choice == 1) {
            printf("在恋爱中, 您往往处于劣势\n");
        }
        else if (choice ==2)
        {
            printf("您是一个浪漫的人, 恋爱中能够很好的调节气氛\n");
        }
        else if(choice ==3)
        {
            printf("您是一个女强人, 恋爱中总是忽略对方的感受\n");
        }
        else{
            printf("您输入了一个错误选项\n");
        }
    
    }
    else
    {
        printf("输入错误\n");
    }
    return 0;
}*/
/*#include <math.h>

int main(int argc, const char *argv[])
{
    float num;
    printf("请输入您的月消费金额 : ");
    scanf("%f", &num);
    
    if (num >= 0) {
        if (num == 0) {
            printf("零消费\n");
        }
        else if (num >= 1 && num <= 500)
        {
            printf("低消费\n");
        }
        else if(num >500 && num <= 1000)
        {
            printf("中等消费\n");
        
        }
        else
        {
            printf("高等消费\n");
        }
        
    }
    else
    {
        printf("您不仅没有花钱, 还挣钱了 %f\n", fabs(num));
    }
    
    return 0;
}*/
//跳出switch

/*switch(表达式)
{
case 常量表达式1:
    语句列表1;
    break;
case 常量表达式2:
    语句列表2;
    break;
case 常量表达式3:
    语句列表3;
    break;
case 常量表达式4:
    语句列表4;
    break;
    ...
case 常量表达式n:
    语句列表n;
    break;
default:
    语句列表;
    break;
}*/

/*int main(int argc, const char *argv[])
{
    float a, b;
    char ch;
    scanf("%f%c%f", &a, &ch, &b);
    switch (ch) {
        case '+':
            printf("a+b == %f\n", a+b);
            break;
        case '-':
            printf("a-b == %f\n" ,a-b);
            break;
        case '*':
            printf("a*b == %f\n", a*b);
            break;
        case '/':
            printf("a/b == %f\n", a/b);
            break;
        default:
            break;
    }
    return 0;
}*/
/*int main(int argc, const char *argv[])
{
    int a;
    scanf("%d", &a);
    switch (a) {
        case 1:
            printf("hello one\n");
        case 2:
            printf("hello two\n");
        case 3:
            printf("hello three\n");
        case 4:
            printf("hello four\n");
        case 5:
            printf("hello five\n");
        default:
            break;
    }
    return 0;
}*/
//http://192.168.88.54/1408/
/*int main(int argc, const char *argv[])
{
    int month;
    scanf("%d", &month);
    switch (month) {
        case 2:
        case 3:
        case 4:
            printf("春天\n");
            break;
        case 5:
        case 6:
        case 7:
            printf("夏天\n");
            break;
        case 8:
        case 9:
        case 10:
            printf("秋天\n");
            break;
        case 11:
        case 12:
        case 1:
            printf("冬天\n");
        default:
            break;
    }

    return 0;
}*/

/*int main(int argc, const char *argv[])
{
    int a=10;
    int b=20;
    a=a+b;
    b=a-b;
    a=a-b;
    printf("%d %d\n" , a, b);
    return 0;
}*/
