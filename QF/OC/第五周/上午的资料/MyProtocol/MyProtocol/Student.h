//
//  Student.h
//  MyProtocol
//
//  Created by bencai on 14-8-13.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyProtocol.h"

@interface Student : NSObject <QFCoder,QFDocer>{
  NSString* _name;
}
@property (copy,nonatomic) NSString* name;
- (void)eat;

@end
