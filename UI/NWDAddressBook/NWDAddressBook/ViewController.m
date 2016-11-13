//
//  ViewController.m
//  NWDAddressBook
//
//  Created by chensongqi on 16/11/2.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"
#import "NWDAddressBookManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NWDAddressBookManager manager] requestAutoWithSuccess:^{
        NSLog(@"授权成功");
    } failure:^{
        NSLog(@"授权失败");
    }];

}

- (IBAction)buttonAction:(id)sender {
    
    [[NWDAddressBookManager manager] presentPageOnTarget:self chooseBlock:^(NWDPersonInfoEntity *vPerson) {
       
        NSLog(@"phoneNumber: %@",vPerson.phoneNumber);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[NWDAddressBookManager manager] requestAutoWithSuccess:^{
        NSLog(@"授权成功");
        NSArray *listArray = [[NWDAddressBookManager manager] getPersonInfoArray];
        NSLog(@"---- %@",listArray);

    } failure:^{
        NSLog(@"授权失败");
    }];
}



@end
