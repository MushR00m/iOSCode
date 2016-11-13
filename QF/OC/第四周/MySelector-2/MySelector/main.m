//
//  main.m
//  MySelector
//
//  Created by bencai on 14-8-6.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    Student* stu1 = [[Student alloc]init];
    Student* stu2 = [[Student alloc]init];
    Student* stu3 = [[Student alloc]init];

    stu1.name = @"Sam";
    stu1.age = 30;
    stu2.name = @"Lee";
    stu2.age = 23;
    stu3.name = @"Alex";
    stu3.age = 26;
    
    NSMutableArray* stus = [[NSMutableArray alloc]init];
    [stus addObject:stu1];
    [stus addObject:stu2];
    [stus addObject:stu3];
    NSLog(@"---Before Sorting");
    for (int i = 0; i < [stus count]; i++) {
      Student* tmpStu = [stus objectAtIndex:i];
      NSLog(@"Name:%@,Age:%i",tmpStu.name,tmpStu.age);
    }
      //SEL
    [stus sortUsingSelector:@selector(compareName:)];
    NSLog(@"---After Sorting");
    for (Student* tStu in stus) {
      NSLog(@"Name:%@,Age:%i",tStu.name,tStu.age);
    }
      //SEL
    [stus sortUsingSelector:@selector(compareAge:)];
    NSLog(@"---After Age Sorting");
    for (Student* tStu in stus) {
      NSLog(@"Name:%@,Age:%i",tStu.name,tStu.age);
    }
  

    
    
      
  }
    return 0;
}

