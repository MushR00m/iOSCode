//
//  main.m
//  BlockDemo
//
//  Created by chensongqi on 16/12/1.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SomeObject : NSObject

@property (nonatomic, copy) NSString *(^aBlock)();

@property (nonatomic ,copy) int (^dBlock)(void);

@end

@implementation SomeObject



@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //无参数，无返回值
        void (^aBlock)(void) = ^(void){
            NSLog(@"aBlock");
        };
        aBlock();
        
        //有参数，无返回值
        void (^bBlock)(int a) = ^(int a) {
            NSLog(@"a = %d",a);
        };
        bBlock(22);
        
        //有参数，有返回值
        int (^cBlock)(int) = ^(int c) {
            return c+1;
        };
        NSLog(@"c = %d",cBlock(11));
        
        int (^dBlock)(void) = ^{
            return 55;
        };
        NSLog(@"d = %d",dBlock());
        
        /*
        inlineblock
        <#returnType#>(^<#blockName#>)(<#parameterTypes#>) = ^(<#parameters#>) {
            <#statements#>
        };
         */
        
        SomeObject *obj = [SomeObject new];
        obj.aBlock = ^{
            return @"test";
        };
        NSLog(@"%@",obj.aBlock());
        
        obj.dBlock =  ^{
            return 65;
        };
        NSLog(@"%d",obj.dBlock());

    }
    return 0;
}
