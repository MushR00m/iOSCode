//
//  BenPerson.m
//  Personal
//
//  Created by bencai on 14-8-4.
//  Copyright (c) 2014年 bencai. All rights reserved.
//
//
//struct student{
//  int uid;
//  char* name;
//  int age;
//  struct student* self;//隐式指针
//}

  //
#import "BenPerson.h"

@implementation BenPerson

- (id)initWithNumber:(int)aNumber
             andName:(NSString*)aName
              andAge:(int)aAge
{
    //super代表父类
    //父类在帮对象初始化共同的继承的变量
  if (self = [super init]) {//nil表示空对象
    //对象初始化自己特殊的变量
    _number = aNumber;
    _name = aName;
    _age = aAge;
  }

    //self是一个指向对象自己的对象指针，该指针由 NSObject 提供
  return  self;
}
  //对象的自描述方法，也是一个由 NSObject 遗传的隐式方法，
  //我们可以按照自己的意愿，重写该方法（也即覆盖父类方法）
- (NSString *)description{
  return [NSString stringWithFormat:@"学号：%d，姓名：%@，年龄：%d",_number,_name,_age];
}

- (void)setNumber:(int)aNumber{
    //工程健壮性规范,加快运行时的效率
//  if (_number != aNumber) {
//     _number = aNumber;
//  }
//对于非对象属性，检查可选
    _number = aNumber;
}

- (int)number{

  return _number;
}


- (void)setName:(NSString*)aName{
    //针对对象类型的属性，在设置值之前，必须检查是否为同一对象（指针）
  if(_name != aName){
    _name = aName;
  }
}

- (NSString*)name{

  return _name;
}



- (void)setAge:(int)aAge{//setter方法，用于写入对象内部的属性数据
    //设置对象内部的属性值
  _age = aAge;
}

- (int)age{//getter方法，用于读取对象内部的属性数据
    //返回对象内部的属性值
  return _age;
}
@end
