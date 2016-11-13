//
//  Account+currency.h
//  MyBank
//
//  Created by bencai on 14-8-14.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "Account.h"

@interface Account (currency)
- (void)deposit:(double)money withForeignCurrency:(char)type;//存款
- (double)withdraw:(double)money withForeignCurrency:(char)type;//提款
@end
