//
//  main.c
//  枚举联合
//
//  Created by qianfeng on 14-7-29.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
//union

//union number
//{
//    int amout;
//    float weight;
//};
#include <string.h>

/*
union Book{
    char name[19];
    float price;
    int a;
    long b;
};

int main(int argc, const char * argv[])
{
//    union Book book;
//    printf("%p %p\n", book.name,&book.price);
//    strcpy(book.name,"百年孤独");
//    printf("%s\n",book.name);
//    printf("%s\n",(char *)&book.price);
//    strcpy((char *)&book.price,"红楼梦");
//    
//    printf("%s\n",book.name);
//    printf("%s\n",(char *)&book.price);

//    printf("%ld\n", sizeof(union Book));
    return 0;
}*/


/*struct Goods
{
    char name[20];
    float price;
    union Number
    {
        float weight;//库存
        int amount;
    }number;
    struct Date
    {
        int year;//生产日期
        int month;
        int day;
    }date;
};*/

/*
union Number
{
    float weight;//库存
    int amount;
};

struct Date
{
    int year;//生产日期
    int month;
    int day;
};

struct Goods
{
    char name[20];
    float price;
    union Number number;
    struct Date date;
};

int main(int argc, const char *argv[])
{
    struct Goods rice={"rice",2.98,{456.89},{13,9,7}};
    //rice.number.weight=456.8;
    printf("商品名:%s\n价格:%f\n库存:%f千克\n生产日期:%d %d %d\n", rice.name,rice.price,rice.number.weight,rice.date.year,rice.date.month,rice.date.day);
    printf("%p %p\n",&rice.number.amount,&rice.number.weight);
    
    return 0;
}*/

//枚举
//typedef enum{
//    FALSE,
//    TRUE
//}BOOL;

//enum Color
//{
//    BLACK = 1,
//    WHITE,
//    BLUE,
//    GREEN = 5,
//    RED,
//    YELLOW
//};
//
//int main(int argc, const char *argv[])
//{
////    BOOL Bool;
////    Bool = TRUE;
////    printf("%d %d %d\n", FALSE, TRUE, Bool);
//    enum Color color;
//    color = YELLOW;
//    printf("%d ", color);
//    return 0;
//}

enum Week
{
    MON=1,
    TUE,
    WEN,
    THU,
    FRI,
    SAT,
    SUN
};

int main(int argc, const char *argv[])
{
    enum Week weekday;
    printf("%ld\n",sizeof(enum Week));
    
    scanf("%d",&weekday);
    
    switch (weekday) {
        case MON:
            printf("星期一\n");
            break;
        case TUE:
            printf("星期二\n");
            break;
        case WEN:
            printf("星期三\n");
            break;
        case THU:
            printf("星期四\n");
            break;
        case FRI:
            printf("星期五\n");
            break;
        case SAT:
            printf("星期六\n");
            break;
        case SUN:
            printf("星期天\n");
            break;
        default:
            printf("输入错误\n");
            break;
    }
    return 0;
}
