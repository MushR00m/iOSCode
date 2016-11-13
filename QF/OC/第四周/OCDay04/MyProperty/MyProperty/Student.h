//
//  Student.h
//  MyProperty
//
//  Created by bencai on 14-8-7.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject{
  int _uid;
  NSString* _name;
  int _age;
}
  //uid属性
  //-(int)uid;//getter方法声明
@property (assign,readonly)
int uid;
  //name属性
-(void)setName:(NSString*)aName;
-(NSString*)name;
  //@property(assign,readwrite) NSString* name;
  //age属性
@property (assign,readwrite) int age;

- (instancetype)initWithUid:(int)aUid
                    andName:(NSString*)aName
                     andAge:(int)aAge;

@end
