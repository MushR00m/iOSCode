//
//  QFAssetsTool.m
//  同步的方式获取系统照片
//
//  Created by chen cheng on 14-9-18.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFAssetsTool.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <pthread.h>





@implementation QFAssetsTool

//assets-library://asset/asset.JPG?id=5B030D31-4AD8-41E9-8B56-62DBBCE3BD92&ext=JPG

/**
 *  同步的获取系统照片（会阻塞到获取照片完成才返回）
 *
 *  @param url 照片的URL
 *
 *  @return nil表示获取失败否则成功
 */
+ (UIImage *)synchronousImageWithURL:(NSURL *)url
{
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    
    __block UIImage *image = nil;
    __block BOOL    flage = NO;  //为真表示照片获取完成（包括失败和成功）
    
    NSCondition  *condition = [[NSCondition alloc] init];
    
    [condition lock];
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [assetsLibrary assetForURL:url resultBlock:^(ALAsset *asset) {
            
            
            NSLog(@"照片获取成功\n");
            
            [condition lock];
            
            flage = YES;

            
            image = [UIImage imageWithCGImage:[asset defaultRepresentation].fullResolutionImage scale:1 orientation:(UIImageOrientation)([asset defaultRepresentation].orientation)] ;
            
            [image retain];
            
            [condition signal];
            
            [condition unlock];
            
        } failureBlock:^(NSError *error) {
            
            NSLog(@"照片获取失败\n");
            
            [condition lock];
            
            flage = YES;
            image = nil;
            
            [condition signal];
            
            [condition unlock];
        }];
    });
    

    [assetsLibrary release];
    
    while (!flage)
    {
        [condition wait];
    }
    
    [condition unlock];
    
    return [image autorelease];
}

@end
