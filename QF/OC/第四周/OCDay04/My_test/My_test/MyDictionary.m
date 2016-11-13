//
//  MyDictionary.m
//  My_test
//
//  Created by bencai on 14-8-7.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "MyDictionary.h"

@implementation MyDictionary

-(instancetype)initWithDictionaryId:(int)aId
                      andDictionary:(NSDictionary *)aDictionary
{
  if (self = [super init]) {
    _dictionaryId = aId;
    _myDictionary = aDictionary;
  }
  
  return self;
}
@end
