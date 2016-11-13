

#import "MainViewController.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        
    }
    return self;
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
    
    [self addChildViewController:<#(UIViewController *)#>];
    
    _mainView = [[MainView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_mainView];
}


@end
