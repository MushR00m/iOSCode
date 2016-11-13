//
//  Cat.m
//  MyDelegate
//
//  Created by bencai on 14-8-13.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "Cat.h"

@implementation Cat
- (void)bark:(NSInteger)aCount{
  for (int i = 0;i<aCount;i++)
  {
    NSLog(@"Miao Miao ...");
  }
}
- (void)encodeWithCoder:(NSCoder *)aCoder{
  [aCoder encodeObject:self.name forKey:@"Name"];
  
}
- (id)initWithCoder:(NSCoder *)aDecoder{
  if (self = [super init]) {
    self.name = [aDecoder decodeObjectForKey:@"Name"];
    
  }
  
  return self;
}
-(id)initWithName:(NSString*)aName{
  if (self = [super init]) {
    _name = aName;
  }
  
  return self;
}
-(instancetype)init{
  return [self initWithName:@"MouMao"];
}
- (NSString *)description
{
  return [NSString stringWithFormat:@"Name:%@", self.name];
}

@end
