
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MainView : UIView
{
    UIButton *_recordButton;
    UIButton *_pauseRecordButton;
    UIButton *_stopRecordButton;
    
    UIButton *_playButton;
    
    AVAudioRecorder *_audioRecorder;
    AVAudioPlayer *_audioPlayer;
}

@end



@interface MainViewController : UIViewController
{
    MainView  *_mainView;
    
    
}
@end
