//
//  MainViewController.h
//  多媒体
//
//  Created by chen cheng on 14-4-24.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MainView : UIView<AVAudioPlayerDelegate>
{
    UIButton  *_playButton;
    UIButton  *_pauseButton;
    UIButton  *_stopButton;
    
    AVAudioPlayer *_audioPlayer;
}

@end

@interface MainViewController : UIViewController
{
    MainView  *_mainView;
}

@end
