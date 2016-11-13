//
//  Dog.h
//  MyDelegate
//
//  Created by bencai on 14-8-13.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyProtocol.h"

@interface Dog : NSObject<Bark>{
  NSString* _name;
}
@property (copy,nonatomic) NSString* name;
-(id)initWithName:(NSString*)aName;
- (void)bark:(NSInteger)aCount;
@end
