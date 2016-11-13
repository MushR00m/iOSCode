//
//  ViewController.m
//  Layer测试
//
//  Created by chen songqi on 15/8/11.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *testView;

@property (nonatomic, strong) CALayer *myLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _testView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _testView.center = self.view.center;
    [self.view addSubview:_testView];


    _myLayer = [[CALayer alloc] init];
    _myLayer.frame = CGRectMake(0, 0, 100, 100);
    _myLayer.position = self.view.center;
    [self.view.layer addSublayer:_myLayer];

    UIImage *image = [UIImage imageNamed:@"5.ico"];
    _myLayer.contents = (__bridge id)(image.CGImage);//如果你给contents赋的不是CGImage，那么你得到的图层将是空白的。事实上，你真正要赋值的类型应该是CGImageRef，它是一个指向CGImage结构的指针。

    _myLayer.borderColor = [UIColor redColor].CGColor;
    _myLayer.borderWidth = 1;

    //contentsGravity的目的是为了决定内容在图层的边界中怎么对齐
    //_myLayer.contentsGravity = kCAGravityLeft;

    //contentsScale属性定义了寄宿图的像素尺寸和视图大小的比例，默认情况下它是一个值为1.0的浮点数。
    _myLayer.contentsScale = 1;
    //_myLayer.contentsScale = [UIScreen mainScreen].scale;

    _myLayer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    //contentsRect属性允许我们在图层边框里显示寄宿图的一个子域。



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
