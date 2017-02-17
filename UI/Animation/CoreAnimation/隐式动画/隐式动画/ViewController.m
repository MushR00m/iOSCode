//
//  ViewController.m
//  隐式动画
//
//  Created by chen songqi on 15/8/13.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *colorLayer;

@property (weak, nonatomic) IBOutlet UIButton *changeColorBtn;


@property (nonatomic, strong) UIView *layerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    //add it to our view
    [self.view.layer addSublayer:self.colorLayer];

    [_changeColorBtn addTarget:self action:@selector(btnAction3:) forControlEvents:UIControlEventTouchUpInside];


    _layerView = [[UIView alloc] initWithFrame:CGRectMake(180, 50, 100, 100)];
    _layerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_layerView];

}



- (void)btnAction:(id)sender {

    //randomize the layer background color
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;

    //就是所谓的隐式动画。之所以叫隐式是因为我们并没有指定任何动画的类型。我们仅仅改变了一个属性，然后Core Animation来决定如何并且何时去做动画。
    //当你改变一个属性，Core Animation是如何判断动画类型和持续时间的呢？实际上动画执行的时间取决于当前事务的设置，动画类型取决于图层行为。

    //事务实际上是Core Animation用来包含一系列属性动画集合的机制，任何用指定事务去改变可以做动画的图层属性都不会立刻发生变化，而是当事务一旦提交的时候开始用一个动画过渡到新值。

    //事务是通过CATransaction类来做管理，这个类的设计有些奇怪，不像你从它的命名预期的那样去管理一个简单的事务，而是管理了一叠你不能访问的事务。CATransaction没有属性或者实例方法，并且也不能用+alloc和-init方法创建它。但是可以用+begin和+commit分别来入栈或者出栈。


}


- (void)btnAction2:(id)sender {

    //begin a new transaction
    [CATransaction begin];
    //set the animation duration to 1 second
    [CATransaction setAnimationDuration:1.0];

    [CATransaction setCompletionBlock:^{
        //rotate the layer 90 degrees
        CGAffineTransform transform = self.colorLayer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI_2/2);
        self.colorLayer.affineTransform = transform;
    }];
    
    //randomize the layer background color
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    //commit the transaction
    [CATransaction commit];
}


- (void)btnAction3:(id)sender
{


    [CATransaction setDisableActions:YES];
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0];

    //randomize the layer background color
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.layerView.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];

    [CATransaction commit];

}



@end
