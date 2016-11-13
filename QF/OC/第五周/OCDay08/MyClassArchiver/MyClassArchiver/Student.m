//
//  Student.m
//  MyClassArchiver
//
//  Created by bencai on 14-8-13.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "Student.h"

@implementation Student
- (id)init{
  return [self initWithName:@"张三丰" andAge:100];
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"Name:%@ Age:%lu", self.name,self.age];
}

- (id)initWithName:(NSString*)aName andAge:(NSUInteger)aAge
{
  if (self = [super init]) {
    _name = aName;
    _age = aAge;
  }

  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
  [aCoder encodeObject:[self name] forKey:@"Name"];
  [aCoder encodeInteger:(NSUInteger)self.age forKey:@"Age"];

}

- (id)initWithCoder:(NSCoder *)aDecoder{
  if (self = [super init]) {
    self.name = [aDecoder decodeObjectForKey:@"Name"];
    self.age = (NSUInteger)[aDecoder decodeIntegerForKey:@"Age"];
  }

  return self;
}
@end
