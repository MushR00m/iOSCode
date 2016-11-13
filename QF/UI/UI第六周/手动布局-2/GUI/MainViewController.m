//
//  MainViewController.m
//  手动布局
//
//  Created by chen cheng on 14-8-22.
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
    
    NSMutableArray  *labelMutableArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i<12; i++)
    {
        UILabel *label = [[UILabel alloc] init];
        label.text = [NSString stringWithFormat:@"%d", i+1];
        label.textAlignment= NSTextAlignmentCenter;
        
        [self.view addSubview:label];
        
        [labelMutableArray addObject:label];
    }
    
    _labelArray = [labelMutableArray copy];
    
    [labelMutableArray release];
    
    [self setLabelFrameWithOrientation:[UIDevice currentDevice].orientation];
}

- (void)setLabelFrameWithOrientation:(UIDeviceOrientation)orientation
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    if (orientation == UIDeviceOrientationLandscapeLeft
        ||
        orientation == UIDeviceOrientationLandscapeRight)
    {
        CGFloat  labelWidth = screenHeight/4.0;
        CGFloat  labelheight = (screenWidth-20)/3.0;
        for (int i=0; i<[_labelArray count]; i++)
        {
            UILabel *label = [_labelArray objectAtIndex:i];
            
            label.frame = CGRectMake(labelWidth * (i % 4), labelheight * (i/4), labelWidth, labelheight);
        }
    }
    else
    {
        CGFloat  labelWidth = screenWidth/3.0;
        CGFloat  labelheight = (screenHeight-20)/4.0;
        for (int i=0; i<[_labelArray count]; i++)
        {
            UILabel *label = [_labelArray objectAtIndex:i];
            
            label.frame = CGRectMake(labelWidth * (i % 3), labelheight * (i/3), labelWidth, labelheight);
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"willRotateToInterfaceOrientation toInterfaceOrientation = %d", toInterfaceOrientation);
    
    [self setLabelFrameWithOrientation:(UIDeviceOrientation)toInterfaceOrientation];
}


@end
