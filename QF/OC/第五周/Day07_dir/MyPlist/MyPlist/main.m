//
//  main.m
//  MyPlist
//
//  Created by bencai on 14-8-12.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    NSArray* aArray = @[@"hello",@"1000phone",@123];
    
    [aArray writeToFile:@"/Users/bencai/Desktop/SecondPlist.plist" atomically:YES];
    
      //创建一个字典
    NSDictionary* aDic = [[NSDictionary alloc] initWithObjectsAndKeys:@"HELLO",@"one",@"WORLD",@"two",@123,@"three", nil];
    
      //将该字典信息写入 ThreePlist.plist
    [aDic writeToFile:@"/Users/bencai/Desktop/ThreePlist.plist" atomically:YES];
    
      //创建一个可变的字典
    NSMutableDictionary* bDic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@123,@"number",@"tang",@"string", nil];
      //添加一条新的键值对
    [bDic setObject:@YES forKey:@"bool"];
      //写入文件ThreePlist.plist
    [bDic writeToFile:@"/Users/Bencai/Desktop/ThreePlist.plist" atomically:YES];
    
    NSDictionary * cDic = [NSDictionary dictionaryWithContentsOfFile:@"/Users/Bencai/Desktop/ThreePlist.plist"];
    NSLog(@"%@",cDic);
    
    

    
    
  }
    return 0;
}

