//
//  QFController.h
//  视图切换
//
//  Created by chen cheng on 14-8-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "View1.h"
#import "View2.h"

@interface QFController : NSObject
{
    View1  *_view1;
    View2  *_view2;
}

@property(assign, readwrite, nonatomic)UIWindow *window;

+ (QFController *)shareQFController;

-(void)showViw2WithAnimated:(BOOL)animated;
-(void)backView1WithAnimated:(BOOL)animated;



@end
