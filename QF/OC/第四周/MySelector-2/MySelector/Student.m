//
//  Student.m
//  MySelector
//
//  Created by bencai on 14-8-6.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "Student.h"

@implementation Student
@synthesize name=_name;
@synthesize age=_age;

-(void)print{
  NSLog(@"name is %@, age is %i.",_name,_age);
}

-(NSComparisonResult)compareName:(id)element
{

  return [_name compare:[element name]];
}

- (NSComparisonResult)compareAge:(Student*)element
{
  NSComparisonResult ret = NSOrderedSame;
  if (_age > element.age) {
    ret = NSOrderedAscending;
  }else if (_age == element.age){
    ret = NSOrderedSame;
  }else{
    ret = NSOrderedDescending;
  }
  
  return ret;
}


@end
