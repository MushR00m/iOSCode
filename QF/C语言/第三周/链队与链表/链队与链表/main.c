//
//  main.c
//  链队与链表
//
//  Created by qianfeng on 14-8-1.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

typedef int dataType;

typedef enum bool
{
    FALSE,
    TRUE
}BOOL;

//结点数据结构
typedef struct node
{
    dataType data;
    struct node *next;
}node, *pNode;

typedef struct LinkQueue
{
    pNode front;
    pNode rear;
}LinkQueue;

BOOL InitQueue(LinkQueue *Q)
{
    
    Q->front=Q->rear = (node *)malloc(sizeof(node));
    if (Q->front==NULL) {
        return FALSE;
    }
    Q->front->next = NULL;

    return TRUE;
}

BOOL Enqueue(LinkQueue  *Q, dataType e)
{
    pNode s=(node *)malloc(sizeof(node));
    if (!s) {
        return FALSE;
    }
    s->data = e;
    s->next =NULL;
    Q->rear->next = s;
    Q->rear = s;
    return TRUE;
}

BOOL Dequeue(LinkQueue *Q, dataType *e)
{
    pNode p;
    p=Q->front->next;
    if (Q->front == Q->rear) {//队列为空
        return FALSE;
    }
    *e = p->data;
    Q->front->next = p->next;
    if (p==Q->rear)
    {
        Q->rear=Q->front;
    }
    free(p);
    return TRUE;
}

int main(int argc, const char * argv[])
{
    dataType temp;
    LinkQueue Q;
    InitQueue(&Q);
    Enqueue(&Q, 12);
    Dequeue(&Q,&temp);
    printf("%d ",temp);
    return 0;
}

