//
//  ViewController.m
//  UIMenuControllerDemo
//
//  Created by chen songqi on 15/7/30.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"


@interface APLEmailMenuItem : UIMenuItem
@property (nonatomic) NSIndexPath *indexPath;

@end

@implementation APLEmailMenuItem
@end


@interface ViewController ()

@property (nonatomic, strong) UIView *testView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _testView.backgroundColor = [UIColor redColor];
    _testView.center = self.view.center;
    [self.view addSubview:_testView];


    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [_testView addGestureRecognizer:tap];
}

//附加在菜单的视图的 canBecomeFirstResponser 必须返回 YES，这意味着必须子类化。例如最常用的显示元素 UITableViewCell 和 UILabel 默认返回的是 NO
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    if (self.isFirstResponder) {
        NSLog(@"当前是第一响应者");
    } else {
        NSLog(@"当前不是第一响应者");
    }

    if (![self becomeFirstResponder]) {
        NSLog(@"Couldn't become first responder ");

    }
    CGPoint pt = [tap locationInView:self.view];

    APLEmailMenuItem *item1 = [[APLEmailMenuItem alloc] initWithTitle:@"copy" action:@selector(copyAction:)];

    APLEmailMenuItem *item2 = [[APLEmailMenuItem alloc] initWithTitle:@"cut" action:@selector(cutAction:)];

    UIMenuController *menuController = [UIMenuController sharedMenuController];
    [menuController setMenuVisible:NO];

    menuController.menuItems = @[item1,item2];
    
    [menuController setTargetRect:CGRectMake(pt.x, pt.y, 0, 0) inView:self.view];
    [menuController setMenuVisible:YES animated:NO];


}



- (void)copyAction:(UIMenuController *)menuController
{
    NSLog(@"点击Copy");
}


- (void)cutAction:(UIMenuController *)menuController
{
    NSLog(@"点击剪切");
}


@end
