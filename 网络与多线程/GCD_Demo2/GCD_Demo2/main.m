//
//  main.m
//  GCD_Demo2
//
//  Created by chensongqi on 17/1/11.
//  Copyright © 2017年 chensongqi. All rights reserved.
//

#import <Foundation/Foundation.h>

//GCD的栅栏方法 dispatch_barrier_async
void barrier()
{
    /**
     我们有时需要异步执行两组操作，而且第一组操作执行完之后，才能开始执行第二组操作。这样我们就需要一个相当于栅栏一样的一个方法将两组异步执行的操作组给分割起来，当然这里的操作组里可以包含一个或多个任务。
     */
    dispatch_queue_t queue = dispatch_queue_create("12312312", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 100; i++) {
            NSLog(@"---- 1");
        }    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 100; i++) {
            NSLog(@"---- 2");
        }
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"----barrier-----%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 100; i++) {
            NSLog(@"---- 3");
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 100; i++) {
            NSLog(@"---- 4");
        }
    });
}

// GCD的延时执行方法 dispatch_after
void dispatchafter()
{
    NSLog(@"开始执行");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 2秒后异步执行这里的代码...
        NSLog(@"run-----");
    });
    
}

//GCD的一次性代码(只执行一次) dispatch_once

void dispatchonce()
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 只执行1次的代码(这里面默认是线程安全的)
        NSLog(@"只执行1次的代码");
    });

}

//GCD的快速迭代方法 dispatch_apply
//for循环的做法是每次取出一个元素，逐个遍历。dispatch_apply可以同时遍历多个数字。
void dispatchapply()
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_apply(6, queue, ^(size_t index) {
        NSLog(@"%zd------%@",index, [NSThread currentThread]);
    });
    //同步执行
    NSLog(@"xxx");
}


//GCD的队列组 dispatch_group
void dispatchgroup()
{
    dispatch_group_t group =  dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i < 1000; i++) {
            NSLog(@"---- 1");
        }
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 执行1个耗时的异步操作
        for (NSInteger i = 0; i < 1000; i++) {
            NSLog(@"---- 2");
        }
    });
    
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        // 等前面的异步操作都执行完毕后，回到主线程...
        NSLog(@"dispatch_group_notify");
    });
    
    NSLog(@"执行完成 ");

}


void groupSync()
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(5);
        NSLog(@"任务一完成");
        dispatch_group_leave(group);
    });
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(8);
        NSLog(@"任务二完成");
        dispatch_group_leave(group);
    });
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"任务完成");
    });
    
}

void groupSync2()
{
    dispatch_queue_t disqueue =  dispatch_queue_create("com.shidaiyinuo.NetWorkStudy", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t disgroup = dispatch_group_create();
    dispatch_group_async(disgroup, disqueue, ^{
        NSLog(@"任务一完成");
    });
    dispatch_group_async(disgroup, disqueue, ^{
        sleep(8);
        NSLog(@"任务二完成");
    });
    dispatch_group_notify(disgroup, disqueue, ^{
        NSLog(@"dispatch_group_notify 执行");
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"dispatch_group_wait 开始");
        dispatch_group_wait(disgroup, dispatch_time(DISPATCH_TIME_NOW, 100 * NSEC_PER_SEC));
        NSLog(@"dispatch_group_wait 结束");
    });
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        dispatchgroup();
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
