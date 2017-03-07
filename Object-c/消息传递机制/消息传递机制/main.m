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
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    NSLog(@"someObject _cmd: %@",NSStringFromSelector(_cmd));
    OtherTestObject *none = [[OtherTestObject alloc] init];
    if ([none respondsToSelector:aSelector]) {
        return none;
    }
    return [super forwardingTargetForSelector:aSelector];
}

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
//- (void)forwardInvocation:(NSInvocation *)anInvocation
//{
//    SEL selector = [anInvocation selector];
//    OtherTestObject *none = [[OtherTestObject alloc] init];
//    if ([none respondsToSelector:selector]) {
//        [anInvocation invokeWithTarget:none];
//    } else {
//        [super forwardInvocation:anInvocation];
//    }
//}

//- (void)doesNotRecognizeSelector:(SEL)aSelector
//{
//    if (aSelector == @selector(testMethod)) {
//        NSLog(@"testMethod doesNotRecognizeSelector");
//    }
//}

@end


@interface Object1 : NSObject

@property (nonatomic, strong) NSString *hello;

- (void)testMethod;

@end

@implementation Object1

- (void)testMethod
{
    NSLog(@"Object1  testMethod");
}

@end

@interface Object2 : Object1

@end

@implementation Object2

- (void)testMethod
{
    NSLog(@"Object2222  testMethod");
}


@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        id obj = [[SomeTestObject alloc] init];
//        [obj testMethod];
//        
//        Class statedClass = [obj class];
//        Class baseClass = object_getClass(obj);
//        
//        NSLog(@"%@--- %@",statedClass,baseClass);
        
        
        // 分别创建一个可变数组对象mutArray和不可变数组对象array
//        NSMutableArray *mutArray = [NSMutableArray arrayWithObjects:@"a", @"b", nil]; // 1
//        NSArray *array = @[@"c", @"d"]; // 2
//        
//        // 获取这两个对象mutArray和array的类并打印
//        Class mutArrayClassBefore = object_getClass(mutArray); // 3
//        Class arrayClassBefore = object_getClass(array); // 4
//        NSLog(@"%@ -- %@", NSStringFromClass(mutArrayClassBefore), NSStringFromClass(arrayClassBefore)); // 5
//        
//        Class setclass = object_setClass(mutArray, arrayClassBefore); // 6
//        NSLog(@"%@", NSStringFromClass(setclass)); // 7
//
//        Class mutArrayClassNow = object_getClass(mutArray); // 8
//        Class arrayClassNow = object_getClass(array); // 9
//        
//        NSLog(@"%@ -- %@", NSStringFromClass(mutArrayClassNow), NSStringFromClass(arrayClassNow)); // 10
//

        
        Object1 *obj1 = [[Object1 alloc] init];
        Object2 *obj2 = [[Object2 alloc] init];
        
        Class obj1c = object_getClass(obj1); // 3
        Class obj2c = object_getClass(obj2); // 4
        NSLog(@"%@ -- %@", NSStringFromClass(obj1c), NSStringFromClass(obj2c)); // 5
        
        Class setclass = object_setClass(obj1, obj2c);
        NSLog(@"setclass: %@", NSStringFromClass(setclass));
        
        Class mutArrayClassNow = object_getClass(obj2); // 8
        Class arrayClassNow = object_getClass(obj1); // 9
        NSLog(@"%@ -- %@", NSStringFromClass(mutArrayClassNow), NSStringFromClass(arrayClassNow)); // 10
        
        NSLog(@"xxx");
        [obj1 testMethod];
        

        

    }
    return 0;
}
