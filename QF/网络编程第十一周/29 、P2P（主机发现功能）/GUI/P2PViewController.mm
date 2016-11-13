//
//  P2PViewController.m
//  P2P
//
//  Created by chen cheng on 14-07-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "P2PViewController.h"
#import "UIDevice+UIDeviceCategory.h"
#import "P2PUDPServer.h"
#import "P2PUDPClient.h"

#import <SystemConfiguration/CaptiveNetwork.h>
#import "NetPublic.h"


@implementation DeviceView

@synthesize hostName = _hostName;
@synthesize ip = _ip;
@synthesize tcpPort = _tcpPort;
@synthesize live = _live;
@synthesize positionIndex = _positionIndex;
@synthesize deviceButton = _deviceButton;


- (id)initWithDeviceType:(int)deviceType
{
    self = [super initWithFrame:CGRectMake(0, 0, 66, 76)];
    if (self != nil)
    {
        _deviceButton = [[UIButton alloc] init];
        
        if (deviceType == 0x01)
        {
            [_deviceButton setImage:[UIImage imageNamed:@"transfer_device_iphone@2x.png"] forState:UIControlStateNormal];
            [_deviceButton setImage:[UIImage imageNamed:@"transfer_device_iphone_highlighted.png"] forState:UIControlStateHighlighted];
        }
        else if (deviceType == 0x02)
        {
            [_deviceButton setImage:[UIImage imageNamed:@"transfer_device_ipad@2x.png"] forState:UIControlStateNormal];
            [_deviceButton setImage:[UIImage imageNamed:@"transfer_device_ipad_highlighted.png"] forState:UIControlStateHighlighted];
        }
        
        _deviceButton.frame = CGRectMake(0, 0, 66, 66);
        
        _deviceButton.backgroundColor = [UIColor clearColor];
        
        [_deviceButton addTarget:self action:@selector(deviceButtonTouchDown:) forControlEvents:UIControlEventTouchDown];
        [_deviceButton addTarget:self action:@selector(deviceButtonTouchDown:) forControlEvents:UIControlEventTouchDragInside];
        
        [_deviceButton addTarget:self action:@selector(deviceButtonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
        [_deviceButton addTarget:self action:@selector(deviceButtonTouchUp:) forControlEvents:UIControlEventTouchDragOutside];
        [_deviceButton addTarget:self action:@selector(deviceButtonTouchUp:) forControlEvents:UIControlEventTouchCancel];
        
        [self addSubview:_deviceButton];
        
        _hostNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(-50, 66, 66 + 100, 10)];
        _hostNameLabel.backgroundColor = [UIColor clearColor];
        _hostNameLabel.textColor = [UIColor grayColor];
        _hostNameLabel.textAlignment = NSTextAlignmentCenter;
        _hostNameLabel.font = [UIFont boldSystemFontOfSize:10];
        
        [self addSubview:_hostNameLabel];
    }
    
    return self;
}

- (void)setHostName:(NSString *)hostName
{
    [hostName retain];
    [_hostName release];
    _hostName = hostName;
    
    _hostNameLabel.text = hostName;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:CGRectMake(frame.origin.x, frame.origin.y, 66, 76)];
}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    [_deviceButton addTarget:target action:action forControlEvents:controlEvents];
}

- (void)removeTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    [_deviceButton removeTarget:target action:action forControlEvents:controlEvents];
}

- (void)deviceButtonTouchDown:(UIButton *)deviceButton
{
    _hostNameLabel.textColor = [UIColor colorWithRed:71.0/255.0 green:193.0/255.0 blue:240.0/255.0 alpha:1.0];
}

- (void)deviceButtonTouchUp:(UIButton *)deviceButton
{
    _hostNameLabel.textColor = [UIColor grayColor];
}

- (void)setPosition:(CGPoint)position
{
    [super setCenter:CGPointMake(position.x, position.y + 5)];
}

- (void)dealloc
{
    self.hostName = nil;
    
    [_deviceButton release];
    _deviceButton = nil;
    
    [_hostNameLabel release];
    _hostNameLabel = nil;
    
    [super dealloc];
}

