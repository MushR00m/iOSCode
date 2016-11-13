//
//  Male.m
//  MyDerived
//
//  Created by bencai on 14-8-8.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "Male.h"
  //@class Female;
#import "Female.h"

@implementation Male
  //overload重载//在本类中，根据调用时参数的不同，调用不同的方法，这些方法名的第一个标签相同
- (void)paoNiu{
  NSLog(@"call me baby");
}
- (void)paoNiu:(Female*)aGirl{
  NSLog(@"call me baby With %@",aGirl.name);
}

- (instancetype)init{
    //self.sex = YES;
  return [self initWithHuZi:@"没有胡" andHouJie:NO];
}
- (NSString *)description
{
  return [NSString stringWithFormat:@"%@,胡子类型：%@，有无喉结：%@", [super description],_huZi,_houJie?@"有喉结":@"没有喉结"];
}

- (instancetype)initWithHuZi:(NSString*)aHuZi
                   andHouJie:(BOOL)aHouJie{
  if (self = [super init]) {
    super.sex = YES;
    _huZi = aHuZi;
    _houJie = aHouJie;
  }
  
  return self;
}
+ (void)test{
  Male* oneMale = [[Male alloc]initWithName:@"Mike" andAge:18 andSex:YES];
  
  NSLog(@"%@",oneMale);
}


@end
