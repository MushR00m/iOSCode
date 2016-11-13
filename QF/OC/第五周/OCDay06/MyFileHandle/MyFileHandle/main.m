//
//  main.m
//  MyFileHandle
//
//  Created by bencai on 14-8-11.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    NSString* myString = @"hello 1000phone";
      //对于信息数据进行按指定格式的编码，以便写入文件
    NSData* aData = [myString dataUsingEncoding:NSUTF8StringEncoding];
  
    NSMutableString* bString = [[NSMutableString alloc] initWithData:aData encoding:NSUTF8StringEncoding];
    
    [bString appendString:@",HELLO WORLD"];
    NSLog(@"%@",bString);

    aData = [bString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSFileManager* fm = [NSFileManager defaultManager];
    
    [fm createFileAtPath:@"/Users/bencai/Desktop/new.txt" contents:aData attributes:nil];
      //将文件以读写方式打开（以可更新方式打开）
    NSFileHandle* fh = [NSFileHandle fileHandleForUpdatingAtPath:@"/Users/bencai/Desktop/new.txt"];
      //对文件进行读操作
    aData = [fh readDataOfLength:3];
    NSString* cString = [[NSString alloc] initWithData:aData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",cString);
    [fh seekToFileOffset:10];
    aData = [fh readDataToEndOfFile];
    NSString* dString = [[NSString alloc] initWithData:aData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",dString);
    
      //将文件清空
    [fh truncateFileAtOffset:0];
      //将编码后的数据写入文件
    [fh writeData:aData];
    [fh synchronizeFile];
  }
    return 0;
}

