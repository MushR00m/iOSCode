//
//  main.c
//  栈与队列
//
//  Created by qianfeng on 14-7-30.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
/*
//宏定义
#define LEN 100

#define HELLO printf("hello world\n");

#define PI 3.1415926
#define L  2
#define S  L*L*PI

#define PRINT printf("hello world\n");printf("qianfeng\n");

#define  MAX(a,b) (a)>(b)?(a):(b)

#define  max(a,b,c) {if(a>b)\
                    {c=a;}\
                    else\
                    {c=b;}\
                    }

//a++>b?a++:b

int main(int argc, const char * argv[])
{
//    HELLO;
//    int a=5;
//    if (a>0)
//    {
//        PRINT
//    }
//    else
//    {
//        printf("hello world\n");
//    }
//
    //printf("%d ",MAX(3, 5));
    int c;
    max(3, 5, c);
    printf("%d\n",c);
    
    return 0;
}*/

#include <string.h>

#define MAXSIZE 12

enum {
    FALSE,
    TRUE
};

typedef int  dataType;

/*typedef struct Stack
{
    dataType data[MAXSIZE];
    int top;
}Stack;

void InitStack(Stack *s)
{
    s->top =-1;
    memset(s->data, 0, MAXSIZE*sizeof(dataType);
}

int push(Stack *s, dataType n)
{
    if (s->top == MAXSIZE-1) {
        return FALSE;
    }
    s->top++;
    s->data[s->top]=n;
    return TRUE;
}

int pop(Stack *s, dataType *e)
{
    if (s->top==-1) {
        return FALSE;
    }
    *e = s->data[s->top];
    s->top--;
    return TRUE;
}
int main(int argc, const char *argv[])
{
    int a;
    Stack Sta;
    InitStack(&Sta);
    for (int i=0; i<5; i++) {
        scanf("%d",&a);
        push(&Sta, a);
    }
    
    while (pop(&Sta, &a)) {
        printf("%d ",a);
    }
    return 0;
}*/

//共享栈

typedef struct Stack{
    
    dataType data[MAXSIZE];
    int top1;
    int top2;
    
}DoubleStack;

void InitStack(DoubleStack *s)
{
    s->top1 = -1;
    s->top2 = MAXSIZE;
    memset(s->data,0, MAXSIZE*sizeof(dataType));
}

int push(DoubleStack *s, dataType n, int number)
{
    if (s->top1+1==s->top2) {
        return FALSE;
    }
    if (number ==1) {
        s->top1++;
        s->data[s->top1]=n;
    }else if (number==2)
    {
        s->top2--;
        s->data[s->top2]=n;
    }
    else
    {
        return FALSE;
    }
    return TRUE;
}

int pop(DoubleStack *s, dataType *e, int number)
{
    if (number == 1) {
        if (s->top1 == -1) {
            return FALSE;
        }
        *e = s->data[s->top1];
        s->top1--;
    }
    else if (number == 2)
    {
        if (s->top2 == MAXSIZE) {
            return FALSE;
        }
        *e = s->data[s->top2];
        s->top2++;
    }
    else
    {
        return  FALSE;
    }
    return TRUE;
}

int main(int argc, const char *argv[])
{
    int temp;
    DoubleStack Sta;
    InitStack(&Sta);
    push(&Sta, 5, 1);
    pop(&Sta,&temp,1);
    printf("%d\n",temp);
    
    push(&Sta, 10, 2);
    pop(&Sta, &temp, 2);
    printf("%d\n",temp);
    
    return 0;
}


