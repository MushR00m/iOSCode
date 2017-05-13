//
//  MyButton.m
//  事件链
//
//  Created by chensongqi on 2017/3/27.
//  Copyright © 2017年 chensongqi. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    printf("MyButton touch Began\n");
    [self.nextResponder touchesBegan:touches withEvent:event];
}


@end
