//
//  ViewController.m
//  访问通讯录
//
//  Created by chen songqi on 15/5/26.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"

#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
@interface ViewController () <ABPeoplePickerNavigationControllerDelegate>

@property (nonatomic, strong) NSArray *listContacts;
@property (nonatomic, strong) ABPeoplePickerNavigationController *peoplePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"获取通讯录信息" forState:UIControlStateNormal];

    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

    btn.frame = CGRectMake(100,200, 200, 100);
    [self.view addSubview:btn];



    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"跳转系统通讯录" forState:UIControlStateNormal];

    [btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnClick2:) forControlEvents:UIControlEventTouchUpInside];

    btn2.frame = CGRectMake(100,300, 200, 100);
    [self.view addSubview:btn2];
}


- (void)btnClick2:(UIButton *)sender
{
    if (!_peoplePicker) {
        self.peoplePicker = [[ABPeoplePickerNavigationController alloc] init];
    }
    _peoplePicker.peoplePickerDelegate = self;
    [self presentViewController:_peoplePicker animated:YES completion:nil];
    

}

//- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person
//{
//
//}

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{

    ABMultiValueRef valuesRef = ABRecordCopyValue(person, kABPersonPhoneProperty);
    CFIndex index = ABMultiValueGetIndexForIdentifier(valuesRef,identifier);
    CFStringRef value = ABMultiValueCopyValueAtIndex(valuesRef,index);
    NSString *valueString = (__bridge NSString*)value;
    NSLog(@"valueString ----  %@",valueString);
    [self dismissViewControllerAnimated:YES completion:nil];


}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    NSLog(@"点击取消");
}
- (void)btnClick:(UIButton *)sender
{

    CFErrorRef error = NULL;
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &error);
    ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {

        if (granted) {

            [self filterContentForSearchText:@"130"];
        }
    });

    CFRelease(addressBook);
}


- (void)filterContentForSearchText:(NSString*)searchText
{

    //如果没有授权 则退出
    if (ABAddressBookGetAuthorizationStatus() != kABAuthorizationStatusAuthorized) {
        return;
    }
    CFErrorRef error = NULL;

    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &error);
    //条件查询

    CFStringRef cfSearchText = (CFStringRef)CFBridgingRetain(searchText);
//
//    if ([searchText length] == 0) {
//        //查询所有  (__bridge NSArray *)
//        //self.listContacts = CFBridgingRelease(ABAddressBookCopyPeopleWithName(addressBook, cfSearchText));
//
//        self.listContacts = (__bridge NSArray *)ABAddressBookCopyPeopleWithName(addressBook, cfSearchText);
//
//    }

   // self.listContacts = (__bridge NSArray *)ABAddressBookCopyPeopleWithName(addressBook, cfSearchText);

   self.listContacts = (__bridge NSArray *) ABAddressBookCopyArrayOfAllPeople(addressBook);

    CFRelease(cfSearchText);
    CFRelease(addressBook);

    NSLog(@"---- %@",self.listContacts);


    ABRecordRef thisPerson = CFBridgingRetain([self.listContacts objectAtIndex:2]);


    NSString *firstName = CFBridgingRelease(ABRecordCopyValue(thisPerson, kABPersonNicknameProperty));
    NSLog(@"firstName  ----  %@",firstName);
}

@end
