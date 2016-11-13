//
//  MainViewController.m
//  获取系统照片
//
//  Created by chen cheng on 14-8-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

#import <AssetsLibrary/AssetsLibrary.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"枚举所有相册" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(10, 30, 300, 40);
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIButton  *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"枚举相册里面的所有照片：group" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button2.frame = CGRectMake(10, 30 + 50, 300, 40);
    [button2 addTarget:self action:@selector(button2Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    UIButton  *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setTitle:@"枚举相册里面的所有照片：groupURL" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button3.frame = CGRectMake(10, 30 + 50*2, 300, 40);
    [button3 addTarget:self action:@selector(button3Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    
    UIButton  *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button4 setTitle:@"获取照片：imageURL" forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button4.frame = CGRectMake(10, 30 + 50*3, 300, 40);
    [button4 addTarget:self action:@selector(button4Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
}

- (void)buttonClick:(id)sender
{
    static int i = 0;
    
    ALAssetsLibrary  *assetsLibrary = [[ALAssetsLibrary alloc] init];
    
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        if (group != nil)
        {
            //相册名称
            NSString  *groupName = [group valueForProperty:ALAssetsGroupPropertyName];
            
            NSLog(@"groupName = %@", groupName);
            
            //相册的链接
            NSURL  *groupURL = [group valueForProperty:ALAssetsGroupPropertyURL];
            
            NSLog(@"groupURL = %@", groupURL);
            
            //照片的数量
            NSInteger numberOfAssets = group.numberOfAssets;
            NSLog(@"numberOfAssets = %d", numberOfAssets);
            
            //相册的封面
            UIImage  *image = [UIImage imageWithCGImage:group.posterImage];
            
            UIImageView  *imageView = [[UIImageView alloc] initWithImage:image];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            imageView.frame = CGRectMake(10, 100 * (++i), 300, 100);
            
            [self.view addSubview:imageView];
            
            [imageView release];
        }
        
       
        
    } failureBlock:^(NSError *error) {
        
    }];
    
    [assetsLibrary release];
}

- (void)button2Click:(id)sender
{
    ALAssetsLibrary  *assetsLibrary = [[ALAssetsLibrary alloc] init];
    
    
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        if (group != nil)
        {
            [group setAssetsFilter:[ALAssetsFilter allPhotos]];
            
            //相册名称
            NSString  *groupName = [group valueForProperty:ALAssetsGroupPropertyName];
            
            NSLog(@"groupName = %@", groupName);
            [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                
                //最后一次调用时 == nil
                if (result == nil)
                {
                    return ;
                }
                
                //一张照片链接
                NSURL * resultURL = [result valueForProperty:ALAssetPropertyAssetURL];
                NSLog(@"resultURL = %@", resultURL);
                
                //照片最小的缩略图 正方形
                UIImage *thumImage = [UIImage imageWithCGImage:result.thumbnail];
                
                NSLog(@"thumImage.size.width = %f, thumImage.size.height = %f", thumImage.size.width, thumImage.size.height);
                
                
                ALAssetRepresentation *assetRepresentation = [result defaultRepresentation];
                
                
                //照片的全屏缩略图
                UIImage *fullScreenImage = [UIImage imageWithCGImage:[assetRepresentation fullScreenImage]] ;
                
                NSLog(@"fullScreenImage.size.width = %f, fullScreenImage.size.height = %f", fullScreenImage.size.width, fullScreenImage.size.height);
                
                
                //照片的原图 （需要考虑相机的方向）
                UIImage *fullResolutionImage = [UIImage imageWithCGImage:[assetRepresentation fullResolutionImage] scale:1 orientation:(UIImageOrientation)(assetRepresentation.orientation)] ;
                
                NSLog(@"fullResolution.size.width = %f, fullResolution.size.height = %f", fullResolutionImage.size.width, fullResolutionImage.size.height);
                
                
                
            }];
        }
        
        
    } failureBlock:^(NSError *error) {
        
    }];
    
    [assetsLibrary release];
}

- (void)button3Click:(id)sender
{
    ALAssetsLibrary  *assetsLibrary = [[ALAssetsLibrary alloc] init];
    
    NSURL  *groupURL = [NSURL URLWithString:@"assets-library://group/?id=97572500-C22D-49C3-A739-97AF697C638E"];
    
    [assetsLibrary groupForURL:groupURL resultBlock:^(ALAssetsGroup *group){
        
        //根据这个group再去枚举所有的照片
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            
            NSLog(@"result = %p", result);
        }];
        
    } failureBlock:^(NSError *error) {
        
    }];
    
    
    [assetsLibrary release];
    
}

- (void)button4Click:(id)sender
{
    ALAssetsLibrary  *assetsLibrary = [[ALAssetsLibrary alloc] init];
    
    
    NSURL  *assetURL = [NSURL URLWithString:@"assets-library://asset/asset.JPG?id=C15411E1-BCC5-42E8-AFC7-13D4A75A0451&ext=JPG"];
    
    [assetsLibrary assetForURL:assetURL resultBlock:^(ALAsset *asset) {
        
        
        //照片最小的缩略图 正方形
        UIImage *thumImage = [UIImage imageWithCGImage:asset.thumbnail];
        
        NSLog(@"thumImage.size.width = %f, thumImage.size.height = %f", thumImage.size.width, thumImage.size.height);
        
        
        ALAssetRepresentation *assetRepresentation = [asset defaultRepresentation];
        
        
        //照片的全屏缩略图
        UIImage *fullScreenImage = [UIImage imageWithCGImage:[assetRepresentation fullScreenImage]] ;
        
        NSLog(@"fullScreenImage.size.width = %f, fullScreenImage.size.height = %f", fullScreenImage.size.width, fullScreenImage.size.height);
        
        
        //照片的原图 （需要考虑相机的方向）
        UIImage *fullResolutionImage = [UIImage imageWithCGImage:[assetRepresentation fullResolutionImage] scale:1 orientation:(UIImageOrientation)(assetRepresentation.orientation)] ;
        
        NSLog(@"fullResolution.size.width = %f, fullResolution.size.height = %f", fullResolutionImage.size.width, fullResolutionImage.size.height);
        
        
        UIImageView *fullResolutionImageView = [[UIImageView alloc] initWithImage:fullResolutionImage];
        
        fullResolutionImageView.frame = CGRectMake(10, 30, 300, 400);
        
        fullResolutionImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.view addSubview:fullResolutionImageView];
        
        [fullResolutionImageView release];
        
        
    } failureBlock:^(NSError *error) {
        
    }];
    
    
    [assetsLibrary release];
}


@end
