//
//  main.c
//  链队与链表
//
//  Created by qianfeng on 14-8-1.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

/*typedef int dataType;

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
    if (p==Q->rear) {
        Q->rear=Q->front;
    }
    free(p);
    return TRUE;
}

int QueueLength(LinkQueue *Q)
{
    int len=0;
    pNode p;
    p=Q->front->next;
    while (p) {
        len++;
        p=p->next;
    }
    return len;
}

void DestroyQueue(LinkQueue *Q)
{
    pNode p=Q->front;
    pNode q;
    while (p) {
        q=p;
        p=p->next;
        free(q);
    }
    Q->front=Q->rear=NULL;
}
int main(int argc, const char * argv[])
{
    dataType temp;
    LinkQueue Q;
    InitQueue(&Q);
    for (int i=0; i<50; i++) {
        Enqueue(&Q, i+10);
    }
    DestroyQueue(&Q);
//    printf("%d \n",QueueLength(&Q));
//    Dequeue(&Q, &temp);
//    printf("%d ",temp);
//    Enqueue(&Q, 112);
//    Dequeue(&Q, &temp);
//    printf("%d ",temp);
    return 0;
}
*/

typedef char dataType;

typedef struct ListNode {
    dataType data;
    struct ListNode *next;
}ListNode;

typedef ListNode * LinkList;

//创建链表
//头插法

LinkList CreateListHead()
{
    dataType ch;
    LinkList head;
    ListNode *p;
    head = (ListNode *)malloc(sizeof(ListNode));
    head -> next = NULL;
    ch=getchar();
    while (ch!='\n') {
        p=(ListNode *)malloc(sizeof(ListNode));
        p->next = head;
        p->next->data =ch;
        head = p;
        ch = getchar();

    }
    return head;
}

LinkList CreateListRear()
{
    LinkList head;
    ListNode *p,*r;
    dataType ch;
    head = (ListNode *)malloc(sizeof(ListNode));
    r = head;
    while ((ch=getchar())!='\n')
    {
        p = (ListNode *)malloc(sizeof(ListNode));
        p->data =ch;
        //p->next =NULL;
        r->next = p;
        r=p;
    }
    r->next = NULL;
    return head;
}

//查找链表中的元素
//
ListNode *ListSearch(LinkList head, int i)
{
    ListNode *p;
    p=head->next;
    int j=1;
    while (p&&j<i) {
        p=p->next;
        ++j;
    }
    if (j==i) {
        return p;
    }
    else
    {
        return NULL;
    }
}
int main(int argc, const char *argv[])
{
    ListNode *p;
    LinkList head;
    //head =CreateListHead();
    head = CreateListRear();
    p=ListSearch(head, 5);
    printf("%c ", p->data);
    
    return 0;
}


