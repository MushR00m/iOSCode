//
//  MyMutableArray.m
//  My_Test
//
//  Created by bencai on 14-8-6.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "MyMutableArray.h"
#import "ArrayTool.h"

@implementation MyMutableArray
//- (id)init
//{
//  [];
//}

- (id)initWithArray:(NSMutableArray*)aArray
{
  if (self = [super init]) {
    _array = aArray;
    _length = [aArray count];
  }
  
  return self;
}

  //greater than is YES;or NO
- (BOOL)myDescendingCompare:(id)aObject
                WithAnother:(id)bObject
{
  BOOL result = YES;

  result = ([aObject characterAtIndex:0] > [bObject characterAtIndex:0]) ? YES :NO;
  
  return result;
}

- (void)setArray:(NSMutableArray*)aArray
{
  if (_array != aArray) {
    _array = aArray;
  }

}
- (NSMutableArray*)array
{
  return _array;
}

- (void)setLength:(NSUInteger)aLength
{
    //if (_length != aLength) {
    _length = aLength;
    //}

}
- (NSUInteger)length
{

  return _length;
}

+ (void)testSortWithArray:(NSMutableArray*)aArray
{
  BOOL result = YES;
  MyMutableArray* srcArray= [[MyMutableArray alloc]initWithArray:aArray];

  NSMutableArray* tArray = [srcArray array];
    //--just test myDescendingCompare:WithAnother: method
  result = [srcArray myDescendingCompare:[tArray objectAtIndex:0] WithAnother:[tArray objectAtIndex:1]];
  
  NSLog(@"%@",result?@"ok":@"fail");
  
//    //--sortUsingSelector
//  [tArray sortUsingSelector:@selector(myDescendingCompare:WithAnother:)];
//  [ArrayTool showMutableArray:tArray];
  
}



@end
