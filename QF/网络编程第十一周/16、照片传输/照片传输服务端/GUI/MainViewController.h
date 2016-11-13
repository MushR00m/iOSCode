//
//  MainViewController.h
//  照片传输服务端
//
//  Created by chen cheng on 14-9-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCPServer.h"

@interface MainViewController : UIViewController
{
    TCPServer  *_tcpServer;
}

@end
