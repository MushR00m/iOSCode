//
//  MyMutableArray.h
//  My_Test
//
//  Created by bencai on 14-8-6.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyMutableArray : NSObject{
  NSMutableArray* _array;
  NSUInteger _length;

}
- (id)initWithArray:(NSMutableArray*)aArray;

  //greater than is YES;or NO
- (BOOL)myDescendingCompare:(id)aObject
                WithAnother:(id)bObject;
- (void)setArray:(NSMutableArray*)aArray;
- (NSMutableArray*)array;

- (void)setLength:(NSUInteger)aLength;
- (NSUInteger)length;

+ (void)testSortWithArray:(NSMutableArray*)aArray;


@end
