//
//  SendImageStateDialogView.m
//  照片传输客户端
//
//  Created by chen cheng on 14-9-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "SendImageStateDialogView.h"

@implementation SendImageStateDialogView


- (void)setStateText:(NSString *)stateText
{
    _stateLabel.text = stateText;
}

- (NSString *)stateText
{
    return _stateLabel.text;
}

- (void)setProgressText:(NSString *)progressText
{
    _progressLabel.text = progressText;
}

- (NSString *)progressText
{
    return _progressLabel.text;
}


- (void)startAnimating
{
    [_activityIndicatorView startAnimating];
}
- (void)stopAnimating
{
    [_activityIndicatorView stopAnimating];
}

- (void)dealloc
{
    [_stateLabel release];
    [_activityIndicatorView release];
    [_progressLabel release];
    
    [super dealloc];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.7;
        
        _stateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height/3.0)];
        _stateLabel.textColor = [UIColor whiteColor];
        _stateLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_stateLabel];
        
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        
        _activityIndicatorView.frame = CGRectMake(0, self.bounds.size.height/3.0, self.bounds.size.width, self.bounds.size.height/3.0);
        [self addSubview:_activityIndicatorView];
        
        
        _progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.size.height*2.0/3.0, self.bounds.size.width, self.bounds.size.height/3.0)];
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel.textColor = [UIColor whiteColor];
        [self addSubview:_progressLabel];
    }
    
    return self;
}



@end
