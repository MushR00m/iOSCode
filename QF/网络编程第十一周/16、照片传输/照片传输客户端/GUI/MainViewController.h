//
//  MainViewController.h
//  照片传输客户端
//
//  Created by chen cheng on 14-9-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCPClient.h"
#import "QFImagePickerController.h"
#import "SendImageStateDialogView.h"

@interface MainViewController : UIViewController<QFImagePickerControllerDelegate>
{
    TCPClient *_tcpClient;
    
    NSArray  *_imageURLArray;
    
    
    SendImageStateDialogView *_sendImageStateDialogView;
}

@end
