//
//  game.c
//  game
//
//  Created by qianfeng on 14-7-21.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
#include "game.h"
#include <stdlib.h>
#include <time.h>

int playermoney=1000;
int dealermoney=1000;
int bet;
int betmoney;
int a, b, c;



void ShowToSrcee(void)
{
    printf("欢迎体验博弈机\n");
    printf("游戏规则介绍: \n");
    printf("**********************\n");
    printf("......................\n");
    printf("**********************\n");
}
int GetBet(void)
{
    int bet;
    printf("请选择下注方式(1. 大 2. 小 3. 豹子)\n");
    scanf("%d", &bet);
    while (getchar()!='\n');//防止输入阻塞
    if (bet ==1) {
        return 1;
    }
    else if (bet ==2)
    {
        return 2;
    }
    else if (bet ==3)
    {
        return 3;
    }
    else{
        return 1;
    }
}
int GetAmount(void)
{
    int amout;
    printf("请输入下注积分: \n");
    scanf("%d", &amout);
    while (getchar()!='\n');
    if (amout<10) {
        amout = 10;
    }
    if (amout >100) {
        amout = 100;
    }
    return amout;
}

void throw()
{
    srand((unsigned)time(NULL));
    while (1) {
        printf("色子正在转动中, 请按Enter键停止转动\n");
        if (getchar()=='\n') {
            a = rand()%6;
            b = rand()%6;
            c = rand()%6;
            a++;
            b++;
            c++;
            printf("第一个骰子的点数: %d\n", a);
            printf("第二个骰子的点数: %d\n", b);
            printf("第三个骰子的点数: %d\n", c);
            break;
        }
    }
}

int Juge(int a, int b, int c)
{
    if ((a==b)&&(b==c)) {
        return 3;
    }
    else if(a+b+c<11)
    {
        return 2;
    }
    else if (a+b+c>11)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

void moneycalutor(void)
{
    switch (Juge(a, b, c)) {
        case 1:
            betmoney *=2;
            if (bet == 1) {
                playermoney += betmoney;
                dealermoney -= betmoney;
                printf("大, 玩家赢了%d积分, 玩家还剩%d积分, 对手还剩%d积分\n",betmoney, playermoney, dealermoney);
            }
            else
            {
                playermoney -= betmoney;
                dealermoney += betmoney;
                printf("大, 对手赢了%d积分, 玩家还剩%d积分, 对手还剩%d积分\n", betmoney, playermoney,dealermoney);
            }
            break;
         case 2:
            betmoney *= 2;
            if (bet==2) {
                playermoney += betmoney;
                dealermoney -= betmoney;
                printf("小, 玩家赢了%d积分, 玩家还剩%d积分, 对手还剩%d积分\n",betmoney, playermoney, dealermoney);
            }
            else
            {
                playermoney -= betmoney;
                dealermoney += betmoney;
                printf("小, 对手赢了%d积分, 玩家还剩%d积分, 对手还剩%d积分\n", betmoney, playermoney,dealermoney);
            }
            break;
        case 3:
            if (bet==3) {
                betmoney *= 10;
                playermoney += betmoney;
                dealermoney -= betmoney;
                printf("豹子, 玩家赢了%d积分, 玩家还剩%d积分, 对手还剩%d积分\n",betmoney, playermoney, dealermoney);
            }
            else
            {
                betmoney *= 2;
                playermoney -= betmoney;
                dealermoney += betmoney;
                printf("豹子, 对手赢了%d积分, 玩家还剩%d积分, 对手还剩%d积分\n", betmoney, playermoney,dealermoney);
            }
            break;
        default:
            printf("平, 没有输赢\n");
            break;
    }
}

