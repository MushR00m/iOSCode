//
//  main.m
//  MyJSONParser
//
//  Created by bencai on 14-8-12.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

  @autoreleasepool {
      //第一步：读取 json 格式文件，变成字符串
    NSString* json_des = [NSString stringWithContentsOfFile:@"/Users/bencai/Desktop/jiexi_json.txt" encoding:NSUTF8StringEncoding error:nil];
      //第二步：将上述字符串，转成 NSData对象
    NSData* aData = [json_des dataUsingEncoding:NSUTF8StringEncoding];
      //第三步：将 NSData 对象，提交给 JSON 解析器解析
    NSDictionary* json_dic = [NSJSONSerialization JSONObjectWithData:aData options:NSJSONReadingMutableContainers error:nil];
      //使用 for-in 循环结构，遍历打印字典
    for ( NSString* key in json_dic){
      NSLog(@"Key:%@ -> Value:%@ ",key,[json_dic objectForKey:key ]);
    }
    
  }
    return 0;
}

