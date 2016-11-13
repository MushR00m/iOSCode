//
//  main.m
//  P2P
//
//  Created by chen cheng on 14-7-20.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <ImageIO/ImageIO.h>


NSString *g_xiangJiJiaoJuan = nil;
NSURL   *g_xiangJiJiaoJuanGroupURL = nil;

BOOL g_assetsLibraryAccessFailureError = YES;

ALAssetsLibraryAccessFailureBlock g_assetsLibraryAccessFailureBlock = ^(NSError *myerror)
{
    UIAlertView   *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedStringFromTable(@"Tips", @"Language", @"提示") message:NSLocalizedStringFromTable(@"Assets Library Access Failure Message", @"Language", nil) delegate:nil cancelButtonTitle:NSLocalizedStringFromTable(@"OK", @"Language", @"确定") otherButtonTitles:nil, nil] ;
    
    [alertView show];
    [alertView release];
};



int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
