//
//  Car.h
//  ZuoYe01
//
//  Created by bencai on 14-8-4.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject{
  double _speed;
}
  //init方法隐式声明
  //description方法隐式声明
- (id)initWithSpeed:(double)aSpeed;
- (void)setSpeed:(double)aSpeed;
- (double)speed;
@end
