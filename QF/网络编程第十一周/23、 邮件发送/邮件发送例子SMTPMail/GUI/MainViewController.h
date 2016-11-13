
#import <UIKit/UIKit.h>
#import "SKPSMTPMessage.h"

@interface MainView : UIView<SKPSMTPMessageDelegate>
{
    UIButton  *_button;
}

@end



@interface MainViewController : UIViewController
{
    MainView  *_mainView;
}
@end
