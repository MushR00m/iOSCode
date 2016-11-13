  //
  //  main.m
  //  answerOnline
  //
  //  Created by bencai on 14-8-12.
  //  Copyright (c) 2014年 bencai. All rights reserved.
  //

#import <Foundation/Foundation.h>

#define PATHFILE @"/Users/qianfeng/Desktop/qfile.txt"
  //#define PATHFILE @"/Users/bencai/Desktop/qfile.txt"

int main(int argc, const char * argv[])
{
    // 这就是OC在线判题
    // 203 带文件操作第一题（必做）如何做的方式
    @autoreleasepool {
    int n = 0;
      //从键盘中输入一个整数
    printf("please input which line to seek:[1~20] ");
    scanf("%d", &n);
    
//      //注意这里要输入一个文件 这里是argv[1]
//    NSString *path = [NSString
//                      stringWithFormat:@"%s", argv[1]];
    NSString *path = PATHFILE;
      //把c语言的整数转化成 ObjC语言字符串类型
    NSString *keyword = [NSString
                         stringWithFormat:@"%d", n];
    
      //一次性将path文件里面的内容读入到content中
    NSString *content = [NSString
                         stringWithContentsOfFile:path
                         encoding:NSUTF8StringEncoding
                         error:nil];
      //NSLog(@"content is %@", content);//for Debug
      // 先做到这一步
      // 将答题系统中的文件下载，存为当前用户目录下的qfile.txt文件
      // 如我本人的路径是 /Users/bencai/qfile.txt
      // 然后点击拖曳入终端:
      // 刚才输入的文件就会对应到argv[1]这个地方
      // 可以看到输入了content里面的全部内容了
    NSArray *arr =[content
                   componentsSeparatedByString:@"\n"];
    
    for (NSString *subString in arr) {
      
      NSArray *subArr = [subString
                         componentsSeparatedByString:@" "];
      
      if ([subArr count] == 2) {
        
        NSString *key = [subArr
                         objectAtIndex:0];
        NSString *value = [subArr
                           objectAtIndex:1];
        
        if ([key isEqualToString:keyword]){
          NSLog(@"%@", value);
        }
      }
    }
      // 这样就是如何使用文件测试和如何做oc带有文件的测试
      // 祝大家学习OC愉快
    
  }//for @autorelease
  return 0;
}

