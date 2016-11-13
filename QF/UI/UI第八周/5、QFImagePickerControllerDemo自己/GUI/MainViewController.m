//
//  MainViewController.m
//  QFImagePickerControllerDemo
//
//  Created by chen cheng on 14-8-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"
#import "QFImagePickerController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 70, 300, 400)];

        _scrollView.layer.borderColor = [UIColor redColor].CGColor;
        _scrollView.layer.borderWidth = 1;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"选择照片" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(10, 30, 300, 40);
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick:(id)sender
{
    QFImagePickerController  *imagePickerController = [[QFImagePickerController alloc] init];
    
    imagePickerController.delegate = self;

    [self presentViewController:imagePickerController animated:YES completion:nil];
    
    [imagePickerController release];
}

- (void)imagePickerController:(QFImagePickerController *)picker didFinishPickingWithArray:(NSArray *)imageArray
{
    NSLog(@"用户完成了选择");
    
    NSLog(@"imageArray = %@", imageArray);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    ALAssetsLibrary  *assetsLibrary = [[ALAssetsLibrary alloc] init];

    _scrollView.contentSize = CGSizeMake([imageArray count] * 300 , 400);

    for (int i = 0; i < [imageArray count]; i++)
    {
        NSURL  *assetURL = [imageArray objectAtIndex:i ];
        
        [assetsLibrary assetForURL:assetURL resultBlock:^(ALAsset *asset)
         {
             
             ALAssetRepresentation *assetRepresentation = [asset defaultRepresentation];
             
             
          
             UIImage *fullResolutionImage = [UIImage imageWithCGImage:[assetRepresentation fullResolutionImage] scale:1 orientation:(UIImageOrientation)(assetRepresentation.orientation)] ;
             
             NSLog(@"fullResolution.size.width = %f, fullResolution.size.height = %f", fullResolutionImage.size.width, fullResolutionImage.size.height);
             
             
             UIImageView *fullResolutionImageView = [[UIImageView alloc] initWithImage:fullResolutionImage];
             
            

             fullResolutionImageView.frame = CGRectMake(   300 * i, 0  , 300 , 400);
             fullResolutionImageView.contentMode =UIViewContentModeScaleAspectFit;
             
             
             
             //垂直方向永远不可以拉动
             _scrollView.alwaysBounceVertical = NO;
             
             //水平方向永远可以拉动
             _scrollView.alwaysBounceHorizontal = YES;
             
             //只能停靠在整数页的地方
             _scrollView.pagingEnabled = YES;
             
             //影藏水平滚动条
             _scrollView.showsHorizontalScrollIndicator = NO;
             
             //影藏垂直滚动条
             _scrollView.showsVerticalScrollIndicator = NO;
             

            
             
             [self.view addSubview:_scrollView];
             
             [_scrollView addSubview:fullResolutionImageView];
             
             [fullResolutionImageView release];
             
             
         } failureBlock:^(NSError *error) {
             
         }];

    }
    
    
    
    
    [assetsLibrary release];

   
    
    

}

- (void)imagePickerControllerDidCancel:(QFImagePickerController *)picker
{
    NSLog(@"用户取消了选择");
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
