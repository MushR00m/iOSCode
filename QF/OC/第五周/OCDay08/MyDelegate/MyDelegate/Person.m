//
//  Person.m
//  MyDelegate
//
//  Created by bencai on 14-8-13.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "Person.h"

@implementation Person
  //doBark事件中，人是委托方，狗是代理方
- (void)doBark{
    //[self.myDog bark];
  [self.delegate bark:self.count];
}
- (void)encodeWithCoder:(NSCoder *)aCoder{
  [aCoder encodeObject:self.name forKey:@"Name"];
  [aCoder encodeInteger:self.age forKey:@"Age"];
    //delegate encode
  [aCoder encodeObject:self.delegate forKey:@"Delegate"];
}
- (id)initWithCoder:(NSCoder *)aDecoder{
  if (self = [super init]) {
    self.name = [aDecoder decodeObjectForKey:@"Name"];
    self.age = [aDecoder decodeIntegerForKey:@"Age"];
      //delegate decode
    self.delegate = [aDecoder decodeObjectForKey:@"Delegate"];
  }
  
  return self;
}

- (id)initWithName:(NSString*)aName andAge:(NSInteger)aAge
{
  if (self = [super init]) {
    _name = aName;
    _age = aAge;
  }
  
  return self;
}
- (instancetype)init
{
  return [self initWithName:@"MouMou" andAge:0];
}
- (NSString *)description
{
  return [NSString stringWithFormat:@"Name:%@ Age:%lu Delegate:%@",self.name,self.age,self.delegate];
}

@end






