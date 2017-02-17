//
//  NWDAddressBookDefine.h
//  NWDAddressBook
//
//  Created by chensongqi on 16/11/2.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#ifndef NWDAddressBookDefine_h
#define NWDAddressBookDefine_h

#import "NWDPersonInfoEntity.h"
#import <UIKit/UIKit.h>
// 因为9之后不一样
typedef NS_ENUM(NSUInteger, NWDAddressBookAuthStatus) {
    NWDAddressBookAuthStatusNotDetermined = 0,
    NWDAddressBookAuthStatusRestricted,
    NWDAddressBookAuthStatusDenied,
    NWDAddressBookAuthStatusAuthorized,
};

typedef void(^NWDAddressBookChooseBlock)(NWDPersonInfoEntity *vPerson);

#define AD_IS_OS_7_OR_EARLIER         ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.99)
#define AD_IS_OS_8_OR_EARLIER         ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.99)
#define AD_IS_OS_9_OR_EARLIER         ([[[UIDevice currentDevice] systemVersion] floatValue] < 9.99)


#endif /* NWDAddressBookDefine_h */
