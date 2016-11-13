//
//  MyString.h
//  ZuoYe01
//
//  Created by bencai on 14-8-5.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyString : NSObject

  // 将传入的字符串逆序
	// 比如:输入@"abcdef”，输出@"fedcba"
+ (NSString *)reveserString:(NSString *)srcStr;

@end
