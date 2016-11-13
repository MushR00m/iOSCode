//
//  MainViewController.m
//  多媒体
//
//  Created by chen cheng on 14-4-24.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"


@implementation MainView

- (void)dealloc
{
    [_playButton release];
    _playButton = nil;
    
    [_pauseButton release];
    _pauseButton = nil;
    
    [_stopButton release];
    _stopButton = nil;
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        _playButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
        [_playButton addTarget:self action:@selector(playButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _playButton.frame = CGRectMake(self.frame.size.width/2.0 - 50, 60, 100, 40);
        [_playButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_playButton setTitle:@"播放" forState:UIControlStateNormal];
        
        _playButton.layer.borderColor = [UIColor blackColor].CGColor;
        _playButton.layer.borderWidth = 1;
        _playButton.layer.masksToBounds = YES;
        _playButton.layer.cornerRadius = 5;
        
        [self addSubview:_playButton];
        
        _pauseButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
        [_pauseButton addTarget:self action:@selector(pauseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _pauseButton.frame = CGRectMake(self.frame.size.width/2.0 - 50, _playButton.frame.origin.y + _playButton.frame.size.height + 10, 100, 40);
        [_pauseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_pauseButton setTitle:@"暂停" forState:UIControlStateNormal];
        
        _pauseButton.layer.borderColor = [UIColor blackColor].CGColor;
        _pauseButton.layer.borderWidth = 1;
        _pauseButton.layer.masksToBounds = YES;
        _pauseButton.layer.cornerRadius = 5;
        
        [self addSubview:_pauseButton];
        
        _stopButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
        [_stopButton addTarget:self action:@selector(stopButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _stopButton.frame = CGRectMake(self.frame.size.width/2.0 - 50, _pauseButton.frame.origin.y + _pauseButton.frame.size.height + 10, 100, 40);
        [_stopButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_stopButton setTitle:@"停止" forState:UIControlStateNormal];
        
        _stopButton.layer.borderColor = [UIColor blackColor].CGColor;
        _stopButton.layer.borderWidth = 1;
        _stopButton.layer.masksToBounds = YES;
        _stopButton.layer.cornerRadius = 5;
        
        [self addSubview:_stopButton];


        
        NSURL  *mp3URL = [[NSBundle mainBundle] URLForResource:@"Two Of A Kind" withExtension:@"mp3"];
        
        NSLog(@"mp3URL = %@", mp3URL);
        
        NSError *error = nil;
        
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:mp3URL error: &error];
        _audioPlayer.delegate = self;
    }
    return self;
}

- (void)layoutSubviews
{
    _playButton.frame = CGRectMake(self.frame.size.width/2.0 - 50, 60, 100, 40);
    
    _pauseButton.frame = CGRectMake(self.frame.size.width/2.0 - 50, _playButton.frame.origin.y + _playButton.frame.size.height + 10, 100, 40);
    
    _stopButton.frame = CGRectMake(self.frame.size.width/2.0 - 50, _pauseButton.frame.origin.y + _pauseButton.frame.size.height + 10, 100, 40);
}


- (void)playButtonClick:(id)sender
{
    NSLog(@"play");
    
    if (_audioPlayer == nil)
    {
        NSURL  *mp3URL = [[NSBundle mainBundle] URLForResource:@"Two Of A Kind" withExtension:@"mp3"];
        
        NSLog(@"mp3URL = %@", mp3URL);
        
        NSError *error = nil;
        
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:mp3URL error: &error];
        _audioPlayer.delegate = self;
    }
    
    [_audioPlayer play];
}

- (void)pauseButtonClick:(id)sender
{
    NSLog(@"pause");
    [_audioPlayer pause];
}

- (void)stopButtonClick:(id)sender
{
    NSLog(@"stop");
    [_audioPlayer stop];
    
    [_audioPlayer release];
    _audioPlayer = nil;
}

@end




@interface MainViewController ()

@end

@implementation MainViewController


- (void)dealloc
{
    [_mainView release];
    _mainView = nil;
    
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
    
    _mainView = [[MainView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_mainView];

}


@end
