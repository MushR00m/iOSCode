//
//  SomePerson+CoreDataProperties.h
//  CoreData-Demo
//
//  Created by chen songqi on 16/4/1.
//  Copyright © 2016年 niwodai. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SomePerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface SomePerson (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSString *name;

@end

NS_ASSUME_NONNULL_END
