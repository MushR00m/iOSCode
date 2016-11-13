//
//  ViewController.m
//  JSBiding
//
//  Created by songqi on 16/10/23.
//  Copyright © 2016年 好样的. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
//建立 JS于navive 之间的桥梁
//Integrating javascript into native applications session 615  javascriptcore engineer
/*

 javascriptcore.h
 
 jscontext
 
 jsvalue
 
 jsexport
 
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self someDemo1];
    [self someDemo2];
    [self someDemo3];
    [self someDemo4];
}

- (void)someDemo1
{
    //执行JS 代码
    
    JSContext *context = [[JSContext alloc] init];
    [context setExceptionHandler:^(JSContext *ctx, JSValue *exception) {
        NSLog(@"exception = %@",exception);
    }];
    JSValue *result = [context evaluateScript:@"1+2"];
    NSLog(@"1+2 = %.2f",[result toDouble]);
}

- (void)someDemo2
{
    //执行JS 函数
    
    JSContext *context = [[JSContext alloc] init];
    JSValue *sum = context[@"sum"];
    JSValue *result = [sum callWithArguments:@[@1,@2]];
    NSLog(@"sum(1,2) = %f",[result toDouble]);
}

- (void)someDemo3
{
    //create javascript value
    
    JSContext *context = [[JSContext alloc] init];
    JSValue *intVar = [JSValue valueWithInt32:100 inContext:context];
    context[@"bar"] = intVar;
    JSValue *result = [context evaluateScript:@"++bar"];
    NSLog(@"bar = %f",[result toDouble]);
    
    //another way
//    [context evaluateScript:@"var bar = 100;"];
}

/**
 类型转换
 
 nil -- undefined
 nsnull -- null
 nsstring -- string
 nsnumber -- number,boolean
 nsdictionary -- object
 nsarray -- array
 nsdate -- date
 nsblock -- function 
 id -- wrapper
 class -- constructor
 
 */

- (void)someDemo4
{
    //call native code via block
    
    JSContext *context = [[JSContext alloc] init];
    context[@"OCSUM"] = ^(int a,int b) {
        return a*a + b*b;
    };
    JSValue *result = [context evaluateScript:@"OCSUM(2,3)"];
    NSLog(@"OSCUM(2,3) = %.2f",[result toDouble]);
}

- (void)someDemo5
{
    /*
     call native code via jsexport
     
     create a js export class in object-c
     the instance of this class can be accessed in js context
     
     no construction in js
     
     */
}


@end
