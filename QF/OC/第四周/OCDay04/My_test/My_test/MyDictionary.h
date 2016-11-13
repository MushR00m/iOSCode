//
//  MyDictionary.h
//  My_test
//
//  Created by bencai on 14-8-7.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDictionary : NSObject

@property (assign) int dictionaryId;
@property (copy,nonatomic) NSDictionary* myDictionary;

-(instancetype)initWithDictionaryId:(int)aId andDictionary:(NSDictionary*)aDictionary;
@end
