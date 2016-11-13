//
//  main.m
//  MyDictionary
//
//  Created by bencai on 14-8-7.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    NSDictionary* oneDic = [[NSDictionary alloc]initWithObjectsAndKeys:@"BeiJing",@"One",@"Shanghai",@"Two",@"GuangZhou",@"Three", nil];
    NSLog(@"%@",oneDic);
      //create mutable Dictionary
    NSMutableDictionary* twoDic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"BeiJing",@"One",@"Shanghai",@"Two",@"GuangZhou",@"Three",nil];
     NSLog(@"%@",twoDic);
      //add a Key-Value couple
    [twoDic setObject:@"ShenZheng" forKey:@"Four"];
    NSLog(@"%@",twoDic);
    
      //NSArray* keyArray = [NSArray arrayWithObjects:@"Two",@"Four", nil];
    
      //[twoDic removeObjectsForKeys:keyArray];
    NSLog(@"%@",twoDic);
      //create threeDic by twoDic Value
    NSMutableDictionary* threeDic = [NSMutableDictionary dictionary];
    
    NSArray* valueArray = [twoDic allValues];
    for (int i = 0; i < [valueArray count]; i++) {
      NSString* city = [NSString stringWithFormat:@"%@是一座美丽的城市。" ,[valueArray objectAtIndex:i]];
      
      [threeDic setObject:city forKey:[valueArray objectAtIndex:i]];
    }
    
    for ( NSString* key in threeDic){
      NSLog(@"Key:%@,Value:%@",key,[threeDic objectForKey:key]);
    }
    
  }
    return 0;
}

