//
//  ArrayTool.m
//  My_Test
//
//  Created by bencai on 14-8-6.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "ArrayTool.h"

@implementation ArrayTool
+ (void)showArray:(NSArray*)aNSArray
{
  for (NSInteger i=0; i<[aNSArray count]; i++) {
    NSLog(@"%@",[aNSArray objectAtIndex:i]);
  }


}

+ (void)showMutableArray:(NSMutableArray*)aNSMutableArray
{
//  for (NSInteger i=0; i<[aNSMutableArray count]; i++) {
//    NSLog(@"%@",[aNSMutableArray objectAtIndex:i]);
//  }
  [ArrayTool showArray:(NSArray*)aNSMutableArray];
  
}

+ (void)hasObject:(id)aObject
          inArray:(NSArray*)aArray
{
  if([aArray containsObject:aObject]){
    NSLog(@"该元素被包含在数组中");
  }else{
    NSLog(@"该元素未被包含在数组中");
  }

}

@end
