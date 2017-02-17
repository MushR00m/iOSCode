//
//  NWDAddressBookIOS8Manager.m
//  NWDAddressBook
//
//  Created by chensongqi on 16/11/2.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "NWDAddressBookIOS8Manager.h"
#import <AddressBookUI/AddressBookUI.h>

@interface NWDAddressBookIOS8Manager () <ABPeoplePickerNavigationControllerDelegate>

@property(nonatomic,copy) NWDAddressBookChooseBlock chooseBlock;

@end

@implementation NWDAddressBookIOS8Manager

+ (NWDAddressBookIOS8Manager *)manager
{
    static NWDAddressBookIOS8Manager *sharedInstance = nil;
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
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
    ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error){
        if(granted){
            dispatch_async(dispatch_get_main_queue(), ^{
                success();
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                failure();
            });
        }
        if (addressBookRef) {
            CFRelease(addressBookRef);
        }
    });
}

- (NWDAddressBookAuthStatus)getAuthStatus
{
    ABAuthorizationStatus status = ABAddressBookGetAuthorizationStatus();
    if (status == kABAuthorizationStatusNotDetermined) {
        return NWDAddressBookAuthStatusNotDetermined;
    }else if (status == kABAuthorizationStatusAuthorized){
        return NWDAddressBookAuthStatusAuthorized;
    }else if (status == kABAuthorizationStatusRestricted){
        return NWDAddressBookAuthStatusRestricted;
    }else{
        return NWDAddressBookAuthStatusDenied;
    }
}


- (NSArray *)getPersonInfoArray
{
    ABAddressBookRef addressBook = ABAddressBookCreate();
    CFArrayRef peopleArray = ABAddressBookCopyArrayOfAllPeople(addressBook);
    CFIndex peopleCount = CFArrayGetCount(peopleArray);
    
    NSMutableArray *personArray = [NSMutableArray array];
    for (int i = 0; i < peopleCount; i++) {
        
        NWDPersonInfoEntity *personEntity = [[NWDPersonInfoEntity alloc] init];
        
        ABRecordRef person = CFArrayGetValueAtIndex(peopleArray, i);
        NSString *lastName = (__bridge_transfer NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
        NSString *firstName = (__bridge_transfer NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
        personEntity.lastname = lastName;
        personEntity.firstname = firstName;
        
        NSMutableString *fullname = [[NSString stringWithFormat:@"%@%@",lastName,firstName] mutableCopy];
        [fullname replaceOccurrencesOfString:@"(null)" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, fullname.length)];
        personEntity.fullname = fullname;
        
        ABMultiValueRef phones = ABRecordCopyValue(person, kABPersonPhoneProperty);
        CFIndex phoneCount = ABMultiValueGetCount(phones);
        
        NSString *fullPhoneStr = [NSString string];
        for (int i = 0; i < phoneCount; i++) {
            NSString *phoneValue = (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(phones, i);
            if (phoneValue.length > 0) {
                fullPhoneStr = [fullPhoneStr stringByAppendingString:phoneValue];
                fullPhoneStr = [fullPhoneStr stringByAppendingString:@","];
            }
        }
        if (fullPhoneStr.length > 1) {
            personEntity.phoneNumber = [fullPhoneStr substringToIndex:fullPhoneStr.length - 1];
        }
        [personArray addObject:personEntity];
        CFRelease(phones);
    }
    CFRelease(addressBook);
    CFRelease(peopleArray);
    return personArray;
    
}


- (void)presentPageOnTarget:(id)target chooseBlock:(NWDAddressBookChooseBlock)vBlock
{
    self.chooseBlock = vBlock;
    ABPeoplePickerNavigationController *ppnc = [[ABPeoplePickerNavigationController alloc] init];
    ppnc.predicateForSelectionOfPerson = [NSPredicate predicateWithValue:false];
    ppnc.peoplePickerDelegate = self;
    [target presentViewController:ppnc animated:YES completion:nil];
}

/**
 *  当用户选中某一个联系人的某一个属性时会执行该方法,并且选中属性后会退出控制器
 */
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    ABMultiValueRef phone = ABRecordCopyValue(person, kABPersonPhoneProperty);
    if (ABMultiValueGetCount(phone) > 0 && identifier != kABMultiValueInvalidIdentifier) {
        CFIndex index = ABMultiValueGetIndexForIdentifier(phone,identifier);
        
        NSString *phoneNO = (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(phone, index >= 0 ? index: 0);
        phoneNO = [phoneNO stringByReplacingOccurrencesOfString:@"+86" withString:@""];
        phoneNO = [phoneNO stringByReplacingOccurrencesOfString:@"-" withString:@""];
        phoneNO = [phoneNO stringByReplacingOccurrencesOfString:@" " withString:@""];
        phoneNO = [phoneNO stringByReplacingOccurrencesOfString:@"\u00a0" withString:@""];
        if ([phoneNO hasPrefix:@"12593"] || [phoneNO hasPrefix:@"17951"]) {
            phoneNO = [phoneNO substringFromIndex:5];
        }
        
        CFStringRef lastName = ABRecordCopyValue(person, kABPersonLastNameProperty);
        CFStringRef firstName = ABRecordCopyValue(person, kABPersonFirstNameProperty);
        
        NSString *lastname = (__bridge_transfer NSString *)(lastName);
        NSString *firstname = (__bridge_transfer NSString *)(firstName);
        
        NWDPersonInfoEntity *personEntity = [[NWDPersonInfoEntity alloc] init];
        personEntity.lastname = lastname;
        personEntity.firstname = firstname;
        
        NSMutableString *fullname = [[NSString stringWithFormat:@"%@%@",lastname,firstname] mutableCopy];
        [fullname replaceOccurrencesOfString:@"(null)" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, fullname.length)];
        personEntity.fullname = fullname;
        
        personEntity.phoneNumber = phoneNO;
        if (self.chooseBlock && ![self.chooseBlock isEqual:[NSNull null]] ) {
            self.chooseBlock(personEntity);
        }
        if (phone) {
            CFRelease(phone);
        }
    } else {
        if (phone) {
            CFRelease(phone);
        }
        self.chooseBlock(nil);
    }
}

@end
