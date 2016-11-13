//
//  main.c
//  game
//
//  Created by qianfeng on 14-7-21.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
#include "game.h"


int main(int argc, const char * argv[])
{
    ShowToSrcee();//
    while (1) {
        if (playermoney < 10) {
            printf("玩家的积分不够玩游戏,请参加活动赚取积分\n");
            break;
        }
        if (dealermoney < 10) {
            printf("对手的积分不够玩游戏,等待对手赚取积分\n");
            break;
        }//积分判断
        bet = GetBet();//获取下注方式
     repeat: betmoney = GetAmount();//获取下注积分
        if (playermoney < betmoney ) {
            printf("玩家的积分不够, 请重新输入:\n");
            goto repeat;
        }
        if (dealermoney < betmoney) {
            printf("对手的积分不够, 请重新输入:\n");
            goto repeat;
        }
        throw();
        moneycalutor();//
        if (playermoney < 10) {
            printf("抱歉, 您的积分不够, 请参加其它活动赚取积分\n");
            break;
        }
        if (dealermoney < 10) {
            printf("对手的积分不够, 恭喜您完胜\n");
            break;
        }
        printf("是否继续游戏(任意键继续, q键退出): \n");
        if (getchar()=='q') {
            break;
        }
    }

    return 0;
}

