//
//  DetailViewController.m
//  CoreData-Demo
//
//  Created by chen songqi on 16/4/1.
//  Copyright © 2016年 niwodai. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (self.person) {
        self.nameTextField.text = self.person.name;
        self.ageTextField.text = [NSString stringWithFormat:@"%@",self.person.age];
    }
}

- (IBAction)saveAction:(id)sender {

    if (_vType == OperationAdd) {
        SomePerson *person = [NSEntityDescription insertNewObjectForEntityForName:@"SomePerson" inManagedObjectContext:_managedObjectContext];
        person.name = self.nameTextField.text;
        person.age = @([self.ageTextField.text integerValue]);
        NSError *error = nil;
        [_managedObjectContext save:&error];
        if (error) {
            NSLog(@"插入数据时，保存失败");
        } else {
            NSLog(@"插入数据时，保存成功");
        }
    } else if (_vType == OperationUpdate) {
        self.person.name = self.nameTextField.text;
        self.person.age = @([self.ageTextField.text integerValue]);
        NSError *error = nil;
        [_managedObjectContext save:&error];
        if (error) {
            NSLog(@"修改数据时，保存失败");
        } else {
            NSLog(@"修改数据时，保存成功");
        }
    }
}


@end
