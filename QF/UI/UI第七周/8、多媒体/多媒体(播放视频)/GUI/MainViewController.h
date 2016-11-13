//
//  MainViewController.h
//  多媒体
//
//  Created by chen cheng on 14-4-24.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


@interface MainViewController : UIViewController
{
    MPMoviePlayerViewController *_moviePlayerViewController;
    
    MPMoviePlayerController *_moviePlayerController;
}

@end
