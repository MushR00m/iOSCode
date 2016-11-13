//
//  ViewController.m
//  BlurDemo
//
//  Created by huangwenchen on 15/5/8.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (strong,nonatomic) UIVisualEffectView * visualview;
@property (nonatomic)NSInteger currentIndex;
@end


/**

 UIVisualEffect是一个继承自NSObject的创建视觉效果的基类，然而这个类除了继承自NSObject的属性和方法外，没有提供任何新的属性和方法。其主要目的是用于初始化UIVisualEffectView，在这个初始化方法中可以传入UIBlurEffect或者UIVibrancyEffect对象。

 一个UIBlurEffect对象用于将blur(毛玻璃)效果应用于UIVisualEffectView视图下面的内容。如上面的示例所示。不过，这个对象的效果并不影响UIVisualEffectView对象的contentView中的内容。
 
   UIBlurEffect主要定义了三种效果，这些效果由枚举UIBlurEffectStyle来确定，该枚举的定义如下：
 enum UIBlurEffectStyle : Int {

 case ExtraLight

 case Light

 case Dark
 }
 
 
 其主要是根据色调(hue)来确定特效视图与底部视图的混合。

 与UIBlurEffect不同的是，UIVibrancyEffect主要用于放大和调整UIVisualEffectView视图下面的内容的颜色，同时让UIVisualEffectView的contentView中的内容看起来更加生动。通常UIVibrancyEffect对象是与UIBlurEffect一起使用，主要用于处理在UIBlurEffect特效上的一些显示效果。接上面的代码，我们看看在blur的视图上添加一些新的特效
 
 尽量避免将UIVisualEffectView对象的alpha值设置为小于1.0的值，因为创建半透明的视图会导致系统在离屏渲染时去对UIVisualEffectView对象及所有的相关的子视图做混合操作。这不但消耗CPU/GPU，也可能会导致许多效果显示不正确或者根本不显示。

 */

@implementation ViewController
-(NSArray *)blurEffectArray{

    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];

    return @[[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark],
             [UIVibrancyEffect effectForBlurEffect:blurEffect],
             [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight],
             ];
}
-(NSArray *)titleArray{
    return @[@"Dark",@"Light",@"ExtraLight"];
}
-(void)setCurrentIndex:(NSInteger)currentIndex{
    if (self.visualview != nil) {
        [self.visualview removeFromSuperview];
    }
    self.visualview = [[UIVisualEffectView alloc] initWithEffect:[[self blurEffectArray] objectAtIndex:currentIndex]];
    self.visualview.frame = CGRectInset(self.imageview.bounds, 20, 20);
    self.visualview.layer.cornerRadius = 15;
    self.visualview.layer.masksToBounds = YES;
    self.navigationItem.title = [[self titleArray] objectAtIndex:currentIndex];
    [self.imageview addSubview:self.visualview];
    _currentIndex = currentIndex;


    UILabel *testlabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 120, 22)];
    testlabel.text = @"hello world";
    [self.visualview.contentView addSubview: testlabel];


}
- (IBAction)swipt:(UISwipeGestureRecognizer *)sender {
    self.currentIndex = (self.currentIndex + 1)%[self blurEffectArray].count;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageview.userInteractionEnabled = YES;
    self.currentIndex = 0;
    // Do any additional setup after loading the view, typically from a nib.
}

@end
