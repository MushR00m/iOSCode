//
//  main.m
//  MyMutableString
//
//  Created by bencai on 14-8-6.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

  @autoreleasepool {
      
    NSMutableString* aString = [[NSMutableString alloc] initWithFormat:@"%d %s",10,"hello"];
    
      //- (void)insertString:(NSString *)aString
      //atIndex:(NSUInteger)loc;
    
    [aString insertString:@"world" atIndex:2+1];
      //2.4.3 追加子串
      //- (void)appendString:(NSString *)aString;
    [aString appendString:@",HELLO"];
      //2.4.4 追加格式化子串
      //- (void)appendFormat:(NSString *)format, ...;
    [aString appendFormat:@"%d %s",20,"World"];
      //2.4.2 删除指定范围的子串
      //- (void)deleteCharactersInRange:(NSRange)range;
    NSRange aRange = {5,6};
      //10 worldhello,HELLO20 World

      [aString deleteCharactersInRange:aRange];
    
      //10 wolo,HELLO20 World
    
      //2.4.5 修改子串
      // - (void)setString:(NSString *)aString;
    [aString setString:@"HELLO 1000phone"];

    NSLog(@"%@",aString);

    
  }
    return 0;
}

