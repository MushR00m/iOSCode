//
//  ViewController.m
//  AddressBookUI_iOS7
//
//  Created by chensongqi on 16/8/8.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"
#import <AddressBookUI/AddressBookUI.h>

#import <ContactsUI/ContactsUI.h>//ios9

@interface ViewController () <ABPeoplePickerNavigationControllerDelegate, CNContactPickerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


/*- (IBAction)iOS9Action:(id)sender {
    
    // 1. 创建控制器
    CNContactPickerViewController * picker = [CNContactPickerViewController new];
    // 2. 设置代理
    picker.delegate = self;
    // 3. 设置相关属性，谓词筛选email地址是@mac.com的联系人
    //picker.predicateForSelectionOfProperty = [NSPredicate predicateWithFormat:@"(key == 'emailAddresses') AND (value LIKE '*@mac.com')"];
    // 谓词筛选email地址数等于1的联系人
    //picker.predicateForSelectionOfContact = [NSPredicate predicateWithFormat:@"emailAddresses.@count == 1"];
    // 4. 弹出
    [self presentViewController: picker  animated:YES completion:nil];
}*/


// 取消选中联系人的时候调用，点击右上角的cancel时候触发，而不是picker的所有dismiss动作中都会触发。在多选模式下，cancel在done的左侧。
/*- (void)contactPickerDidCancel:(CNContactPickerViewController *)picker {
    NSLog(@"contactPickerDidCancel");
}*/

// 选择联系人的时候调用 （如果predicateForSelectionOfContact属性没被设置或符合筛选条件，如不符合则不会触发该方法并进入联系人详情页）
/*- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact {
    //1. 获取姓名 ，givenName == firstName
    NSLog(@"givenName: %@, familyName: %@", contact.givenName, contact.familyName);
    //2. 获取电话，泛型，会在数组遍历时帮很大的忙
    for (CNLabeledValue *labeledValue in contact.phoneNumbers) {
        NSLog(@"label: %@",labeledValue.label);
        CNPhoneNumber *phoneNumber = labeledValue.value;
        NSLog(@"phoneNumber: %@",phoneNumber.stringValue);
    }
}*/

/*
#pragma mark - 实现了此方法, 就可以选择多个联系人，该方法在点击done按钮时触发，注意：该方法不受predicateForSelectionOfContact属性影响！
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContacts:(NSArray<CNContact *> *)contacts {
    for (CNContact *contact in contacts) {
        NSLog(@"givenName: %@, familyName: %@", contact.givenName, contact.familyName);
        //2. 获取电话，泛型，会在数组遍历是帮很大的忙
        for (CNLabeledValue *labeledValue in contact.phoneNumbers) {
            NSLog(@"label: %@",labeledValue.label);
            CNPhoneNumber *phoneNumber = labeledValue.value;
            NSLog(@"phoneNumber: %@",phoneNumber.stringValue);
        }
    }
}

#pragma mark - 点击某个联系人的某个属性（property）时触发并返回该联系人属性（contactProperty）。
//只实现该方法时，可以进入到联系人详情页面（如果predicateForSelectionOfProperty属性没被设置或符合筛选条件，如不符合会触发默认操作，即打电话，发邮件等）。
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty {
    NSLog(@"didSelectContactProperty");
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //1. 创建联系人选择控制器
    ABPeoplePickerNavigationController *picker = [ABPeoplePickerNavigationController new];
    //2. 设置代理，注意不是 Delegate
    picker.peoplePickerDelegate = self;
//    if([[UIDevice currentDevice].systemVersion floatValue] >= 8.0){
//        picker.predicateForSelectionOfProperty = [NSPredicate predicateWithValue:false];
//    }
    //3. 模态视图弹出
    [self presentViewController:picker animated:YES completion:nil];
}

/**
 iOS7和iOS8的区别
 1.iOS7必须实现peoplePickNavigationControllerDidCancel方法，否则iOS7崩溃
 2.iOS7可以同时实现两个代理方法，iOS8只能实现一个（同时实现会执行didSelectPerson:方法）
 3.iOS7 选择联系人代理方法：如果返回值为YES，则会调到下一个界面，如果返回NO，必须手动实现取消控制器的方法，iOS8默认会在点击联系人的时候，自动曲线显示控制器
 注意:iOS7和iOS8的代理方法都必须取出来，这样才能适配7和8
 */

#pragma mark - Delegate
/**
 第一个代理方法：选中某个联系人时调用（iOS8之后实现后再无法调用第2个的方法）
 */
//- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person NS_AVAILABLE_IOS(8_0);
//{
//    CFStringRef lastName = ABRecordCopyValue(person, kABPersonLastNameProperty);
//    NSString *lastNameStr = (__bridge NSString *)(lastName);
//    NSLog(@"lastNameStr = %@",lastNameStr);
//    CFRelease(lastName); // 使用__bridge type 方法记得释放！
//}

/**
 
 */

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier NS_AVAILABLE_IOS(8_0);
{
    // 获取该联系人多重属性--电话号
    ABMutableMultiValueRef phoneMulti = ABRecordCopyValue(person, kABPersonPhoneProperty);
    
    // 获取该联系人的名字，简单属性，只需ABRecordCopyValue取一次值
    ABMutableMultiValueRef firstName = ABRecordCopyValue(person, kABPersonFirstNameProperty);
    NSString *name = (__bridge NSString *)(firstName);
    // 获取点击的联系人的电话
    NSLog(@"联系人名字 ： %@",name);
    
    
    
    // 点击某个联系人电话后dismiss联系人控制器，并回调点击的数据  
    [self dismissViewControllerAnimated:YES completion:^{
        // 从多重属性——电话号中取值，参数2是取点击的索引
            CFIndex vIndex = ABMultiValueGetIndexForIdentifier(phoneMulti,identifier);
        if (vIndex > 0) {
            NSString *aPhone =  (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(phoneMulti, vIndex);
            // 获取点击的联系人的电话，也可以取标签等
            NSLog(@"联系人电话 ： %@",aPhone);
            // 去掉电话号中的 "-"
            aPhone = [aPhone stringByReplacingOccurrencesOfString:@"-" withString:@"" ];
            NSLog(@"去掉-号 ： %@",aPhone);

        } else {
            NSLog(@"index < 0");
        }

        
    }];
    
    CFRetain(person);
    CFRetain((__bridge CFTypeRef)(peoplePicker));


}

/**
 第三个代理方法：取消选中联系人的时候调用
 */
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    NSLog(@"peoplePickerNavigationControllerDidCancel");
}


/**
 4.下面两个是iOS7选择联系人代理方法，iOS 8之前才会调用，适配iOS 7时实现，适配iOS 8之后使用上面两个方法
 1.返回YES，则会跳转到联系人详情页面，如果返回NO必须手动实现控制器dismiss方法
 
 - (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person NS_DEPRECATED_IOS(2_0, 8_0);
 
 
 2.返回NO不会执行默认的操作，如：打电话，必须手动实现控制器dismiss方法
 
 - (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier NS_DEPRECATED_IOS(2_0, 8_0);
 
 */
@end
