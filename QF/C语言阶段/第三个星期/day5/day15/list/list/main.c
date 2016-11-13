//
//  main.c
//  list
//
//  Created by qianfeng on 14-7-31.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

typedef char DataType;

typedef struct node{
    DataType data;
    struct node *next;
}ListNode;

typedef ListNode * LinkList;

//LinkList head; //定义一个指向单链表的头指针


//1. 建立单链表
//头插法
//从一个空表开始,重复读入数据,生成新结点,将读入的数据存放在新结点的数据域中,然后将新结点插入到当前链表的表头上,直到读入结束标志为止.

//假设数据域为字符型数据

/*LinkList CreatListHead()
{
    LinkList head;
    ListNode *p;
    char ch;
    head = NULL;
    ch=getchar();
    while (ch!='\n') {
        p=(ListNode *)malloc(sizeof(ListNode));//申请新结点
        p->data=ch;
        p->next=head;
        head = p;
        ch = getchar();//读入下一个字符
    }

    return head;
}*/

LinkList CreatListHeadNode()
{
    LinkList head;
    ListNode *p;
    char ch;
    head = (ListNode *)malloc(sizeof(ListNode));
    head->next =NULL;
    
    ch=getchar();
    while (ch!='\n') {
        p=(ListNode *)malloc(sizeof(ListNode));//申请新结点
        p->data=ch;
        p->next=head->next;
        head->next = p;
        ch = getchar();//读入下一个字符
    }
    
    return head;
}


//尾插法

/*LinkList CreateListRear()
{
    LinkList   head,rear;
    ListNode *p;
    char ch;
    head = NULL;
    rear = NULL;
    ch = getchar();
    while (ch!='\n') {
        p=(ListNode *)malloc(sizeof(ListNode));
        p->data = ch;
        if (head ==NULL) {
            head = p;
        }
        else
            rear->next = p;
        rear = p;
        ch = getchar();
    }
    if (rear !=NULL) {//判断是否非空, 非空尾指针指向空
        rear->next=NULL;
    }
    return  head;
}*/

//为了简化算法,可在链表开始的开始结点之前附加一个结点,并称为头结点

LinkList CreateListRearNode()
{
    LinkList head = (ListNode *)malloc(sizeof(ListNode));
    ListNode *p,*r;//需要一个中间变量r来进行交换
    DataType ch;
    r=head;
    while ((ch=getchar())!='\n') {
        p=(ListNode *)malloc(sizeof(ListNode));
        p->data = ch;
        r->next = p;
        r=p;
    }
    r->next = NULL;
    return head;
}

//链表查找运算

//查找到相应的结点, 并返回对应结点的地址(带头结点)
ListNode *GetNodeindex(LinkList head, int i)
{
    //head为头结点的单链表的头指针, i为要查找的结点序号
    ListNode *p; int j;
    p=head->next;
    j=1;
    while (p!=NULL && j<i) {
        p=p->next;
        ++j;
    }
    if (j==i) {//判断是否查找到
        return p;
    }
    else
        return NULL;

}

//按节点值查找(带头结点)
//在单链表中按值查找结点,就是从链表的开始结点出发,顺序将结点的值和给定值K进行比较,若遇到相等的值,则返回该结点的存储位置,否则返回null,按值查找算法要比按序号查找更为简单
ListNode *LocateNodeK(LinkList head, DataType k)
{
    ListNode *p = head->next;
    while (p&&p->data!=k) {
        p=p->next;
    }
    return p;
}

//插入运算(带头结点)
//成功失败,可返回一个状态
void  InsertList(LinkList head, int i, DataType x)
{
    ListNode *p, *s;
    int j;
    p=head;
    j=0;
    while (p!=NULL && j<i-1) {
        p=p->next;
        ++j;
    }
    if (p==NULL) {
        return;
    }
    else {
        s= (ListNode *)malloc(sizeof(ListNode));//申请新结点
        s->data = x;
        s->next=p->next;
        p->next = s;
    }

}

//删除运算(带头结点)
//删除运算就是将链表的第i个结点从表中删去.由于第i个结点的存储地址是存储在第 i-1个结点的指针域next中, 因此要先使 p 指向第i-1个结点,然后使得p->next指向第i+1个结点, 再将第i个结点释放

DataType DeleteList(LinkList head, int i)
{
    ListNode *p, *s;
    DataType x;
    int j;
    p=head;
    j=0;
    while (p!=NULL && j<i-1) {
        p=p->next;
        ++j;
    }
    if (p==NULL) {
        exit(0);
    }
    else{
        s=p->next;
        p->next=s->next;
        x=s->data;
        free(s);
        return x;
    }

}
int main(int argc, const char * argv[])
{
    LinkList head;
    //head = CreatListHead();
    head = CreatListHeadNode();
    //CreatListHeadNode();
    //InsertList(head, 5, 'A');
    //GetNodeindex(LinkList head, int i)
    ListNode *temp = GetNodeindex(head, 1);
    
    printf("%c\n",temp->data);
    
    return 0;
}

