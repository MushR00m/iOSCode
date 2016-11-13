

#import "MainViewController.h"


@implementation MainView

- (void)dealloc
{
    [_recordButton release];
    _recordButton = nil;
    
    [_pauseRecordButton release];
    _pauseRecordButton = nil;
    
    [_stopRecordButton release];
    _stopRecordButton = nil;
    
    [_playButton release];
    _playButton = nil;
    
    [_audioRecorder release];
    _audioRecorder = nil;
    
    [_audioPlayer release];
    _audioPlayer = nil;

    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        _recordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _recordButton.frame = CGRectMake(self.frame.size.width/2.0-50, 30, 100, 40);
        [_recordButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_recordButton addTarget:self action:@selector(recordButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_recordButton setTitle:@"开始录音" forState:UIControlStateNormal];
        
        [self addSubview:_recordButton];
        
        _pauseRecordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _pauseRecordButton.frame = CGRectMake(self.frame.size.width/2.0-50, 30 + 50, 100, 40);
        [_pauseRecordButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_pauseRecordButton addTarget:self action:@selector(pauseRecordButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_pauseRecordButton setTitle:@"暂停录音" forState:UIControlStateNormal];
        
        [self addSubview:_pauseRecordButton];
        
        
        _stopRecordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _stopRecordButton.frame = CGRectMake(self.frame.size.width/2.0-50, 30 + 50*2, 100, 40);
        [_stopRecordButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_stopRecordButton addTarget:self action:@selector(stopRecordButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_stopRecordButton setTitle:@"停止录音" forState:UIControlStateNormal];
        
        [self addSubview:_stopRecordButton];

        
        
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _playButton.frame = CGRectMake(self.frame.size.width/2.0-50, 30 + 50 * 3, 100, 40);
        [_playButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_playButton addTarget:self action:@selector(playButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_playButton setTitle:@"播放录音" forState:UIControlStateNormal];
        
        [self addSubview:_playButton];

        
        
        NSLog(@"NSHomeDirectory() = %@", NSHomeDirectory());
        
        NSMutableString  *filePath = [NSHomeDirectory() mutableCopy];
        
        [filePath appendString:@"/Documents/1.wav"];
        
        NSURL *fileURL = [NSURL fileURLWithPath:filePath];
        
        NSLog(@"fileURL = %@", fileURL);
        
        NSError  *error = nil;
        
        NSMutableDictionary *audioRecorderSettings = [[NSMutableDictionary alloc] init];
        
        //设置录制音频的格式
        [audioRecorderSettings setObject:[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
        
        //设置采样频率
        [audioRecorderSettings setObject:[NSNumber numberWithFloat:100.0] forKey:AVSampleRateKey];
        
        
        //设置录音音频的通道数
        [audioRecorderSettings setObject:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
        
        //设置音频每个样点的位数 8 16 32 64
        [audioRecorderSettings setObject:[NSNumber numberWithInt:8] forKey:AVLinearPCMBitDepthKey];
        
        //设置音频文件数据的大小端格式
        [audioRecorderSettings setObject:[NSNumber numberWithBool:YES] forKey:AVLinearPCMIsBigEndianKey];
        
        //uint32_t a = 0x01020304;
        
        //01 02 03 04
       // 04 03 02 01
        
        //设置采样信号使用使用浮点数
        [audioRecorderSettings setObject:[NSNumber numberWithBool:YES] forKey:AVLinearPCMIsFloatKey];
    
        _audioRecorder = [[AVAudioRecorder alloc] initWithURL:fileURL settings:audioRecorderSettings error:&error];
        
        [audioRecorderSettings release];
    }
    return self;
}

- (void)recordButtonClick:(id)sender
{
    [_audioRecorder record];
}
- (void)pauseRecordButtonClick:(id)sender
{
    [_audioRecorder pause];
}

- (void)stopRecordButtonClick:(id)sender
{
    [_audioRecorder stop];
}

- (void)playButtonClick:(id)sender
{
    NSMutableString  *filePath = [NSHomeDirectory() mutableCopy];
    
    [filePath appendString:@"/Documents/1.wav"];
    
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    
    NSError  *error = nil;
    
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&error];

    [_audioPlayer play];
}

- (void)layoutSubviews
{
    _recordButton.frame = CGRectMake(self.frame.size.width/2.0-50, 30, 100, 40);
    
    _pauseRecordButton.frame = CGRectMake(self.frame.size.width/2.0-50, 30 + 50, 100, 40);
    
    _stopRecordButton.frame = CGRectMake(self.frame.size.width/2.0-50, 30 + 50 * 2, 100 , 40);
    
    _playButton.frame = CGRectMake(self.frame.size.width/2.0-50, 30 + 50 * 3, 100 , 40);
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
