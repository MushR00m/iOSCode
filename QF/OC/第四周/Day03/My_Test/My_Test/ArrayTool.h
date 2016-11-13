//
//  ArrayTool.h
//  My_Test
//
//  Created by bencai on 14-8-6.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArrayTool : NSObject

+ (void)showArray:(NSArray*)aNSArray;
+ (void)showMutableArray:(NSMutableArray*)aNSMutableArray;
+ (void)hasObject:(id)aObject
          inArray:(NSArray*)aArray;

@end
