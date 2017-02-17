//
//  NWDAddressBookProtocol.h
//  NWDAddressBook
//
//  Created by chensongqi on 16/11/2.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWDAddressBookDefine.h"

@protocol NWDAddressBookProtocol <NSObject>

+ (instancetype)manager;

- (void)requestAutoWithSuccess:(void (^)())success failure:(void (^)())failure;

/** 获取授权状态*/
- (NWDAddressBookAuthStatus)getAuthStatus;

/** 返回联系人信息数组 */
- (NSArray *)getPersonInfoArray;

/** 弹出联系人控制器 */
- (void)presentPageOnTarget:(id)target chooseBlock:(NWDAddressBookChooseBlock)vBlock;

@end
