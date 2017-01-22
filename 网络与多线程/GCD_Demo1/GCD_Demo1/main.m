//
//  main.m
//  GCD_Demo1
//
//  Created by songqi on 2017/1/10.
//  Copyright © 2017年 好样的. All rights reserved.
//

#import <Foundation/Foundation.h>

//异步才具备开启线程的能力

//并发+同步 所有任务都是在主线程中执行的。由于只有一个线程，所以任务只能一个一个执行。
void test1()
{
    NSLog(@"begin : %@",[NSThread currentThread]);
    dispatch_queue_t aQueue = dispatch_queue_create("a.queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(aQueue, ^{
        for (int i = 0; i < 10; ++i) {
            NSLog(@"1------%@",[NSThread currentThread]);
        }
    });
    
    dispatch_sync(aQueue, ^{
        for (int i = 0; i < 10; ++i) {
            NSLog(@"2------%@",[NSThread currentThread]);
        }
    });
    
    dispatch_sync(aQueue, ^{
        for (int i = 0; i < 10; ++i) {
            NSLog(@"3------%@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"end---");
    
    getchar();
}

//并发队列 + 异步执行  除了主线程，又开启了其他线程，并且任务是交替着同时执行的。
void test2()
{
    NSLog(@"asyncConcurrent---begin %@",[NSThread currentThread]);
    
    dispatch_queue_t queue= dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 20; ++i) {
            NSLog(@"1------%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 20; ++i) {
            NSLog(@"2------%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 20; ++i) {
            NSLog(@"3------%@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"asyncConcurrent---end");
    getchar();

}

//串行队列 + 同步执行     不会开启新线程，在当前线程执行任务。任务是串行的，执行完一个任务，再执行下一个任务
void test3()
{
    NSLog(@"syncSerial---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 20; ++i) {
            NSLog(@"1------%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 20; ++i) {
            NSLog(@"2------%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 20; ++i) {
            NSLog(@"3------%@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"syncSerial---end");
    getchar();


}

//串行队列 + 异步执行  开启了一条新线程，但是任务还是串行，所以任务是一个一个执行。
void test4()
{
    NSLog(@"asyncSerial---begin %@",[NSThread currentThread]);
    
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 20; ++i) {
            //非主线程中执行
            NSLog(@"1------%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 20; ++i) {
            NSLog(@"2------%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 20; ++i) {
            NSLog(@"3------%@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"asyncSerial---end");
    getchar();

}

//主队列 + 异步执行   只在主线程中执行任务，执行完一个任务，再执行下一个任务  应为向主线程中添加的任务在主线程中执行
void test5()
{
    NSLog(@"asyncSerial---begin %@",[NSThread currentThread]);
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 20; ++i) {
            NSLog(@"1------%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 20; ++i) {
            NSLog(@"2------%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 20; ++i) {
            NSLog(@"3------%@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"asyncSerial---end");

    [[NSRunLoop currentRunLoop] run];
}


//主队列 + 同步执行   互等卡住不可行
void test6()
{
    NSLog(@"asyncSerial---begin %@",[NSThread currentThread]);
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 20; ++i) {
            //非主线程中执行
            NSLog(@"1------%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 20; ++i) {
            NSLog(@"2------%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 20; ++i) {
            NSLog(@"3------%@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"asyncSerial---end");
    
    [[NSRunLoop currentRunLoop] run];
}

/**
 主队列：GCD自带的一种特殊的串行队列
 所有放在主队列中的任务，都会放到主线程中执行
 可使用dispatch_get_main_queue()获得主队列

 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        test5();
        

    }
    return 0;
}
