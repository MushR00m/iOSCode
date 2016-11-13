//
//  DrawerViewController.m
//  抽屉效果
//
//  Created by chen cheng on 14-8-28.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "DrawerViewController.h"

@interface DrawerViewController ()

@end

@implementation DrawerViewController

- (id)initWithLeftDrawerViewController:(UIViewController *)leftDrawerViewController;
{
    self = [super init];
    if (self != nil)
    {
       // NSLog(@"111111111111");
        self.leftDrawerViewController = leftDrawerViewController;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIPanGestureRecognizer  *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
    [panGestureRecognizer release];

}


- (void)pan:(UIPanGestureRecognizer *)panGestureRecognizer
{
    //当前的拖动位移
    CGPoint translationPoint = [panGestureRecognizer translationInView:self.view];
    
    CATransform3D transform = self.view.layer.transform;
    
    //拖动开始
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        if (_tapGestureRecognizerView == nil)
        {
            _tapGestureRecognizerView = [[UIView alloc] initWithFrame:self.view.bounds];
        }
        
        [self.view addSubview:_tapGestureRecognizerView];
        
        UITapGestureRecognizer  *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        
        [_tapGestureRecognizerView addGestureRecognizer:tapGestureRecognizer];
        
        [tapGestureRecognizer release];
        
        self.leftDrawerViewController.view.bounds = self.view.bounds;
        
        [[self.view superview] insertSubview:self.leftDrawerViewController.view belowSubview:self.view];
        NSLog(@"self.view superview::%@",[self.view superview]);
    }
    //拖动结束
    else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        //查看当前总得偏移量
        if (transform.m41 >= 90)
        {
            //靠近到最右边
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                CATransform3D transform = CATransform3DMakeTranslation(180, 0, 0);
                transform = CATransform3DScale(transform, 0.8, 0.8, 1);
                
                self.view.layer.transform = transform;
                
            } completion:^(BOOL finished) {
                
            }];
        }
        else
        {
            //还原到最初位置
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                self.view.layer.transform = CATransform3DIdentity;
                
            } completion:^(BOOL finished) {
                
                [_tapGestureRecognizerView removeFromSuperview];
                [_tapGestureRecognizerView release];
                _tapGestureRecognizerView = nil;
                
                [_leftDrawerViewController.view removeFromSuperview];
                
            }];
        }
    }
    //正在拖动
    else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
        //总得偏移量 不能大于180 或者 小于0
        if (transform.m41 + translationPoint.x > 180)
        {
            translationPoint.x = 180 - transform.m41;
        }
        else if (transform.m41 + translationPoint.x < 0)
        {
            translationPoint.x = -transform.m41;
        }
        
        
        CGFloat sx = 0.2 * (180-translationPoint.x)/180+0.8;
        
        
        transform = CATransform3DTranslate(transform, translationPoint.x, 0, 0);
        
        transform = CATransform3DScale(transform, sx, sx, 1);
        
        self.view.layer.transform = transform;
        
        
        [panGestureRecognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    }
}

- (void)tap:(UITapGestureRecognizer *)tapGestureRecognizer
{
    [self closeDrawerView];
}

- (void)showLeftLeftDrawerView
{
    NSLog(@"showLeftLeftDrawerView");
    if (_tapGestureRecognizerView == nil)
    {
         _tapGestureRecognizerView = [[UIView alloc] initWithFrame:self.view.bounds];
    }
    
    [self.view addSubview:_tapGestureRecognizerView];
    
    UITapGestureRecognizer  *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    
    [_tapGestureRecognizerView addGestureRecognizer:tapGestureRecognizer];
    
    [tapGestureRecognizer release];

    
    self.leftDrawerViewController.view.frame = self.view.frame;
    
    [[self.view superview] insertSubview:self.leftDrawerViewController.view belowSubview:self.view];
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        CATransform3D transform = CATransform3DMakeTranslation(180, 0, 0);
        transform = CATransform3DScale(transform, 0.8, 0.8, 1);
        
        self.view.layer.transform = transform;
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)closeDrawerView
{
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.view.layer.transform = CATransform3DIdentity;;
        
    } completion:^(BOOL finished) {
        
        [_tapGestureRecognizerView removeFromSuperview];
        [_tapGestureRecognizerView release];
        _tapGestureRecognizerView = nil;
        
        [_leftDrawerViewController.view removeFromSuperview];
    }];
}


@end
