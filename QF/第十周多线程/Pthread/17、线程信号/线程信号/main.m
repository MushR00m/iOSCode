//
//  main.m
//  线程信号
//
//  Created by chen cheng on 14-9-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <signal.h>


/**
 *  告诉当前进程、当收到信号的值为sig时、请第二参数指定的方式进行处理。(信号SIGKILL和信号SIGSTOP是不能忽略或者指定一个自定义的第三方行为、操作系统有权利结束或者暂停任何一个进程)
 *
 *  @param sig  信号的值
 *  @param func 1、是一个合法函数指针：收到信号后时执行一个自定义的行为。2、SIG_DEL： 收到信号后时按系统默认方式进行处理。3、SIG_IGN：忽略该信号、不进行任何处理。
 *
 *  @return 函数调用成功返回第二参数func、调用失败返回SIG_ERR。
 */
//typedef void (*sig_t) (int);
//sig_t signal(int sig, sig_t func);

void signal_handler(int sig)
{
    printf("你是一头猪\n");
    exit(0);//结束当前进程
}



int main(int argc, const char * argv[])
{
    int   *p = (int *)1234567;
    
    
    if (signal(SIGSEGV, signal_handler) == SIG_ERR)
    {
        perror("signal");
    }
    
    for (int i=1; i<31; i++)
    {
        if (signal(i, SIG_IGN) == SIG_ERR)
        {
            printf("i = %d\n", i);
            perror("signal err");
        }
    }
        

    //*p = 20;
    int i = 0;
    while (1)
    {
        printf("i = %d\n", i++);
        sleep(1);
    }

    
    
    return 0;
}

