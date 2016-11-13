

#import "MainViewController.h"
#import <MessageUI/MFMailComposeViewController.h>


@interface MainViewController ()

@end

@implementation MainViewController

- (void)dealloc
{
    [_button release];
    _button = nil;
    
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
    
    _button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    _button.frame = CGRectMake(10, 50, 300, 40);
    _button.layer.borderWidth = 1;
    _button.layer.borderColor = [UIColor blackColor].CGColor;
    
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_button setTitle:@"发送邮件" forState:UIControlStateNormal];
    
    [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];

    
    [self.view addSubview:_button];
    
}

- (void)buttonClick:(id)sender
{
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    
    if (mc != nil)
    {
        mc.mailComposeDelegate = self;
        [mc setSubject:@"邮件主题2"];
        [mc setToRecipients:[NSArray arrayWithObjects:@"61183869@qq.com", nil]];
        [mc setMessageBody:@"" isHTML:NO];
        
        [self presentViewController:mc animated:YES completion:nil];
        
        [mc release];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