@end


static P2PViewController *g_p2pViewController = nil;


@implementation P2PView

@synthesize stop = _stop;
@synthesize popoverController;

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        self.backgroundColor = [UIColor clearColor];
        
        _meDevice = [[UIButton alloc] init];
        
        if ([UIDevice modelId] == DEVICE_MODELID_IPAD)
        {
            [_meDevice setImage:[UIImage imageNamed:@"transfer_device_ipad_highlighted.png"] forState:UIControlStateNormal];
            _meDevice.frame = CGRectMake(0, 0, 66, 66);
        }
        else
        {
            [_meDevice setImage:[UIImage imageNamed:@"transfer_device_iphone_highlighted.png"] forState:UIControlStateNormal];
            
            _meDevice.frame = CGRectMake(0, 0, 66, 66);
        }
        
        _meDevice.backgroundColor = [UIColor clearColor];
        _meDevice.userInteractionEnabled = NO;
        
        [self addSubview:_meDevice];
        
        _meNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 10)];
        
        _meNameLabel.text = @"Me";
        _meNameLabel.textColor = [UIColor colorWithRed:71.0/255.0 green:193.0/255.0 blue:240.0/255.0 alpha:1.0];
        _meNameLabel.backgroundColor = [UIColor clearColor];
        _meNameLabel.textAlignment = NSTextAlignmentCenter;
        _meNameLabel.font = [UIFont boldSystemFontOfSize:10];
        
        [self addSubview:_meNameLabel];
        
        _wifiNameLabel = [[UILabel alloc] init];
        _wifiNameLabel.backgroundColor = [UIColor clearColor];
        _wifiNameLabel.textAlignment = NSTextAlignmentCenter;
        _wifiNameLabel.textColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0];
        _wifiNameLabel.font = [UIFont boldSystemFontOfSize:13];
        
        [self addSubview:_wifiNameLabel];
        
        
        BOOL flag = NO;
        NSString *ssid = @"WIFI Not Found";
        CFArrayRef myArray = CNCopySupportedInterfaces();
        if (myArray != nil)
        {
            CFDictionaryRef myDict = CNCopyCurrentNetworkInfo((CFStringRef)(CFArrayGetValueAtIndex(myArray, 0)));
            
            CFRelease(myArray);
            
            if (myDict != nil)
            {
                NSDictionary *dict = (NSDictionary*)CFBridgingRelease(myDict);
                
                ssid = [dict valueForKey:@"SSID"];
                
                flag = YES;
            }
        }
        
        _wifiNameLabel.text = ssid;
        
        //为了测试 在非WIFI情况下 也运行UDP的客户端
        flag = YES;
        
        if (flag)
        {
            _wifiRoundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"share_wave_round.png"]];
            _wifiRoundImageView.frame = CGRectMake(0, 0, 50, 50);
            [self addSubview:_wifiRoundImageView];
            
            _p2pUDPClient = [[P2PUDPClient alloc] init];
            _p2pUDPClient.delegate = self;
            
            
            _p2pUDPServer = [[P2PUDPServer alloc] init];
            
            _p2pTCPClient = [[P2PTCPClient alloc] init];
            _p2pTCPClient.delegate = self;
            

            _p2pTCPServer = [[P2PTCPServer alloc] init];
            _p2pTCPServer.delegate = self;
            

            _otherDeviceViewMutableArray = [[NSMutableArray alloc] init];
            
            [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(startScanningAnimation) userInfo:nil repeats:NO];
        }
    }
    return self;
}



