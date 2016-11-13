//
//  P2PViewController.h
//  P2P
//
//  Created by chen cheng on 14-07-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "P2PUDPServer.h"
#import "P2PUDPClient.h"

#import "P2PTCPClient.h"
#import "P2PTCPServer.h"



@interface DeviceView : UIView
{
    NSString   *_hostName;
    uint32_t   _ip; //主机字节序
    uint16_t   _tcpPort; //主机字节序
    UIButton   *_deviceButton;
    UILabel    *_hostNameLabel;
    BOOL       _live;
    int        _positionIndex;
}
@property(retain, nonatomic)NSString   *hostName;
@property(assign, nonatomic)uint32_t   ip;
@property(assign, nonatomic)uint16_t   tcpPort;
@property(assign, nonatomic)BOOL   live;
@property(assign, nonatomic)int positionIndex;
@property(readonly, nonatomic)UIButton   *deviceButton;

- (id)initWithDeviceType:(int)deviceType;

@end

@interface P2PView : UIView<P2PUDPClient, P2PTCPServerDelegate, P2PTCPClientDelegate, UIActionSheetDelegate, UIAlertViewDelegate>
{
    UIButton      *_meDevice;
    UILabel       *_meNameLabel;
    NSMutableArray *_otherDeviceViewMutableArray;
    DeviceView    *_currentDeviceView;
    
    UILabel       *_wifiNameLabel;
    UIImageView   *_wifiRoundImageView;
    BOOL          _stop;
    
    P2PUDPServer   *_p2pUDPServer;
    P2PUDPClient   *_p2pUDPClient;
    
    
    P2PTCPClient   *_p2pTCPClient;
    P2PTCPServer   *_p2pTCPServer;
    
    int _albumType;  // 0x01 本地相册 、0x02 系统相册
    NSString   *_waitingSendAlbumName;
    NSArray  *_waitingSendImageNameArray;
    
    NSURL  *_waitingSendGroupURL;
    NSArray  *_waitingSendImageURLArray;
    
}
@property(assign, nonatomic)BOOL stop;
@property (nonatomic,retain) UIPopoverController *popoverController;

- (void)startScanningAnimation;

@end

@interface P2PViewController : UIViewController
{
    UINavigationBar          *_topNavigationBar;
    UIImageView              *_top_navigationBarShadowView;
    

    UINavigationItem *_topNavigationItem;
    UIBarButtonItem *_doneButtomItem;
    
    P2PView   *_p2pView;
}



@property(readonly, nonatomic)P2PView   *p2pView;


+ (P2PViewController *)shareP2PViewController;

- (void)layoutForOrientation:(UIInterfaceOrientation)orientation;



@end
