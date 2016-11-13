//
//  Female.h
//  MyDerived
//
//  Created by bencai on 14-8-8.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

  //#import <Foundation/Foundation.h>
#import "Person.h"

@interface Female : Person{
  NSString* _longHair;
  BOOL _wenRou;
}
@property (copy,nonatomic) NSString* longHair;
@property (assign,nonatomic) BOOL wenRou;

- (void)saJiao;
  //- (void)saJiao:(id)aPerson;
-(void) saJiao:(Person*)  aPerson;

- (instancetype)initWithLongHair:(NSString*)aLongHair
                       andWenRou:(BOOL)aWenRou;
+ (void)test;

@end
