//
//  MainViewController.m
//  异步加载图片
//
//  Created by chen cheng on 14-9-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (IBAction)buttonClick:(id)sender
{
    _webImageView.imageURL = [NSURL URLWithString:@"http://www.huabian.com/uploadfile/2013/1222/20131222053129502.jpg"];
}
//http://www.huabian.com/uploadfile/2013/1222/20131222053129502.jpg



- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"NSHomeDirectory() = %@", NSHomeDirectory());
    
    _webImageView = [[QFWebImageView alloc] initWithFrame:CGRectMake(10, 30, 300, 300)];
    _webImageView.layer.borderColor = [UIColor blackColor].CGColor;
    _webImageView.layer.borderWidth = 1;
    
    _webImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.view addSubview:_webImageView];
}


- (void)dealloc
{
    [_webImageView release];
    _webImageView = nil;
        
    [super dealloc];
}
@end
