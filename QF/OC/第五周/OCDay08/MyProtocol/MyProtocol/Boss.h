//
//  Boss.h
//  MyProtocol
//
//  Created by bencai on 14-8-13.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyProtocol.h"
#import "Student.h"

@interface Boss : NSObject{
  NSString* _name;
}
@property (copy,nonatomic) NSString* name;
+ (void)testProgrammer:(Student*) aDaNa;
@end



