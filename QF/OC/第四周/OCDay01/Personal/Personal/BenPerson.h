//
//  BenPerson.h
//  Personal
//
//  Created by bencai on 14-8-4.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

  //类的声明文件，类的接口文件
#import <Foundation/Foundation.h>

@interface BenPerson : NSObject {
    //@public//公开的，访问权限最大//所有的对象都能访问该属性
  //类的属性//要用大括号括起来
  int _number;//保存学号信息
              //@protected//保护的，访问权限中庸//只有自己和子类能访问该属性
  NSString* _name;//下划线开始的变量名作为类的属性变量，和形式参数相区别，这是工程习惯，代表该变量是对象内部的空间
                  //@private//私有的，访问权限最小//只有自己能访问该属性
  int _age;
}
  //中缀函数名方式
  //id 相当于void* //id是泛型的对象指针类型
- (id)initWithNumber:(int)aNumber
             andName:(NSString*)aName
              andAge:(int)aAge;

  //类的方法//不能用大括号
- (void)setNumber:(int)aNumber;
- (int)number;

- (void)setAge:(int)aAge;
- (int)age;

- (void)setName:(NSString*)aName;
- (NSString*)name;

@end







