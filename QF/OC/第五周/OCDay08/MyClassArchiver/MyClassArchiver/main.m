//
//  main.m
//  MyClassArchiver
//
//  Created by bencai on 14-8-13.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[])
{

  @autoreleasepool {
#if 0
      //系统类型的归档和解档操作
    NSDictionary* aDic = [[NSDictionary alloc]initWithObjectsAndKeys:@"hello",@"one",@"1000phone",@"two", nil];
    NSString* path = @"/Users/bencai/Desktop/aDic.archive";
      //系统类的对象归档
    [NSKeyedArchiver archiveRootObject:aDic toFile:path];
    
    NSDictionary* bDic = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    NSLog(@"bDic:%@",bDic);
    NSLog(@"aDic:%@",aDic);
#endif
    
    Student* aStu = [[Student alloc] init];
    NSLog(@"aStu:%@",aStu);
    
    NSString* path = @"/Users/bencai/Desktop/aStu.archive";
    
    [NSKeyedArchiver archiveRootObject:aStu toFile:path];
    
    Student* bStu = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"bStu:%@",bStu);

    
    
  }
    return 0;
}

