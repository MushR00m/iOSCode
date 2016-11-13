//
//  MainViewController.m
//  多媒体
//
//  Created by chen cheng on 14-4-24.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController


- (void)dealloc
{
    [_moviePlayerViewController release];
    _moviePlayerViewController = nil;
    
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

- (void)loadView
{
    [super loadView];
    
    NSURL  *mp4URL = [[NSBundle mainBundle] URLForResource:@"2" withExtension:@"MOV"];
    
    NSLog(@"mp4URL = %@", mp4URL);
    
    /*_moviePlayerViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:mp4URL];
    
    _moviePlayerViewController.view.frame = self.view.bounds;
    [self.view addSubview:_moviePlayerViewController.view];*/
    
    
    _moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:mp4URL];
    
    _moviePlayerController.allowsAirPlay = YES;//是否AirPlay
    [_moviePlayerController prepareToPlay];//准备好播放
    
    _moviePlayerController.view.frame = CGRectMake(10, 30, 300, 400);
    [self.view addSubview:_moviePlayerController.view];
}


@end
