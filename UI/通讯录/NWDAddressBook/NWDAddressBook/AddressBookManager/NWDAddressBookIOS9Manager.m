//
//  NWDAddressBookIOS9Manager.m
//  NWDAddressBook
//
//  Created by chensongqi on 16/11/2.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "NWDAddressBookIOS9Manager.h"

#import <ContactsUI/ContactsUI.h>

@interface NWDAddressBookIOS9Manager ()  <CNContactPickerDelegate>

@property(nonatomic,copy) NWDAddressBookChooseBlock chooseBlock;

@end

@implementation NWDAddressBookIOS9Manager

+ (NWDAddressBookIOS9Manager *)manager
{
    static NWDAddressBookIOS9Manager *sharedInstance = nil;
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
    [[[CNContactStore alloc]init] requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if(granted){
            dispatch_async(dispatch_get_main_queue(), ^{
                success();
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                failure();
            });
        }
    }];
}

- (NWDAddressBookAuthStatus)getAuthStatus
{
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    if (status == CNAuthorizationStatusNotDetermined) {
        return NWDAddressBookAuthStatusNotDetermined;
    } else if (status == CNAuthorizationStatusAuthorized){
        return NWDAddressBookAuthStatusAuthorized;
    } else if (status == CNAuthorizationStatusDenied){
        return NWDAddressBookAuthStatusDenied;
    } else {
        return NWDAddressBookAuthStatusRestricted;
    }
}

- (NSArray *)getPersonInfoArray
{
    NSMutableArray *personArray = [NSMutableArray array];
    CNContactStore *contactStore = [[CNContactStore alloc] init];
    NSArray *keys = @[CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey];
    CNContactFetchRequest *request = [[CNContactFetchRequest alloc] initWithKeysToFetch:keys];
    [contactStore enumerateContactsWithFetchRequest:request error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
        NWDPersonInfoEntity *personEntity = [[NWDPersonInfoEntity alloc] init];
        NSString *lastname = contact.familyName;
        NSString *firstname = contact.givenName;
        personEntity.lastname = lastname;
        personEntity.firstname = firstname;
        NSMutableString *fullname = [[NSString stringWithFormat:@"%@%@",lastname,firstname] mutableCopy];
        [fullname replaceOccurrencesOfString:@"(null)" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, fullname.length)];
        personEntity.fullname = fullname;
        NSArray *phoneNums = contact.phoneNumbers;
        NSString *fullPhoneStr = [NSString string];
        for (CNLabeledValue *labeledValue in phoneNums) {
            CNPhoneNumber *phoneNumer = labeledValue.value;
            NSString *phoneValue = phoneNumer.stringValue;
            if (phoneValue.length > 0) {
                fullPhoneStr = [fullPhoneStr stringByAppendingString:phoneValue];
                fullPhoneStr = [fullPhoneStr stringByAppendingString:@","];
            }
        }
        if (fullPhoneStr.length > 1) {
            personEntity.phoneNumber = [fullPhoneStr substringToIndex:fullPhoneStr.length - 1];
        }
        [personArray addObject:personEntity];
    }];
    return personArray;
}

- (void)presentPageOnTarget:(id)target chooseBlock:(NWDAddressBookChooseBlock)vBlock
{
    self.chooseBlock = vBlock;
    CNContactPickerViewController *contactVc = [[CNContactPickerViewController alloc] init];
    contactVc.delegate = self;
    [target presentViewController:contactVc animated:YES completion:nil];
}

/**
 *  这个是点击详情页里面的一个字段才回调的方法
 */
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty
{
    if (![contactProperty.value isKindOfClass:CNPhoneNumber.class]) {
        self.chooseBlock(nil);
        return;
    }
    CNPhoneNumber *phoneNumer = contactProperty.value;
    NSString *phoneValue = phoneNumer.stringValue;
    phoneValue = [phoneValue stringByReplacingOccurrencesOfString:@"+86" withString:@""];
    phoneValue = [phoneValue stringByReplacingOccurrencesOfString:@"-" withString:@""];
    phoneValue = [phoneValue stringByReplacingOccurrencesOfString:@" " withString:@""];
    phoneValue = [phoneValue stringByReplacingOccurrencesOfString:@"\u00a0" withString:@""];
    if ([phoneValue hasPrefix:@"12593"] || [phoneValue hasPrefix:@"17951"]) {
        phoneValue = [phoneValue substringFromIndex:5];
    }
    
    NWDPersonInfoEntity *personEntity = [[NWDPersonInfoEntity alloc] init];
    personEntity.lastname = contactProperty.contact.familyName;
    personEntity.firstname = contactProperty.contact.givenName;
    NSMutableString *fullname = [[NSString stringWithFormat:@"%@ %@",personEntity.firstname,personEntity.lastname] mutableCopy];
    [fullname replaceOccurrencesOfString:@"(null)" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, fullname.length)];
    personEntity.fullname = fullname;
    personEntity.phoneNumber = phoneValue;
    if (self.chooseBlock && ![self.chooseBlock isEqual:[NSNull null]] ) {
        self.chooseBlock(personEntity);
    }
}

@end