- (void)addOtherDeviceWithName:(NSString *)hostName ip:(uint32_t)ip tcpServerPort:(uint16_t)tcpServerPort deviceType:(int)deviceType
{
    DeviceView  *deviceView = [[DeviceView alloc] initWithDeviceType:deviceType];
        
    deviceView.hostName = hostName;
    deviceView.ip = ip;
    deviceView.tcpPort = tcpServerPort;
    deviceView.live = YES;
    
    [_otherDeviceViewMutableArray addObject:deviceView];
    
    deviceView.positionIndex = (int)([_otherDeviceViewMutableArray count]-1);
    [deviceView setPosition: [self positionForDeviceByIndex: deviceView.positionIndex sum:(int)[_otherDeviceViewMutableArray count]]];
    
    [deviceView addTarget:self action:@selector(deviceViewClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    deviceView.layer.transform = CATransform3DMakeScale(0.01, 0.01, 1);
    
    [self addSubview:deviceView];
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        deviceView.layer.transform = CATransform3DIdentity;
        
    } completion:^(BOOL finished) {
        
    }];
    
    [deviceView release];
}


#pragma UDPClient Delegate

- (void)p2pUDPClient:(P2PUDPClient *)p2pUDPClient refreshPoints:(NSArray *)pointInfos
{
    
    for (int i=0; i<[_otherDeviceViewMutableArray count]; i++)
    {
        DeviceView *deviceView = [_otherDeviceViewMutableArray objectAtIndex:i];
        deviceView.live = NO;
    }
    
    //添加新的设备
    for (int i=0; i<[pointInfos count]; i++)
    {
        PointInfo  *pointInfo = [pointInfos objectAtIndex:i];
        
        BOOL isNewPoint = YES;
        for (int j=0; j<[_otherDeviceViewMutableArray count]; j++)
        {
            DeviceView *deviceView = [_otherDeviceViewMutableArray objectAtIndex:j];
            if (deviceView.ip == pointInfo.ip)
            {
                deviceView.live = YES;
                
                isNewPoint = NO;
                break;
            }
        }
        
        if (isNewPoint)
        {
            [self addOtherDeviceWithName:pointInfo.hostName ip:pointInfo.ip tcpServerPort:pointInfo.tcpPort deviceType:pointInfo.deviceType];
        }
    }
    
    
    //删除离开的设备
    for (int i=0; i<[_otherDeviceViewMutableArray count];)
    {
        DeviceView *deviceView = [_otherDeviceViewMutableArray objectAtIndex:i];
        
        if (!deviceView.live)
        {
            [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                
                deviceView.layer.transform = CATransform3DScale(deviceView.layer.transform, 0.01, 0.01, 1);
                
            } completion:^(BOOL finished){
                [deviceView removeFromSuperview];
            }];
            
            if (_currentDeviceView == deviceView)
            {
                _currentDeviceView = nil;
            }
            
            [_otherDeviceViewMutableArray removeObject:deviceView];
        }
        else
        {
            i++;
        }
    }
    
    
    //调整位置
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        for (int i=0; i<[_otherDeviceViewMutableArray count]; i++)
        {
            
            DeviceView *deviceView = [_otherDeviceViewMutableArray objectAtIndex:i];
            
            deviceView.positionIndex = i;
            [deviceView setPosition:[self positionForDeviceByIndex: deviceView.positionIndex sum:(int)[_otherDeviceViewMutableArray count]]];
        }
    }completion:nil];
}


#pragma TCPServer Delegate

- (void)p2pTCPServer:(P2PTCPServer *)p2pTCPServer confirmWhetherToAcceptFromHostName:(NSString *)hostName
{
    
}

- (void)p2pTCPServer:(P2PTCPServer *)p2pTCPServer updateTransferState:(int)transferState
{
    
}

- (void)p2pTCPServer:(P2PTCPServer *)p2pTCPServer updateTransferProgressWithIndex:(int)index numberOfImage:(int)numberOfImage
{
    
}

#pragma TCPClient Delegate

- (void)p2pTCPClient:(P2PTCPClient *)p2pTCPClient updateTransferState:(int)transferState
{
    
}

- (void)p2pTCPClient:(P2PTCPClient *)p2pTCPClient updateTransferProgressWithIndex:(int)index numberOfImage:(int)numberOfImage
{
    
}



- (void)deviceViewClick:(UIButton *)deviceButton
{
    NSLog(@"deviceViewClick");
}




