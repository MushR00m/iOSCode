//
//  main.m
//  MyFileManager
//
//  Created by bencai on 14-8-11.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    NSArray* myDirAarry = nil;
    
      //创建文件管理器的单例对象
    NSFileManager* fm = [NSFileManager defaultManager];
      //浅度遍历
    myDirAarry = [fm contentsOfDirectoryAtPath:@"/Users/bencai/Desktop/" error:nil];
    NSLog(@"%@",myDirAarry);
      //深度遍历
    myDirAarry=[fm subpathsOfDirectoryAtPath:@"/Users/bencai/Desktop" error:nil];
    NSLog(@"%@",myDirAarry);
    
    [fm createFileAtPath:@"/Users/bencai/Desktop/bencai.txt" contents:nil attributes:nil];
    
    [fm createDirectoryAtPath:@"/Users/bencai/Desktop/testdir" withIntermediateDirectories:NO attributes:nil error:nil];
      //再次进行浅度遍历
    myDirAarry = [fm  contentsOfDirectoryAtPath:@"/Users/bencai/Desktop/" error:nil];
    NSLog(@"%@",myDirAarry);
      //拷贝文件
    [fm copyItemAtPath:@"/Users/bencai/Desktop/test.txt" toPath:@"/Users/bencai/Desktop/test.rtf" error:nil];
      //再次进行浅度遍历
    myDirAarry = [fm  contentsOfDirectoryAtPath:@"/Users/bencai/Desktop/" error:nil];
    NSLog(@"%@",myDirAarry);
      //移动文件
    [fm moveItemAtPath:@"/Users/bencai/Desktop/test.txt" toPath:@"/Users/bencai/Desktop/testdir/test.txt" error:nil];
      //再次进行深度遍历
    myDirAarry = [fm  subpathsOfDirectoryAtPath:@"/Users/bencai/Desktop/" error:nil];
    NSLog(@"%@",myDirAarry);
      //获取指定文件的属性信息
    NSDictionary* fileAttributesInfo = [fm attributesOfItemAtPath:@"/Users/bencai/Desktop/bencai.txt" error:nil];
    NSLog(@"%@",fileAttributesInfo);
    if ([fm fileExistsAtPath:@"/Users/bencai/Desktop/testdir/test.rtf"]) {
      [fm removeItemAtPath:@"/Users/bencai/Desktop/testdir/test.rtf" error:nil];
    }else{
      NSLog(@"No such file");
    }
      //再次进行深度遍历
    myDirAarry = [fm  subpathsOfDirectoryAtPath:@"/Users/bencai/Desktop/" error:nil];
    NSLog(@"%@",myDirAarry);

    NSDictionary*  dic = [fm attributesOfItemAtPath:@"/Users/bencai/Desktop/test.rtf" error:nil];
    
    NSLog(@"%@",[dic objectForKey:@"NSFileType"]);

    
    
  }
    return 0;
}
  //const int a = 10;
  //int* p = &a;
  //p =b;





