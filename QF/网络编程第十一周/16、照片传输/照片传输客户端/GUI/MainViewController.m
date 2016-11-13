//
//  MainViewController.m
//  照片传输客户端
//
//  Created by chen cheng on 14-9-27.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"
#import "Dialog.h"
#import "Packet.h"
#import "QFPacket.h"
#import "QFSendImageResponse.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _sendImageStateDialogView = [[SendImageStateDialogView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    
    _tcpClient = [[TCPClient alloc] initWithServerIp:@"192.168.83.132" serverPort:8096];
}

- (IBAction)connectButtonClick:(id)sender
{
    _sendImageStateDialogView.stateText = @"正在连接服务器";
    [_sendImageStateDialogView startAnimating];
    
    showDialogView(_sendImageStateDialogView, YES, QFShowDialogViewAnimationFromLeft, nil);
    
    showDialogView(_sendImageStateDialogView, YES, QFShowDialogViewAnimationFromLeft, ^(BOOL finished) {
        
        [_tcpClient connectCompletion:^(BOOL flag) {
            
            NSString  *message = nil;
            
            if (flag)
            {
                message = @"连接服务器成功";
            }
            else
            {
                message = @"连接服务器失败";
            }
            
            _sendImageStateDialogView.stateText = message;
            [_sendImageStateDialogView stopAnimating];
            
            NSLog(@"message = %@", message);
            
            dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1*NSEC_PER_SEC);
            dispatch_after(time, dispatch_get_main_queue(), ^{
                
                closeDialogView(QFCloseDialogViewAnimationToRight, nil);
            });

        }];
        
    });
}

- (IBAction)selcteImageButtonClick:(id)sender
{
    QFImagePickerController  *imagePickerController = [[QFImagePickerController alloc] init];
    
    imagePickerController.delegate = self;
    
    
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (void)imagePickerController:(QFImagePickerController *)picker didFinishPickingWithArray:(NSArray *)imageArray
{
    [_imageURLArray release];
    _imageURLArray = [imageArray retain];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(QFImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sendImageButtonClick:(id)sender
{
    _sendImageStateDialogView.stateText = @"等待服务器接受";
    [_sendImageStateDialogView startAnimating];
    showDialogView(_sendImageStateDialogView, YES, QFShowDialogViewAnimationFromLeft, nil);
    
    _sendImageStateDialogView.progressText = [NSString stringWithFormat:@"共%d张照片", [_imageURLArray count]];

    [_tcpClient sendSendImageRequestPacketWithNumber:[_imageURLArray count] completion:^(QFPacket *returningPacket)
    {
        NSLog(@"收到应答");
        if (returningPacket.type != PACKET_TYPE_SEND_IMAGE_RESPONSE)
        {
            _sendImageStateDialogView.stateText = @"服务端出现错误";
            [_sendImageStateDialogView stopAnimating];
            
            
            dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1*NSEC_PER_SEC);
            dispatch_after(time, dispatch_get_main_queue(), ^{
                
                closeDialogView(QFCloseDialogViewAnimationToRight, nil);
            });
        }
        else
        {
            QFSendImageResponse *sendImageResponse = (QFSendImageResponse *)returningPacket;
            
            if (sendImageResponse.errorCode == 0)
            {
                _sendImageStateDialogView.stateText = @"服务端已拒绝";
                [_sendImageStateDialogView stopAnimating];
                
                
                dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1*NSEC_PER_SEC);
                dispatch_after(time, dispatch_get_main_queue(), ^{
                    
                    closeDialogView(QFCloseDialogViewAnimationToRight, nil);
                });

            }
            else
            {
                _sendImageStateDialogView.stateText = @"正在发送照片";
                _sendImageStateDialogView.progressText = [NSString stringWithFormat:@"0/%d",  [_imageURLArray count]];
                
                //发送照片
                [_tcpClient sendImagesWithImagURLArray:_imageURLArray updateProgress:^(int index) {
                    
                    
                    if (index < [_imageURLArray count]-1)
                    {
                        _sendImageStateDialogView.progressText = [NSString stringWithFormat:@"%d/%d",  index+1, [_imageURLArray count]];
                    }
                    else
                    {
                        _sendImageStateDialogView.stateText = @"发送完成";
                        [_sendImageStateDialogView stopAnimating];
                        
                        _sendImageStateDialogView.progressText = [NSString stringWithFormat:@"%d/%d",  index+1, [_imageURLArray count]];
                        
                        
                        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1*NSEC_PER_SEC);
                        dispatch_after(time, dispatch_get_main_queue(), ^{
                            
                            closeDialogView(QFCloseDialogViewAnimationToRight, nil);
                        });

                    }
                }];
            }
        }
    }];
}

@end
