//
//  main.m
//  MyProtocol
//
//  Created by bencai on 14-8-13.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Boss.h"
#import "Student.h"

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    Student* aStu = [[Student alloc]init];
    [aStu setName:@"Bencai"];
    NSLog(@"The student name:%@",aStu.name);
    [aStu eat];
    [Boss testProgrammer:aStu];
    
  }
    return 0;
}