- (void)dealloc
{
    [_meDevice release];
    _meDevice = nil;
    
    [_otherDeviceViewMutableArray release];
    _otherDeviceViewMutableArray = nil;
    
    [_waitingSendGroupURL release];
    _waitingSendGroupURL = nil;
    
    [_waitingSendImageURLArray release];
    _waitingSendImageURLArray = nil;
    
    [_p2pUDPServer release];
    [_p2pUDPClient release];
    
    
    
    [_wifiRoundImageView release];
    _wifiRoundImageView = nil;
    
    [super dealloc];
}




- (void)startScanningAnimation
{
    [_p2pTCPServer start];
    
    [_p2pUDPServer start];
    [_p2pUDPClient start];
    
    [self wifiRoundImageViewAnimation];
}

- (void)wifiRoundImageViewAnimation
{
    _wifiRoundImageView.alpha = 1.0;
    _wifiRoundImageView.layer.transform = CATransform3DIdentity;
    
    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        _wifiRoundImageView.layer.transform = CATransform3DScale(_wifiRoundImageView.layer.transform, 4.5, 4.5, 1);
        
        _wifiRoundImageView.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        
        if (!self.stop)
        {
            [self wifiRoundImageViewAnimation];
        }
    }];
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
     _meDevice.center = CGPointMake(frame.size.width/2.0, _meDevice.frame.size.height/2.0+10);

    _meNameLabel.center = CGPointMake(frame.size.width/2.0, _meDevice.frame.origin.y + _meDevice.frame.size.height + 10);
    
    int count = (int)[_otherDeviceViewMutableArray count];
    for (int i=0; i<count; i++)
    {
        DeviceView *deviceView = [_otherDeviceViewMutableArray objectAtIndex:i];
        
        [deviceView setPosition: [self positionForDeviceByIndex: i sum:count]];
    }
    
    _wifiNameLabel.frame = CGRectMake(0, 0, frame.size.width, 50);
    _wifiNameLabel.center = CGPointMake(frame.size.width/2.0, frame.size.height/2.0);
    
    _wifiRoundImageView.center = CGPointMake(frame.size.width/2.0, frame.size.height/2.0);
    
    
    
    [self setNeedsDisplay];
}

- (CGPoint)positionForDeviceByIndex:(int)index  sum:(int)sum
{
    float initAngle = -90;
    
    float dAngle = 360.0/(sum + 1);
    
    
    float angle = initAngle + dAngle * (index + 1);
    
    if (angle < 0)
    {
        angle = 360 + angle;
    }
        
    
    float anglePI = angle * 3.14/180.0;
    
    float a = self.bounds.size.width/2.0 - 43;
    float b = (self.bounds.size.height - 10)/2.0 - 43;
    
    float xx = 1.0 / (1.0/(a * a) + (tan(anglePI) * tan(anglePI))/ (b * b));
    float yy = (tan(anglePI) * tan(anglePI)) * xx;
    
    float x = sqrtf(xx);
    float y = sqrtf(yy);
    
    if (angle >= 0 && angle < 90)
    {
        y = -y;
    }
    else if (angle >= 90 && angle < 180)
    {
        x = -x;
        y = -y;
    }
    else if (angle >= 180 && angle < 270)
    {
        x = -x;
    }
    
    CGPoint position = CGPointMake(x + self.bounds.size.width/2.0, -y + (self.bounds.size.height-15)/2.0);

    return position;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect aRect= CGRectMake(66.0/2.0 + 10, 66.0/2.0 + 10, self.bounds.size.width - (66.0/2.0 + 10)*2, self.bounds.size.height - (66.0/2.0 + 10)*2 - 15);
    CGContextSetRGBStrokeColor(context, 0.3, 0.3, 0.3, 1.0);
    CGContextSetLineWidth(context, 1.0);
    CGContextAddEllipseInRect(context, aRect); //椭圆
    CGContextDrawPath(context, kCGPathStroke);
}

@end



@interface P2PViewController ()

@end

@implementation P2PViewController


@synthesize p2pView = _p2pView;

#pragma 单例代码

