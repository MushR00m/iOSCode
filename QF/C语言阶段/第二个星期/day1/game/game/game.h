//
//  game.h
//  game
//
//  Created by qianfeng on 14-7-21.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#ifndef __game_h
#define __game_h

extern int bet;
extern int playermoney;
extern int dealermoney;
extern int betmoney;

void ShowToSrcee(void);
int GetBet(void);
int GetAmount(void);
void throw();
int Juge(int a, int b, int c);
void moneycalutor(void);

#endif
