//
//  ViewController.m
//  KOV_1
//
//  Created by songqi on 2017/5/13.
//  Copyright © 2017年 好样的. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>

typedef void(^MXObservingBlock)(id observedObject, NSString *observedKey, id oldValue, id newValue);

@interface NSObject (MXKeyValueObserving)

- (void)MX_observeValueForKey:(nullable NSString *)key
               observedObject:(nullable id)observedObject
                     oldValue:(nullable id)oldValue
                     newValue:(nullable id)newValue;

@end

@interface NSObject (KVO)

- (void)MX_addObserver:(nonnull NSObject *)observer
                forKey:(nonnull NSString *)key
             withBlock:(nonnull MXObservingBlock)block;

- (void)MX_removeObserver:(nonnull NSObject *)observer
                   forKey:(nonnull NSString *)key;

@end



NSString *const kMXKVOClassPrefix = @"kMXKVOClassPrefix_";
NSString *const kMXKVOAssociatedObservers = @"kMXKVOAssociatedObservers";

@interface MXObservationInfo : NSObject

@property (nonatomic, weak) NSObject *observer;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) MXObservingBlock block;

@end

@implementation MXObservationInfo

- (instancetype)initWithObserver:(NSObject *)observer forKey:(NSString *)key withBlock:(MXObservingBlock)block
{
    self = [super init];
    if (self)
    {
        _observer = observer;
        _key = key;
        _block = block;
    }
    
    return self;
}

@end

@implementation NSObject (KVO)

static void kvo_setter(id self, SEL _cmd, id newValue)
{
    NSString *setterName = NSStringFromSelector(_cmd);
    NSRange range = NSMakeRange(3, setterName.length - 4);
    NSString *getterName = [setterName substringWithRange:range];
    NSString *firstLetter = [[getterName substringToIndex:1] lowercaseString];
    getterName = [getterName stringByReplacingCharactersInRange:NSMakeRange(0, 1)
                                                     withString:firstLetter];
    
    if (!getterName)
    {
        NSString *reason = [NSString stringWithFormat:@"Object %@ does not have setter %@", self, setterName];
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:reason
                                     userInfo:nil];
        return;
    }
    
    id oldValue = [self valueForKey:getterName];
    
    struct objc_super superclazz = {
        .receiver = self,
        .super_class = class_getSuperclass(object_getClass(self))
    };
    
    void (*objc_msgSendSuperCasted)(void *, SEL, id) = (void *)objc_msgSendSuper;
    objc_msgSendSuperCasted(&superclazz, _cmd, newValue);
    
    // 回调观察者的 block
    NSMutableArray *observers = objc_getAssociatedObject(self, (__bridge const void *)(kMXKVOAssociatedObservers));
    for (MXObservationInfo *each in observers)
    {
        if ([each.key isEqualToString:getterName])
        {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
                NSLog(@"each.key");
                each.block(self, getterName, oldValue, newValue);
                
//                [each.observer MX_observeValueForKey:each.key observedObject:self oldValue:oldValue newValue:newValue];
            });
            
        }
    }
}

- (void)MX_addObserver:(nonnull NSObject *)observer forKey:(nonnull NSString *)key withBlock:(MXObservingBlock)block
{
    
    // 先检查被观察对象的 class 或者 superclasses 有没有实现 setter 方法，没有则抛出异常
    NSString *firstLetter = [[key substringToIndex:1] uppercaseString];
    NSString *remainingLetters = [key substringFromIndex:1];
    NSString *setter = [NSString stringWithFormat:@"set%@%@:", firstLetter, remainingLetters];
    
    SEL setterSelector = NSSelectorFromString(setter);
    Method setterMethod = class_getInstanceMethod([self class], setterSelector);
    if (!setterMethod)
    {
        // 抛出异常
    }
    
    // 如果是首次添加观察者对象，则创建新类
    Class clazz = object_getClass(self);
    NSString *clazzName = NSStringFromClass(clazz);
    if (![clazzName hasPrefix:kMXKVOClassPrefix])
    {
        NSString *kvoClazzName = [kMXKVOClassPrefix stringByAppendingString:clazzName];
        Class kvoClazz = NSClassFromString(kvoClazzName);
        if (!kvoClazz)
        {
            // 新类尚不存在进行创建
            Class originalClazz = object_getClass(self);
            kvoClazz = objc_allocateClassPair(originalClazz, kvoClazzName.UTF8String, 0);
            objc_registerClassPair(kvoClazz);
            object_setClass(self, kvoClazz);
            
            clazz = kvoClazz;
        }
    }
    
    // 检查是否实现了自定义的 setter 方法，没有实现则添加
    BOOL hasSelector = NO;
    unsigned int methodCount = 0;
    Method *methodList = class_copyMethodList(clazz, &methodCount);
    for (unsigned int i = 0; i < methodCount; i++)
    {
        SEL thisSelector = method_getName(methodList[i]);
        NSLog(@"NSStringFromSelector %@", NSStringFromSelector(thisSelector));
        
        if (thisSelector == setterSelector)
        {
            hasSelector = YES;
            break;
        }
        
    }
    free(methodList);
    
    if (!hasSelector)
    {
        const char *types = method_getTypeEncoding(setterMethod);
        class_addMethod(clazz, setterSelector, (IMP)kvo_setter, types);
    }
    
    
    // 封装观察者信息，使用 AssociatedObject 保存
    MXObservationInfo *info = [[MXObservationInfo alloc] initWithObserver:observer forKey:key withBlock:block];
    NSMutableArray *observers = objc_getAssociatedObject(self, (__bridge const void *)(kMXKVOAssociatedObservers));
    if (!observers) {
        observers = [NSMutableArray array];
        objc_setAssociatedObject(self, (__bridge const void *)(kMXKVOAssociatedObservers), observers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [observers addObject:info];
}

- (void)MX_removeObserver:(nonnull NSObject *)observer
forKey:(nonnull NSString *)key
{
    NSMutableArray* observers = objc_getAssociatedObject(self, (__bridge const void *)(kMXKVOAssociatedObservers));
    
    MXObservationInfo *infoToRemove;
    for (MXObservationInfo* info in observers)
    {
        if (info.observer == observer && [info.key isEqual:key])
        {
            infoToRemove = info;
            break;
        }
    }
    
    [observers removeObject:infoToRemove];
}

@end















@interface TestObject : NSObject

{
    NSString *_name;
}

//@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *firstName;

@property (nonatomic, copy) NSString *fullName;

@end

@implementation TestObject

//- (NSString *)fullName {
//    return [NSString stringWithFormat:@"%@ %@",self.firstName, _name];
//}
//
//+ (NSSet *)keyPathsForValuesAffectingFullName
//{
//    return [NSSet setWithObjects:@"firstName", @"name", nil];
//}

@end

@interface ViewController ()

@property (nonatomic, strong) TestObject *aTest;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.aTest = [[TestObject alloc] init];
    [self.aTest addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
//    [self.aTest setValue:@"hello" forKey:@"firstName"];
    

}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"change: %@",change);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.aTest setValue:@"hello" forKey:@"name"];
//    self.aTest.name = @" world";
}


//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    self.aTest = [[TestObject alloc] init];
//    [self.aTest MX_addObserver:self forKey:@"name" withBlock:^(id observedObject, NSString *observedKey, id oldValue, id newValue) {
//       
//        NSLog(@"newValue = %@ ",newValue);
//    }];
//}

@end
