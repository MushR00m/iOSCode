//
//  main.m
//  objc非主流代码技巧
//
//  Created by chen songqi on 15/6/5.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AObj : NSObject

@end


@implementation AObj

- init // 返回值的- (TYPE)如果不写括号，编译器默认认为是- (id)类型:
{
    self = [super init];
    return self;
}

- a
{
    NSLog(@"this is a  object-c program");
    return nil;
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");

        AObj *aob = [[AObj alloc] init];
        [aob a];

        NSLog(@"------ %@",aob);


        CGRect rect1 = {1,2,3,4};

        NSLog(@"----rect1 :%@",NSStringFromRect(rect1));


        int numbers[] = {
            [1] = 3,
            [3] = 5,
            [5] = 7
        };

        int blocks = ({
            int a = 100 + 200;
            a;
        });

        printf("---- %d",blocks);

        for (int i = 0; i < 6; i++) {
            printf("%d,",numbers[i]);
        }
        //void(^block)(); // 返回值为void，参数可变的block

    }
    return 0;
}
