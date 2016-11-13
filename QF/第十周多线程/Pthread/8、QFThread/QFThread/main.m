//
//  main.m
//  QFThread
//
//  Created by chen cheng on 14-9-17.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFThread.h"

@interface Model : NSObject
{
    int _data;
}

- (void)loadData;

@end

@implementation Model

- (void)loadData
{
    sleep(10);//模拟从网络加载数据需要持续一段时间
    
    _data = 30;
    
    NSLog(@"数据加载完成");
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        Model  *model = [[Model alloc] init];
        
        //这是一个线程对象 并不代表线程已经创建好了
        QFThread  *thread = [[QFThread alloc] initWithTarget:model action:@selector(loadData) arg:nil];
        
        [thread start];//这里的逻辑含义是开始启动这个线程（但实际含义是创建了一个线程、不是线程对象、也并不代表线程已经运行了）
        
        [thread release];
        
        
        [model release];
        
        NSLog(@"main thread 的代码");
        
        getchar();
    }
    return 0;
}