+ (P2PViewController *)shareP2PViewController
{
    //double check  需要掌握
    if (g_p2pViewController == nil)
    {
        @synchronized(g_p2pViewController)
        {
            if (g_p2pViewController == nil)
            {
                g_p2pViewController = [[P2PViewController  alloc] init];
            }
            
        }
    }
    return g_p2pViewController;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    if (g_p2pViewController == nil)
    {
        return [super allocWithZone:zone];
    }
    else
    {
        return g_p2pViewController;
    }
}

- (id)retain
{
    return self;
}

- (oneway void)release
{
}

- (NSUInteger)retainCount
{
    return UINT_MAX;
}

- (id)autoreleas
{
    return self;
}




- (id)init
{
    self = [super init];
    if (self)
    {
        _topNavigationItem = [[UINavigationItem alloc] init];
        
        self.title = @"P2P";
    }
    g_p2pViewController = self;
    return self;
}



- (void)dealloc
{
    g_p2pViewController = nil;
    
    [_topNavigationItem release];
    _topNavigationItem = nil;
    
        
    [self CC_viewDidUnload];
    
    [super dealloc];
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    UILabel   *titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleView.text = title;
    titleView.textAlignment = NSTextAlignmentCenter;
    
    UIFont *titleFont = nil;
    
    if ([UIDevice modelId] == DEVICE_MODELID_IPAD)
    {
        titleFont = [UIFont boldSystemFontOfSize:20];
    }
    else
    {
        titleFont = [UIFont boldSystemFontOfSize:19];
    }
    
    titleView.font = titleFont;
    
    
    titleView.frame = CGRectMake(0, 0, 320, 40);
    
    
    titleView.backgroundColor = [UIColor clearColor];
    
    
    titleView.textColor = [UIColor whiteColor];
    _topNavigationItem.titleView = titleView;
    
    [titleView release];
}


- (void)loadView
{
    [super loadView];
    	
    self.view.backgroundColor = [UIColor colorWithRed:34.0/255.0 green:39.0/255.0 blue:46.0/255.0 alpha:1];
    
    
	_topNavigationBar = [[UINavigationBar alloc] init];
    [_topNavigationBar pushNavigationItem:_topNavigationItem animated:NO];
    [_topNavigationBar setBackgroundImage:[UIImage imageNamed:@"blackNavigationBar.png"] forBarMetrics:UIBarMetricsDefault];
    
    [self.view addSubview:_topNavigationBar];
    
    _top_navigationBarShadowView = [[UIImageView alloc] init];
    _top_navigationBarShadowView.image = [UIImage imageNamed:@"top_navigationBarShadow.png"];
    [self.view addSubview:_top_navigationBarShadowView];
    
    
    _p2pView = [[P2PView alloc] init];
    [self.view addSubview:_p2pView];
    
    
    [self layoutForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void) CC_viewDidUnload
{
    self.view = nil;
    
    [_p2pView release];
    _p2pView = nil;
    

    [_topNavigationBar release];
    _topNavigationBar = nil;
    
    
    [_top_navigationBarShadowView release];
    _top_navigationBarShadowView = nil;
}



- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self layoutForOrientation:toInterfaceOrientation];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([UIDevice modelId] == DEVICE_MODELID_IPAD)
    {
        return YES;
    }
    else
    {
        if (interfaceOrientation == UIInterfaceOrientationPortrait)
        {
            return YES;
        }
        else
        {
            return NO;
        }
    }
    
}

- (BOOL)shouldAutorotate NS_AVAILABLE_IOS(6_0)
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations NS_AVAILABLE_IOS(6_0)
{
    if ([UIDevice modelId] == DEVICE_MODELID_IPAD)
    {
        return UIInterfaceOrientationMaskAll;
    }
    else
    {
        return UIInterfaceOrientationMaskPortrait;
    }
}

