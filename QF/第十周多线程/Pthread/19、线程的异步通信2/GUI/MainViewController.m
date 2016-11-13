//
//  MainViewController.m
//  线程的异步通信2
//
//  Created by chen cheng on 14-9-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"
#import "QFThread.h"

static  MainViewController *g_mainViewController = nil;


@interface MainViewController ()

- (void)upDateProgressView;

@end

void c_upDateProgressView(int sig)
{
    if (sig == SIGUSR1)
    {
        [[MainViewController shareMainViewController] upDateProgressView];
    }
}

@implementation MainViewController

+ (MainViewController *)shareMainViewController
{
    return g_mainViewController;
}



- (id)init
{
    self = [super init];
    if (self)
    {
        g_mainViewController = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.progressView.progress = 0;
    
    _currentTid = pthread_self();
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (IBAction)downloadButtonClick:(id)sender
{
    self.progressView.progress = 0;
    if (!_isLoading)
    {
        _isLoading = YES;
        
        signal(SIGUSR1, c_upDateProgressView);
        
        [QFThread startdDetachThreadWithTarget:self action:@selector(downloadData) arg:nil];
    }
    
}

- (void)upDateProgressView
{
    NSLog(@"upDateProgressView _currentProgress = %f", _currentProgress);
    
    self.progressView.progress = _currentProgress;
}

- (void)downloadData
{
    int i = 0;
    while (i < 10)
    {
        i++;
        sleep(1);
        
        _currentProgress = (float)i / 10.0;
        
        NSLog(@"当前进度: %d%%", (int)(_currentProgress * 100.0));
        
        pthread_kill(_currentTid, SIGUSR1);
    }
    
    _isLoading = NO;
}

- (void)dealloc
{
    g_mainViewController = nil;
    [_progressView release];
    [super dealloc];
}
@end
