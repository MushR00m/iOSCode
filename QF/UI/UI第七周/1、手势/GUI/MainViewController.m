//
//  MainViewController.m
//  手势
//
//  Created by chen cheng on 14-8-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)dealloc
{
    [_imageView release];
    _imageView = nil;
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(110, 100, 100, 200)];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    _imageView.image = [UIImage imageNamed:@"1.JPG"];
    
    _imageView.userInteractionEnabled = YES;
    
    _imageViewRotation = 0;
    
    [self.view addSubview:_imageView];
    
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [_imageView addGestureRecognizer:tapGestureRecognizer];
    
    
    
    UITapGestureRecognizer *doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    doubleTapGestureRecognizer.numberOfTapsRequired = 2;
    [_imageView addGestureRecognizer:doubleTapGestureRecognizer];
    
    
    //在检测双击失败的后再检查单击。会导致单击手势延后响应
    [tapGestureRecognizer requireGestureRecognizerToFail:doubleTapGestureRecognizer];
    
    [tapGestureRecognizer release];
    [doubleTapGestureRecognizer release];

    
    
    
    UILongPressGestureRecognizer  *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [_imageView addGestureRecognizer:longPressGestureRecognizer];
    [longPressGestureRecognizer release];
    
    
    UIPanGestureRecognizer  *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    panGestureRecognizer.delegate = self;
    [_imageView addGestureRecognizer:panGestureRecognizer];
    [panGestureRecognizer release];
    
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pin:)];
    pinchGestureRecognizer.delegate = self;
    [_imageView addGestureRecognizer:pinchGestureRecognizer];
    [pinchGestureRecognizer release];
    
    
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    [_imageView addGestureRecognizer:rotationGestureRecognizer];
    rotationGestureRecognizer.delegate = self;
    [rotationGestureRecognizer release];
}

- (void)longPress:(UILongPressGestureRecognizer *)longPressGestureRecognizer
{
    NSLog(@"longPress longPressGestureRecognizer.state = %d", longPressGestureRecognizer.state);
}

- (void)doubleTap:(UITapGestureRecognizer *)tapGestureRecognizer
{
    NSLog(@"doubleTap");
}

- (void)tap:(UITapGestureRecognizer *)tapGestureRecognizer
{
    NSLog(@"tap");
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        _imageView.layer.transform = CATransform3DRotate(_imageView.layer.transform, -_imageViewRotation, 0, 0, 1);
        
        _imageViewRotation = 0;
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    
    
}

- (void)pan:(UIPanGestureRecognizer *)panGestureRecognizer
{
    //NSLog(@"panGestureRecognizer.state = %d", panGestureRecognizer.state);
    
    //取得在_imageView视图上的偏移量
    CGPoint point = [panGestureRecognizer translationInView:_imageView];
    
    //NSLog(@"pan point.x = %f, point.y = %f", point.x, point.y);
    
    
    _imageView.layer.transform = CATransform3DTranslate(_imageView.layer.transform, point.x, point.y, 0);
    
    //重新把偏移量设置成0  （不然是累加效果）
    [panGestureRecognizer setTranslation:CGPointMake(0, 0) inView:_imageView];
    
    CGPoint vPoint = [panGestureRecognizer velocityInView:_imageView];
    
    NSLog(@"vPoint.x = %f, vPoint.y = %f", vPoint.x, vPoint.y);
    
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            
            _imageView.layer.transform = CATransform3DTranslate(_imageView.layer.transform, vPoint.x/100.0, vPoint.y/100, 0);
            
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)pin:(UIPinchGestureRecognizer *)pinchGestureRecognizer
{
    NSLog(@"pin pinchGestureRecognizer.scale = %f", pinchGestureRecognizer.scale);
    
    
    _imageView.layer.transform = CATransform3DScale(_imageView.layer.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale, 1);
    
    //重新把缩放系数设置成1  表示没有缩放  不然就是累加效果
    pinchGestureRecognizer.scale = 1;
}

- (void)rotation:(UIRotationGestureRecognizer *)rotationGestureRecognizer
{
    NSLog(@"rotation");
    
    _imageViewRotation += rotationGestureRecognizer.rotation;
    
    _imageView.layer.transform = CATransform3DRotate(_imageView.layer.transform, rotationGestureRecognizer.rotation, 0, 0, 1);
    
    rotationGestureRecognizer.rotation = 0;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;//同时支持手势gestureRecognizer和手势otherGestureRecognizer（在本例当中就是同时支持缩放、旋转和拖动）
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
