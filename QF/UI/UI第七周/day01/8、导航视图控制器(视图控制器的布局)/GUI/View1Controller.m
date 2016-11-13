//
//  View1Controller.m
//  导航视图控制器
//
//  Created by chen cheng on 14-8-26.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "View1Controller.h"

#import "MainViewController.h"

#import "CheckBox.h"

@interface View1Controller ()

@end

@implementation View1Controller

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        //设置标题的方法一
        //告诉导航视图控制给我绘制一个标题
        //self.title = @"视图一";
        
        //设置标题的方法二
        //告诉导航视图控制给我绘制一个标题
        self.navigationItem.title = @"视图一";
        
        
        //设置标题的方法三
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 60)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = @"视图一";
        titleLabel.textColor = [UIColor redColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:20];
        self.navigationItem.titleView = titleLabel;
        [titleLabel release];
        
        
        
        //告诉导航视图控制给我绘制按钮 说明：UIBarButtonItem不是视图类。
        //self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"左边按钮" style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonClick:)] autorelease];
        
        //self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"右边按钮" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonClick:)] autorelease];
        
        //创建导航按钮的方法一
        UIBarButtonItem *leftButton1 = [[UIBarButtonItem alloc] initWithTitle:@"按钮1" style:UIBarButtonItemStylePlain target:self action:@selector(leftButton1Click:)];
        
        UIBarButtonItem *leftButton2 = [[UIBarButtonItem alloc] initWithTitle:@"按钮2" style:UIBarButtonItemStylePlain target:self action:@selector(leftButton2Click:)];
        
        self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftButton1, leftButton2, nil];
        
        [leftButton1 release];
        [leftButton2 release];
        
        
        //创建导航按钮的方法二
        UIBarButtonItem *rightBarButton1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
        
        
        CheckBox *checkBox = [[CheckBox alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        
        //创建导航按钮的方法三
        UIBarButtonItem *rightBarButton2 = [[UIBarButtonItem alloc] initWithCustomView:checkBox];
        
        [checkBox release];
        
        //创建导航按钮的方法四
       // UIBarButtonItem *rightBarButton3 = [[UIBarButtonItem alloc] initWithImage:<#(UIImage *)#> style:<#(UIBarButtonItemStyle)#> target:<#(id)#> action:<#(SEL)#>];
        
        
        self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:rightBarButton1, rightBarButton2, nil];
        
        //不希望全屏布局的属性
        if ([[[UIDevice currentDevice] systemVersion] UTF8String][0] >= '7')
        {
            self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeBottom | UIRectEdgeRight;
        }
        else
        {
            self.wantsFullScreenLayout = NO;
        }
        
        
        
    }
    return self;
}

- (void)leftButtonClick:(id)sender
{
    NSLog(@"leftButtonClick");
}

- (void)rightButtonClick:(id)sender
{
    NSLog(@"leftButtonClick");
}

- (void)leftButton1Click:(id)sender
{
    NSLog(@"leftButton1Click");
}

- (void)leftButton2Click:(id)sender
{
    NSLog(@"leftButton2Click");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 64, 300, 40)];
    
    
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    [button release];
}

- (void)buttonClick:(id)sender
{
    NSLog(@"buttonClick");
    
    [self.delegate showView2WithAnimated:YES];
}

@end
