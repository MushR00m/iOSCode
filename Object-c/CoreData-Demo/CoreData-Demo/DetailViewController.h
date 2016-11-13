//
//  DetailViewController.h
//  CoreData-Demo
//
//  Created by chen songqi on 16/4/1.
//  Copyright © 2016年 niwodai. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SomePerson.h"

typedef enum : NSUInteger {
    OperationAdd,
    OperationUpdate,
} OperationType;

@interface DetailViewController : UIViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@property (nonatomic, assign) OperationType vType;

@property (nonatomic, strong) SomePerson *person;

@end
