//
//  Person.h
//  MyDerived
//
//  Created by bencai on 14-8-8.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
  NSString* _name;
  int _age;
  BOOL _sex;
}
@property (copy,nonatomic,readonly) NSString* name;
@property (assign,nonatomic) int age;
@property (assign,nonatomic) BOOL sex;

- (void)laugh;
- (instancetype)initWithName:(NSString*)aName
                      andAge:(int)aAge
                      andSex:(BOOL)aSex;
+ (void) test;
- (void)showPassPort;
@end
