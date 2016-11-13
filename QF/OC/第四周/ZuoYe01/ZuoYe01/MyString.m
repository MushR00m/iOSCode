//
//  MyString.m
//  ZuoYe01
//
//  Created by bencai on 14-8-5.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "MyString.h"

@implementation MyString

+ (NSString *)reveserString:(NSString*)srcStr
{
  NSMutableString* result = [[NSMutableString alloc]initWithFormat:@"%c",'\0'];// initWithString:srcStr];
  
  NSUInteger strLength = [srcStr length];
  unichar aChar = '\0';
  NSUInteger index = 0L;
                             //NSRange aRange = {0,strLength};
  
  for (NSUInteger i = 0; i < strLength; i++) {
    index = strLength - i - 1;

    aChar = [srcStr characterAtIndex:index];
      //NSLog(@"%C",aChar);
    [result appendFormat:@"%C",aChar];
  }
  
                             //[result deleteCharactersInRange:aRange];
  
  return result;
}
@end
