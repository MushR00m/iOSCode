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

#import "QFLock.h"



@implementation QFAssetsTool

//assets-library://asset/asset.JPG?id=5B030D31-4AD8-41E9-8B56-62DBBCE3BD92&ext=JPG

+ (UIImage *)synchronousImageWithURL:(NSURL *)url
{
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    
    __block UIImage *image = nil;
    
    QFLock  *lock = [[QFLock alloc] init];
    
    [lock lock];
    
    
    [assetsLibrary assetForURL:url resultBlock:^(ALAsset *asset) {
        
        
        NSLog(@"照片获取成功\n");
        
        image =[UIImage imageWithCGImage:[asset defaultRepresentation].fullResolutionImage scale:1 orientation:(UIImageOrientation)([asset defaultRepresentation].orientation)] ;
        
        [image retain];
        
        [lock unlock];
        
    } failureBlock:^(NSError *error) {
        
        NSLog(@"照片获取失败\n");
        
        [lock unlock];
    }];
    
    
    [assetsLibrary release];
    
    
    [lock lock];
    
    [lock release];
    
    return [image autorelease];
}

@end
