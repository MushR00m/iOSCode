//
//  main.m
//  消息传递机制
//
//  Created by chensongqi on 17/2/27.
//  Copyright © 2017年 chensongqi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>

@interface OtherTestObject : NSObject

- (void)testMethod;

@end

@implementation OtherTestObject

- (void)testMethod
{
    NSLog(@"OtherTestObject testMethod");
}

@end

@interface SomeTestObject : NSObject

- (void)testMethod;

@end

@implementation SomeTestObject


void dynamicMethodIMP(id self, SEL _cmd)
{
    //
    NSLog(@"dynamicMethodIMP");
}

//1、代表动态方法解析阶段
//+ (BOOL)resolveInstanceMethod:(SEL)sel
//{
//    if (sel == @selector(testMethod)) {
//        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, NULL);
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}

//2、第二个阶段是备援接收者阶段
//- (id)forwardingTargetForSelector:(SEL)aSelector
//{
//    NSLog(@"someObject _cmd: %@",NSStringFromSelector(_cmd));
//    OtherTestObject *none = [[OtherTestObject alloc] init];
//    if ([none respondsToSelector:aSelector]) {
//        return none;
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:selector];
    
    if (!signature) {
//        OtherTestObject *none = [[OtherTestObject alloc] init];
//        signature = [none methodSignatureForSelector:selector];
        signature = [NSMethodSignature signatureWithObjCTypes:"v@:"];
        /**
         <NSInvocation: 0x100202090>
         return value: {v} void
         target: {@} 0x100201880
         selector: {:} testMethod

         */
    }
    return signature;
}

//forward Invocation 转发调用
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    SEL selector = [anInvocation selector];
    OtherTestObject *none = [[OtherTestObject alloc] init];
    if ([none respondsToSelector:selector]) {
        [anInvocation invokeWithTarget:none];
    } else {
        [super forwardInvocation:anInvocation];
    }
}

//- (void)doesNotRecognizeSelector:(SEL)aSelector
//{
//    if (aSelector == @selector(testMethod)) {
//        NSLog(@"testMethod doesNotRecognizeSelector");
//    }
//}

@end

@interface SomeTestInvocation : NSObject

@end

@implementation SomeTestInvocation



@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        id obj = [[SomeTestObject alloc] init];
        [obj testMethod];
    }
    return 0;
}
