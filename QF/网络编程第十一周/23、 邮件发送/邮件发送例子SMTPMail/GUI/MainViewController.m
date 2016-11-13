

#import "MainViewController.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        _button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
        _button.frame = CGRectMake(10, 50, 300, 40);
        _button.layer.borderWidth = 1;
        _button.layer.borderColor = [UIColor blackColor].CGColor;
        
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button setTitle:@"发送邮件" forState:UIControlStateNormal];
        
        [self addSubview:_button];
        
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)buttonClick:(id)sender
{
    NSLog(@"开始发送");
    
    SKPSMTPMessage *smtp_message = [[SKPSMTPMessage alloc] init];
    smtp_message.fromEmail = @"chengzi_xp@163.com";//发件箱
    smtp_message.toEmail = @"61183869@qq.com";//收件箱
    smtp_message.relayHost = @"smtp.163.com";//发件箱主机
    smtp_message.requiresAuth = YES;
    smtp_message.login = @"";//发件箱登录名
    smtp_message.pass = @"";//发件箱密码
    smtp_message.wantsSecure = YES;
    smtp_message.subject = @"测试邮件";//邮件主题
    smtp_message.delegate = self;
    
    NSMutableArray *parts_to_send = [NSMutableArray array];
    
    //日志文件的内容
    NSDictionary *plain_text_part = [NSDictionary dictionaryWithObjectsAndKeys: @"attachment;\r\n\tfilename=\"test.txt\"", kSKPSMTPPartContentDispositionKey, @"附件内容:hello world",kSKPSMTPPartMessageKey, nil];
    [parts_to_send addObject:plain_text_part];
    smtp_message.parts = parts_to_send;
    [smtp_message send];
}

- (void)messageSent:(SKPSMTPMessage *)message
{
    NSLog(@"发送完成");
}
- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error
{
    NSLog(@"发送失败");
}

- (void)messageState:(SKPSMTPState)messageState
{
    NSLog(@"发送中 messageState = %d", messageState);
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
