//
//  Female.m
//  MyDerived
//
//  Created by bencai on 14-8-8.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "Female.h"

@implementation Female
- (void)saJiao{
  NSLog(@"kajima");
}
  //- (void)saJiao:(id)aPerson{
-(void) saJiao:(Person*) aPerson
{
     NSLog(@"kajima With %@",[aPerson name]);
}

- (instancetype)init{
    //self.sex = NO;
  return [self initWithLongHair:@"短发型" andWenRou: NO];
}
- (NSString *)description
{
  return [NSString stringWithFormat:@"%@,长发类型：%@，温柔与否：%@", [super description],_longHair,_wenRou?@"温柔":@"不够温柔"];
}
- (instancetype)initWithLongHair:(NSString*)aLongHair
                       andWenRou:(BOOL)aWenRou{
  if (self = [super init]) {
    super.sex = NO;
      //self.sex = NO;
      //_sex = NO;

    _longHair = aLongHair;
    _wenRou = aWenRou;
  }
  return self;
}
+ (void)test{
  Female* oneFemale = [[Female alloc]initWithName:@"Alice" andAge:16 andSex:NO];
  NSLog(@"%@",oneFemale);
}

@end
