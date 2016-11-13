//
//  ViewController.m
//  Auto Layout 纯代码_1
//
//  Created by chen songqi on 15/8/3.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

// 参考网址： http://www.tuicool.com/articles/yuiqIv
#import "ViewController.h"

/** 关键字
 元素
 关系
 约束
 描述
 
 
 NSLayoutConstraint 有两个方法
 + (id)constraintWithItem:(id)view1
                 attribute:(NSLayoutAttribute)attribute1
                 relatedBy:(NSLayoutRelation)relation
                 toItem:(id)view2
                 attribute:(NSLayoutAttribute)attribute2
                 multiplier:(CGFloat)multiplier
                 constant:(CGFloat)constant;
 view1.attribute1 = view2.attribute2 × multiplier + constant
 还有一个参数是 relation ，这是一个关系参数，它标明了上面这个公式两边的关系，它可以是 小于等于 (≤) ， 等于 (=) 和 大于等于 (≥) 。上面的公式假定了这个参数传入的是 = ，根据参数的不同，公式中的关系符号也不同。
 
 第二个方法
 + (NSArray *)constraintsWithVisualFormat:(NSString *)format
 options:(NSLayoutFormatOptions)opts
 metrics:(NSDictionary *)metrics
 views:(NSDictionary *)views;
 

 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self autoLayoutMethodTwo];

}

- (void)autoLayoutMethodOne
{

    UIView *view = [UIView new];
    [view setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:view];

    CGRect viewFrame = CGRectMake(50.f, 100.f, 150.f, 150.f);


//    UIView *testView2 = [[UIView alloc] initWithFrame:CGRectMake(50.f, 100.f, 50.f, 150.f)];
//    testView2.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:testView2];

    // 使用 Auto Layout 布局  禁止将 Autoresizing Mask 转换为约束
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];

    // `view` 的左边距离 `self.view` 的左边 50 点.
    NSLayoutConstraint *viewLeft = [NSLayoutConstraint constraintWithItem:view
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.view
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1
                                                                 constant:CGRectGetMinX(viewFrame)];
    // `view` 的顶部距离 `self.view` 的顶部 100 点.
    NSLayoutConstraint *viewTop = [NSLayoutConstraint constraintWithItem:view
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.view
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1
                                                                constant:CGRectGetMinY(viewFrame)];
    // `view` 的宽度 是 60 点.
    NSLayoutConstraint *viewWidth = [NSLayoutConstraint constraintWithItem:view
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1
                                                                  constant:CGRectGetWidth(viewFrame)];
    // `view` 的高度是 60 点.
    NSLayoutConstraint *viewHeight = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1
                                                                   constant:CGRectGetHeight(viewFrame)];
   //NSLayoutRelationGreaterThanOrEqual 因为 Auto Layout 是相对布局，所以通常你不应该直接设置宽度和高度这种固定不变的值，除非你很确定视图的宽度或高度需要保持不变



    // 把约束添加到父视图上.
    [self.view addConstraints:@[viewLeft, viewTop, viewWidth, viewHeight]];

    //把所有约束都添加到了 view 的父视图 self.view 上。 view 的约束为什么不添加到自身而添加到别的视图上去呢？这是由于约束是根据视图层级 自下而上 更新的，也就是从子视图到父视图。
}

- (void)autoLayoutMethodTwo
{
    //VFL https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/AutolayoutPG/VisualFormatLanguage/VisualFormatLanguage.html#//apple_ref/doc/uid/TP40010853-CH3-SW1

    UIView *view = [UIView new];
    [view setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:view];

    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSDictionary *views = NSDictionaryOfVariableBindings(self.view, view);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[view(>=150)]" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[view(>=150)]" options:0 metrics:nil views:views]];

    /**
     1、H / V 表示布局方向。 H 表示水平方向（Horizontal）， V 表示垂直方向（Vertical），方向后要紧跟一个 : ，不能有空格。
     2、| 表示父视图。通常出现在语句的首尾。
     3、- 有两个用途，
            单独一个表示标准距离。这个值通常是 8 ；
            两个中间夹着数值，表示使用中间的数值代替标准距离，如第一句的 -50- ，就是使用 50 来代替标准距离。
     4、[] 表示对象 括号中间需要填上对象名，对象名必须是我们传入的 views 字典中的键。对象名后可以跟小括号 () ，小括号中是对此对象的尺寸和优先级约束

     
     优先级
     UILayoutPriorityRequired  = 1000,这是默认值，这意味着这个约束条件必须被精确地满足。
     UILayoutPriorityDefaultHigh = 750,
     UILayoutPriorityDefaultLow = 250,
     UILayoutPriorityFittingSizeLevel = 50, 这是内置的最低优先级。
     */

}


@end
