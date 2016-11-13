//
//  QFImageViewController.m
//  QFImagePickerControllerDemo
//
//  Created by chen cheng on 14-8-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFImageViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface ImageItemView : UIView
{
    UIImageView  *_imageView;
    
    UIImageView  *_selectedImageView;
    
    BOOL          _selected;
    
    NSURL        *_imageURL;
}
@property(retain ,readwrite,nonatomic)UIImage *image;
@property(retain ,readwrite,nonatomic) NSURL  *imageURL;

@property(assign ,readwrite,nonatomic) BOOL   selected;





@end














@interface QFImageViewController ()

@end

@implementation QFImageViewController

- (void)setGroupURL:(NSURL *)groupURL
{
    if (groupURL == _groupURL)
    {
        return;
    }
    
    NSLog(@"_groupURL = %@", _groupURL);
    
    [groupURL retain];
    [_groupURL release];
    _groupURL = groupURL;
    
    if ([self isViewLoaded])
    {
        //刷新照片
        [self loadAllImage];
    }
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.navigationItem.title = @"选择照片";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-64)];
    _scrollView.alwaysBounceVertical = YES;
    
    [self.view addSubview:_scrollView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadAllImage];
    
}

- (void)loadAllImage
{
    NSLog(@"loadAllImage");
    
    NSArray  *subviews = [_scrollView subviews];
    
    for (int i=0; i<[subviews count]; i++)
    {
        UIView *subView = [subviews objectAtIndex:i];
        [subView removeFromSuperview];
    }
    
    ALAssetsLibrary *AssetsLibrary = [[ALAssetsLibrary alloc] init];
    
    [AssetsLibrary groupForURL:self.groupURL resultBlock:^(ALAssetsGroup *group) {
        
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            
            if (result == nil)
            {
                return;
            }
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((index%4 * 80), index/4 * 80, 80, 80)];
            
            imageView.image = [UIImage imageWithCGImage:result.thumbnail];
            
            [_scrollView addSubview:imageView];
            
            [imageView release];
            
        }];
        
    } failureBlock:^(NSError *error) {
        
    }];
}



@end
