//
//  main.m
//  块对象
//
//  Created by chen cheng on 14-8-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>


void test(int a)
{
    NSLog(@"a = %d", a);
}

typedef void (*pFun)(int);

void test2(pFun p, int m)
{
    p(m);
}



//定义一个全局块对象blockFun
void (^blockFun)(int) = ^(int a){
    
    NSLog(@"blockFun :: a = %d", a);
};

typedef void (^blockFunType)(int);

void test3(blockFunType blockf, int m)
{
    blockf(m);
}

void test4(blockFunType blockf, int m)
{
    NSLog(@"test4");
}



int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        /*void (*pFun)(int) = NULL;
        
        pFun = test;
        
        pFun(10);*/
        
        
        //test2(test, 30);
        
        //test3(blockFun, 50);
        
      /*  int   m = 30;
        __block int   n = 40;
        
        NSLog(@"main &m = %p", &m);
        NSLog(@"main &n = %p", &n);
        
        
        //定义一个内联的代码块blockFun2
        void (^blockFun2)(int) = ^(int a){
            
            NSLog(@"blockFun2 &m = %p", &m);
            NSLog(@"blockFun2 &n = %p", &n);
            
            //只能对m进行读  不能对m进行写
            NSLog(@"blockFun :: a = %d m = %d, n = %d", a, m, n);
            
            //可以对n进行写  但不能对m进行写
            n = 600;
            
            NSLog(@"blockFun :: n = %d", n);
        };
        
        m = 60;
        n  = 300;

        //调用代码块
        blockFun2(80);
        
        */
        
        test3(^(int a){
            
            NSLog(@"test3 blockFun :: a = %d", a);
            
        }, 90);
        
        
        test4(^(int a){
            
            NSLog(@"test4 blockFun :: a = %d", a);
            
        }, 90);
        
    }
    return 0;
}