- (void)layoutForOrientation:(UIInterfaceOrientation)orientation
{
    int systemVersionFirstNumber = [UIDevice systemVersionFirstNumber];
    
    float topNavigationBarHeight = 0;
    float adjustViewHeight = 0;
    if (systemVersionFirstNumber <= 6)
    {
        [_topNavigationBar setBackgroundImage:[UIImage imageNamed:@"blackNavigationBar.png"] forBarMetrics:UIBarMetricsDefault];
        
        topNavigationBarHeight = 45;
        adjustViewHeight = 20;
    }
    else
    {
        [_topNavigationBar setBackgroundImage:[UIImage imageNamed:@"blackNavigationBar_65h.png"] forBarMetrics:UIBarMetricsDefault];
        
        topNavigationBarHeight = 65;
        adjustViewHeight = 0;
    }

    if ([UIDevice modelId] == DEVICE_MODELID_IPAD)
    {
        if (orientation == UIInterfaceOrientationPortrait
            || orientation == UIInterfaceOrientationPortraitUpsideDown)
        {
            self.view.frame = CGRectMake(0, 0, 768, 1024 - adjustViewHeight);
            
            _topNavigationBar.frame = CGRectMake(0, 0, 768, topNavigationBarHeight);
            _top_navigationBarShadowView.frame = CGRectMake(0, topNavigationBarHeight, 768, 1);
            
            _p2pView.frame = CGRectMake(0, topNavigationBarHeight, 768, self.view.frame.size.height- topNavigationBarHeight);
        }
        else
        {
            self.view.frame = CGRectMake(0, 0, 1024, 768 - adjustViewHeight);
            
            _topNavigationBar.frame = CGRectMake(0, 0, 1024, topNavigationBarHeight);
            _top_navigationBarShadowView.frame = CGRectMake(0, topNavigationBarHeight, 1024, 1);
            
            _p2pView.frame = CGRectMake(0, topNavigationBarHeight, 1024, self.view.frame.size.height- topNavigationBarHeight);
        }
    }
    else if ([UIDevice modelId] == DEVICE_MODELID_IPHONE_480h)
    {
        if (orientation == UIInterfaceOrientationPortrait
            || orientation == UIInterfaceOrientationPortraitUpsideDown)
        {
            self.view.frame = CGRectMake(0, 0, 320, 480 - adjustViewHeight);
            
            _topNavigationBar.frame = CGRectMake(0, 0, 320, topNavigationBarHeight);
            _top_navigationBarShadowView.frame = CGRectMake(0, topNavigationBarHeight, 320, 1);
            
            _p2pView.frame = CGRectMake(0, topNavigationBarHeight, 320, self.view.frame.size.height- topNavigationBarHeight);
            
            
        }
        else
        {
            self.view.frame = CGRectMake(0, 0, 480, 320 - adjustViewHeight);
            
            _topNavigationBar.frame = CGRectMake(0, 0, 480, topNavigationBarHeight);
            _top_navigationBarShadowView.frame = CGRectMake(0, topNavigationBarHeight, 480, 1);
            
            _p2pView.frame = CGRectMake(0, topNavigationBarHeight, 480, self.view.frame.size.height- topNavigationBarHeight);

        }
    }
    else if ([UIDevice modelId] == DEVICE_MODELID_IPHONE_568h)
    {
        if (orientation == UIInterfaceOrientationPortrait
            || orientation == UIInterfaceOrientationPortraitUpsideDown)
        {
            self.view.frame = CGRectMake(0, 0, 320, 568 - adjustViewHeight);
            
            _topNavigationBar.frame = CGRectMake(0, 0, 320, topNavigationBarHeight);
            _top_navigationBarShadowView.frame = CGRectMake(0, topNavigationBarHeight, 320, 1);
            
            _p2pView.frame = CGRectMake(0, topNavigationBarHeight, 320, self.view.frame.size.height- topNavigationBarHeight);
        }
        else
        {
            self.view.frame = CGRectMake(0, 0, 568, 320 - adjustViewHeight);
            
            _topNavigationBar.frame = CGRectMake(0, 0, 568, topNavigationBarHeight);
            _top_navigationBarShadowView.frame = CGRectMake(0, topNavigationBarHeight, 568, 1);
            
            _p2pView.frame = CGRectMake(0, topNavigationBarHeight, 568, self.view.frame.size.height- topNavigationBarHeight);
            
        }
    }
}

@end
