//
//  Person.h
//  MyDelegate
//
//  Created by bencai on 14-8-13.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "MyProtocol.h"

@interface Person : NSObject<NSCoding>
{
  NSString* _name;
  NSInteger _age;
    //Dog* _myDog;
  id <Bark> _delegate;
    //NSInteger _count;
}
@property (assign,nonatomic) NSInteger count;
@property (copy,nonatomic) NSString* name;
@property (assign,nonatomic) NSInteger age;
//@property (retain,nonatomic) Dog* myDog;
@property(retain,nonatomic)id <Bark> delegate;
- (void)doBark;
- (id)initWithName:(NSString*)aName andAge:(NSInteger)aAge;

@end


