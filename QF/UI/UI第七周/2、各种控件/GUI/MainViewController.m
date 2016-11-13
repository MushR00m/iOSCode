//
//  MainViewController.m
//  各种控件
//
//  Created by chen cheng on 14-8-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _segmentedControl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(10, 30, 300, 40)];
    
    //设置字体颜色
    //_segmentedControl.tintColor = [UIColor darkGrayColor];
    //选项
    [_segmentedControl insertSegmentWithTitle:@"男" atIndex:0 animated:NO];
    [_segmentedControl insertSegmentWithTitle:@"女" atIndex:1 animated:NO];
    [_segmentedControl insertSegmentWithTitle:@"不确定" atIndex:2 animated:NO];
    
    _segmentedControl.selectedSegmentIndex = 2;
    
    [_segmentedControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    //_segmentedControl.layer.borderColor = [UIColor blackColor].CGColor;
    //_segmentedControl.layer.borderWidth = 1;
    
    [self.view addSubview:_segmentedControl];
    
    
    //设置音量的
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(10, 30 + 50, 300, 40)];
    
    _slider.maximumValue = 100;
    _slider.minimumValue = 0;
    
    //设置外观颜色
    //_slider.tintColor = [UIColor redColor];
    
    //设置左边的颜色
    _slider.minimumTrackTintColor = [UIColor orangeColor];
    
    //设置右边的颜色
    _slider.maximumTrackTintColor = [UIColor greenColor];
    
    [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    //[self.view addSubview:_slider];
    
    
    
    _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    _activityIndicatorView.frame = CGRectMake(10, 30 + 50 * 2, 300, 100);
    
    _activityIndicatorView.hidesWhenStopped = NO;
    
    
    [self.view addSubview:_activityIndicatorView];
    
    //进度条
    _progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    
    _progressView.frame = CGRectMake(10, 30 + 50 * 4, 300, 40);
    
    _progressView.progress = 0.0;
    
    _progressView.progressTintColor = [UIColor redColor];
    
    [self.view addSubview:_progressView];
    
    //加减值
    _stepper = [[UIStepper alloc] initWithFrame:CGRectMake(10, 30 + 50 * 5, 300, 400)];
    
    
    [_stepper addTarget:self action:@selector(stepperValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    _stepper.autorepeat = YES;
    _stepper.maximumValue = 10;
    _stepper.minimumValue = 1;
    
    [self.view addSubview:_stepper];
    
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 30, 300, 100)];
    
    _textView.layer.borderColor = [UIColor blackColor].CGColor;
    _textView.layer.borderWidth = 1;
    
    _textView.font = [UIFont boldSystemFontOfSize:30];
    
    _textView.delegate = self;
    
    
    //[self.view addSubview:_textView];
}

- (void)stepperValueChanged:(UIStepper *)stepper
{
    NSLog(@"stepper.value = %f", stepper.value);
}

- (void)segmentedControlValueChanged:(UISegmentedControl *)segmentedControl
{
    NSLog(@"segmentedControl.selectedSegmentIndex = %d", segmentedControl.selectedSegmentIndex);
    
    //[_activityIndicatorView startAnimating];
    
   /*if (segmentedControl.selectedSegmentIndex == 2)
    {
        UIAlertView  *alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"你确定你的性别是不确定吗 ?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"百分百确定", nil];
        
        [alertView show];
        
        [alertView release];
    }*/
    
    if (segmentedControl.selectedSegmentIndex == 2)
    {
        UIActionSheet  *actionSheet = [[UIActionSheet alloc] initWithTitle:@"确认信息" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"删除" otherButtonTitles:@"按钮1", nil];
        
        [actionSheet showFromRect:self.view.bounds inView:self.view animated:YES];
        
        [actionSheet release];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonIndex = %d", buttonIndex);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonIndex = %d", buttonIndex);
}

- (void)sliderValueChanged:(UISlider *)slider
{
    NSLog(@"slider.value = %f", slider.value);
    
    _progressView.progress = slider.value/100.0;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







@end
