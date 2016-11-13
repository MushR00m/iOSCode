//
//  main.m
//  MyNSDate
//
//  Created by bencai on 14-8-11.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

  @autoreleasepool {
      //建立一个 文件管理器，用于新建文件对象
    NSFileManager* fm = [NSFileManager defaultManager];
      //用文件管理器，新建一个指定路径的磁盘文件
    [fm createFileAtPath:@"/Users/bencai/Desktop/data.txt" contents:nil  attributes:nil];
      //创建一个文件处理句柄，用于读写文件
    NSFileHandle* aHandle = [NSFileHandle fileHandleForUpdatingAtPath:@"/Users/bencai/Desktop/data.txt"];
      //判断磁盘文件test.txt是否存在
    if ([fm fileExistsAtPath:@"/Users/bencai/Desktop/test.txt"]) {
        //获取文件的属性信息字典
      NSDictionary* myDic = [fm attributesOfItemAtPath:@"/Users/bencai/Desktop/test.txt" error:nil];
      for (NSString* key in myDic) {
          //创建一个时间戳格式器
        NSDateFormatter* aFormatter = [[NSDateFormatter alloc] initWithDateFormat:@"%Y-%m-%d %H:%M:%S " allowNaturalLanguage:YES];
          //获取当前时间描述字符串
        NSString* time_des = [aFormatter stringFromDate:[NSDate date]];
        
          //        NSLog(@"Key:%@ -> Value:%@",key,[myDic objectForKey:key]);//for Debug
          //合成一条记录信息
        NSString* value = [NSString  stringWithFormat:@"%@ %@ %@\n",time_des,key,[myDic objectForKey:key]];
          //将信息编码，封装成 NSData
        NSData* aData = [value dataUsingEncoding:NSUTF8StringEncoding];
          //将编码后的信息数据，写入文件
        [aHandle writeData:aData];
          //将内存缓冲区的数据，同步到磁盘文件
        [aHandle synchronizeFile];

      }
    }else{
      NSLog(@"File not exist.");
    }
    
    
    
  }
    return 0;
}

