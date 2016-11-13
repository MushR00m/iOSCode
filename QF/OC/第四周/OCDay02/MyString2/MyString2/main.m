//
//  main.m
//  MyString2
//
//  Created by bencai on 14-8-5.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    NSString* a = [[NSString alloc]initWithString:@"HELLO"];
    NSString* sub = [[NSString alloc]initWithString:@"EL"];
    
    NSRange myRange = [a rangeOfString:sub];
    printf("myRange.location:%lu\n",myRange.location);
    printf("myRange.length:%lu\n",myRange.length);
    
      //前缀存在判断
      //NSString* b = [NSString stringWithString:a];
    if ([a hasPrefix:@"HEL"]) {
      printf("has Prefix.\n");
    }else{
      printf("has not Prefix.\n");
    }
    
      //数字字符串转换成相应的数字类型
    NSString* c = [NSString stringWithUTF8String:"654321"];
    NSLog(@"Number:%d",[c intValue]+100);
      //- (BOOL)boolValue;使用
    NSString* d = [NSString stringWithFormat:@"NO"];
    NSLog(@"%s",[d boolValue]?"yes":"no");
      //- (NSString *)uppercaseString;
      //将所有字符转换成大写
    NSLog(@"%@",[d uppercaseString]);
      //- (NSString *)lowercaseString;
      //将所有字符转换成小写
    NSLog(@"%@",[d lowercaseString]);
      //- (NSString *)capitalizedString;
      //将第一个字符转换成大写
    NSLog(@"%@",[d capitalizedString]);
      //-----------------------------
    NSString* longString = [NSString stringWithFormat:@"ABCDEFG1234567890"];
      //   - (NSString *)substringFromIndex:(NSUInteger)from;
    NSLog(@"%@",[longString substringFromIndex:6]);
      //- (NSString *)substringToIndex:(NSUInteger)to;
  //substringToIndex不包含index位置的字符本身
    NSLog(@"%@",[longString substringToIndex:6]);
      //- (NSString *)substringWithRange:(NSRange)range;
    NSRange myRange2 = {5,6};
    myRange2.location = 4;
    myRange2.length = 7;
    NSLog(@"%@",[longString substringWithRange:myRange2]);
    
      //----------------------------------
      //    - (id)initWithContentsOfFile:(NSString *)path
      //  encoding:(NSStringEncoding)enc
      //  error:(NSError **)error;
    NSString* fileContents =
    [[NSString alloc]
     initWithContentsOfFile:@"/Users/bencai/Desktop/myfile"
     encoding:NSASCIIStringEncoding
     error:nil];
    
    NSLog(@"myfile contents:%@",fileContents);
    
    
    
    

  }
    return 0;
}

