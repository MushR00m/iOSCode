//
//  Male.h
//  MyDerived
//
//  Created by bencai on 14-8-8.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import "Person.h"
  //#import "Female.h"
@class Female;

@interface Male : Person{
  NSString* _huZi;
  BOOL _houJie;
}
@property (copy,nonatomic) NSString* huZi;
@property (assign,nonatomic,readonly) BOOL houJie;
- (void)paoNiu;
- (void)paoNiu:(Female*)aGirl;
- (instancetype)initWithHuZi:(NSString*)aHuZi
                   andHouJie:(BOOL)aHouJie;
+ (void)test;
@end
