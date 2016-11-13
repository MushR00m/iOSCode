//
//  main.c
//  结构体
//
//  Created by qianfeng on 14-7-29.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
/*struct Goods
{
    char name[20];
    float price;
};

//.运算符访问结构体成员变量
int main(int argc, const char * argv[])
{
    struct Goods good;
    //good.name="hello world";错误赋值方法
    strcpy(good.name, "益达");
    good.price = 12.34;
    printf("商品名: %s  价格: %f\n", good.name, good.price);
    return 0;
}*/
//typedef
//用法1: char *p,q;
//typedef char * pstr;
//
////用法2:结合结构体使用
////
//typedef struct Book{
//    char name[20];
//    float price;
//}BOOK;
//用法3:

//typedef unsigned long  size_t;
//typedef unsigned int   size_t;

//用法4:复杂类型

/*int main(int argc, const char *argv[])
{
    pstr p,q;
    p=(pstr)malloc(100);
    q=(pstr)malloc(100);
    strcpy(p, "hello world");
    strcpy(q, "qian feng");
    printf("%s\n%s\n", p,q);
    return 0;
}*/

/*int main(int argc, const char *argv[])
{
    BOOK book1;
    strcpy(book1.name,"三国演义");
    book1.price = 38.8;
    printf("%s\n%f\n", book1.name,book1.price);
    return 0;
}*/

/*int add(int a, int b)
{
    return a+b;
}
typedef int (*pfunc)(int,int);
typedef void (*phello)(void);

void print(void)
{
    printf("hello world!\n");
}
int main(int argc, const char *argv[])
{
    //int (*p)(int ,int)= add;
    pfunc q=add;
    printf("%d\n",q(3,5));
    phello prt=print;
    prt();
    return 0;
}*/

//定义结构体的同时定义结构体变量
/*struct Stu
{
    char name[20];
    int score;
}stu1={"hang",34},stu2={"fghjk",67};
//只能在定义结构体的时候定义变量
struct
{
    char name[20];
    int score;
}student;

int main(int argc, const char *argv[])
{
//    struct Stu stu3;
//    
//    strcpy(stu1.name,"张三");
//    stu1.score= 90;
//    printf("%s\n%d\n",stu1.name,stu1.score);
    strcpy(student.name,"李四");
    student.score= 78;
    printf("%s\n%d\n",student.name,student.score);

}*/
//定义一个学生的结构体数组, 输入5个学生的姓名跟成绩, 按照学生成绩的高低输出

//结构体数组
//typedef struct Stu{
//    char name[20];
//    int ID;
//    int score;
//}STU;

/*int main(int argc, const char *argv[])
{
    STU student[5];
    STU temp;
    int i,j;
    for (i=0; i<5; i++) {
        scanf("%s%d",student[i].name,&student[i].score);
    }
    
    for (i=0; i<5-1; i++) {
        for (j=0; j<4-i; j++) {
            if (student[j].score<student[j+1].score) {
                temp = student[j+1];
                student[j+1]=student[j];
                student[j]=temp;
            }
        }
    }
    for (i=0; i<5; i++) {
        printf("姓名: %s 成绩: %d\n",student[i].name,student[i].score);
    }
    return 0;
}*/

//结构体初始化

/*int main(int argc, const char *argv[])
{
    STU st1={"张三",8,90};
    STU stu[3]={{"张三",8,90},{"李四",8,90},{"王五",8,90}};
    printf("%s %d %d\n", st1.name, st1.ID,st1.score);
    


    return 0;
}*/

//结构体指针
//typedef struct Stu{
//    char name[20];
//    int ID;
//    int score;
//}STU,*PStu;

//->

/*int main(int argc, const char *argv[])
{
    PStu student;
    //STU *student
    student = (PStu)malloc(sizeof(struct Stu)*100);
    
    strcpy(student[0].name,"zhangsan");
    student[0].ID = 23;
    student[0].score = 98;
    
    printf("%s %d %d\n", student[0].name, student[0].ID,student[0].score);
    return 0;
}*/


/*int main(int argc, const char *argv[])
{
    STU student={"张三",23, 98};
    PStu pstudent=&student;
    printf("%s %d %d\n", pstudent->name, pstudent->ID,pstudent->score);
    
    return 0;
}*/

/*struct Book{
    
    char ch;
    int a;
    //long b;
    char name[15];
    
    float price;
};

int main(int argc, const char *argv[])
{
    printf("%ld\n",sizeof(struct Book));

    return 0;
}*/


//练习: 定义一个学生的结构体指针数组, 利用学生的成绩进行排序, 打印出所有学生的成绩
//10个人对3个人投票,每一个人只有1次投票权,输入投票选择,输出投票结果
/*struct Person{
    char name[20];
    int n;
};

int main(int argc, const char *argv[])
{
    struct Person Per[3]={{"zhangsan",0},{"lisi",0},{"wangwu",0}};
    struct Person person;
    for (int i=0; i<10; i++) {
        scanf("%s%d",person.name,&person.n);
        for (int j=0; j<3; j++)
        {
            if (strcmp(person.name, Per[j].name)==0) {
                Per[j].n++;
                break;
            }
        }
    }
    
    for (int i=0; i<3; i++)
    {
        printf("姓名: %s 票数: %d\n", Per[i].name,Per[i].n);
    }
    return 0;
}*/

typedef struct Stu{
    char name[20];
    int score;
}*pStu;

int main(int argc, const char *argv[])
{
    pStu student[5];
    
    for (int i=0; i<5; i++) {
        student[i]=malloc(sizeof(struct Stu));
        scanf("%s%d", student[i]->name, &student[i]->score);
    }
    
    for (int i=0; i<5-1; i++) {
        for (int j=0; j<4-i; j++) {
            if (student[j]->score>student[j+1]->score) {
                pStu temp;
                temp = student[j+1];
                student[j+1]=student[j];
                student[j] = temp;
            }
        }
    }
    
    for (int i=0; i<5; i++) {
        printf("姓名: %s 分数: %d\n", student[i]->name,student[i]->score);
    }
    
    return 0;
}
