//
//  Student.h
//  MySelector
//
//  Created by bencai on 14-8-6.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject{
  NSString* _name;
  int _age;
}
@property (copy,nonatomic) NSString* name;
@property int age;
- (void)print;
- (NSComparisonResult)compareName:(id)element;

@end
