//
//  NWDAddressBookManager.m
//  NWDAddressBook
//
//  Created by chensongqi on 16/11/2.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "NWDAddressBookManager.h"

#import "NWDAddressBookIOS7Manager.h"
#import "NWDAddressBookIOS8Manager.h"
#import "NWDAddressBookIOS9Manager.h"


@implementation NWDAddressBookManager

+ (NWDAddressBookManager *)manager
{
    static NWDAddressBookManager *sharedInstance = nil;
    if (!sharedInstance) {
        static dispatch_once_t once;
        dispatch_once(&once, ^{
            sharedInstance = [[self alloc] init];
        });
    }
    return sharedInstance;
}

- (void)requestAutoWithSuccess:(void (^)())success failure:(void (^)())failure
{
    if (AD_IS_OS_7_OR_EARLIER) {
        return [[NWDAddressBookIOS7Manager manager] requestAutoWithSuccess:success failure:failure];
    } else if (AD_IS_OS_8_OR_EARLIER) {
        return [[NWDAddressBookIOS8Manager manager] requestAutoWithSuccess:success failure:failure];
    } else {
        return [[NWDAddressBookIOS9Manager manager] requestAutoWithSuccess:success failure:failure];
    }
}

- (NWDAddressBookAuthStatus)getAuthStatus
{
    if (AD_IS_OS_7_OR_EARLIER) {
        return [[NWDAddressBookIOS7Manager manager] getAuthStatus];
    } else if (AD_IS_OS_8_OR_EARLIER) {
        return [[NWDAddressBookIOS8Manager manager] getAuthStatus];
    } else {
        return [[NWDAddressBookIOS9Manager manager] getAuthStatus];
    }
}

- (NSArray *)getPersonInfoArray
{
    if (AD_IS_OS_7_OR_EARLIER) {
        return [[NWDAddressBookIOS7Manager manager] getPersonInfoArray];
    } else if (AD_IS_OS_8_OR_EARLIER) {
        return [[NWDAddressBookIOS8Manager manager] getPersonInfoArray];
    } else {
        return [[NWDAddressBookIOS9Manager manager] getPersonInfoArray];
    }
}

- (void)presentPageOnTarget:(id)target chooseBlock:(NWDAddressBookChooseBlock)vBlock
{
    if (AD_IS_OS_7_OR_EARLIER) {
        [[NWDAddressBookIOS7Manager manager] presentPageOnTarget:target chooseBlock:vBlock];
    } else if (AD_IS_OS_8_OR_EARLIER) {
        [[NWDAddressBookIOS8Manager manager] presentPageOnTarget:target chooseBlock:vBlock];
    } else {
        [[NWDAddressBookIOS9Manager manager] presentPageOnTarget:target chooseBlock:vBlock];
    }
}

@end
