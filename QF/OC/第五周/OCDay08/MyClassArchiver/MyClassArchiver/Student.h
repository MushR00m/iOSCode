//
//  Student.h
//  MyClassArchiver
//
//  Created by bencai on 14-8-13.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject <NSCoding>{
  NSString* _name;
  NSUInteger _age;
}
@property (copy,nonatomic) NSString* name;
@property (assign,nonatomic) NSUInteger age;
- (id)initWithName:(NSString*)aName andAge:(NSUInteger)aAge;
  //NSCoding协议中要求实现的方法
//- (void)encodeWithCoder:(NSCoder *)aCoder;
//- (id)initWithCoder:(NSCoder *)aDecoder;

@end
