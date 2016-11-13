//
//  Account_dollar.h
//  MyBank
//
//  Created by bencai on 14-8-14.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "Account.h"
#include "Account_dollar.h"

@interface Account (){
  char _currency_type;
  double _foreign_rate;
  double foreign_amount;
}
@property (assign) char currency_type;
@property (assign) double foreign_rate;
@property (assign) double foreign_amount;

@end
