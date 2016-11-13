//
//  main.m
//  MyString
//
//  Created by bencai on 14-8-5.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    NSString* a = [[NSString alloc]initWithString:@"你好吗,hello"];
    NSString* aa = [NSString stringWithFormat:@"%d %@",20,@"world"];
    NSMutableString* b = [[NSMutableString alloc]initWithString:@"HELLO"];
    unichar myChar = [a characterAtIndex:2];
    
    NSLog(@"The Length:%lu",[a length]);
    NSLog(@"The Length:%lu",[aa length]);
    NSLog(@"The Length:%lu",[b length]);
    
    NSLog(@"The character: %C",myChar);
    
    NSString* aaa = a;
    if([a isEqualToString:aaa] == YES){
      printf("a isEqualToString aaa\n");
    }else{
      printf("a is different from aaa\n");
    }
    
    if([a caseInsensitiveCompare:aaa] == NSOrderedSame){
      printf("a equals aaa\n");
    }else if ([a caseInsensitiveCompare:aaa] == NSOrderedAscending){
      printf("a less than aaa\n");
    }else{//NSOrderedDescending
      printf("a great than aaa\n");
    }
    
  }
    return 0;
}

