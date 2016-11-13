//
//  QFImageViewController.m
//  QFImagePickerControllerDemo
//
//  Created by chen cheng on 14-8-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFImageViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface QFImageViewController ()

@end

@implementation QFImageViewController

- (void)setGroupURL:(NSURL *)groupURL
{
    if (groupURL == _groupURL)
    {
         NSLog(@"groupURL == _groupURL");
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
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(rightButtonClick:)];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:rightButton,nil];
    
}
- (void)rightButtonClick:(id)sender
{
    
    
    
    
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
            NSLog(@"函数被执行了");
           _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((index%4 * 80), index/4 * 80, 80, 80)];
            
            _imageView.image = [UIImage imageWithCGImage:result.thumbnail];
            _imageView.userInteractionEnabled = YES;
            [_scrollView addSubview:_imageView];
            
            
            
            UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        
            NSLog(@"函数被执行了没");

            [_imageView addGestureRecognizer:tapGestureRecognizer];
            [tapGestureRecognizer release];
            [_imageView release];
            
            
        }];
        
    } failureBlock:^(NSError *error) {
        
    }];
}
- (void)tapClick:(UITapGestureRecognizer *)tapGestureRecognizer
{
    NSLog(@"tapClick");
    CGRect rect = tapGestureRecognizer.view.frame;
    UIImageView *topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(rect.origin.x + 80 -23, rect.origin.y + 80 -23, 23, 23)];
    
    topImageView.image = [UIImage imageNamed:@"selected.png"];
    
    
    
    if (tapGestureRecognizer.view.tag%2 == 0)
    {
        NSLog(@"tapGestureRecognizer.view.tag = %d",tapGestureRecognizer.view.tag);

        [_scrollView addSubview:topImageView];
        
    }
    else
    {
        NSLog(@"tapGestureRecognizer.view.tag = %d",tapGestureRecognizer.view.tag);

        [_scrollView addSubview:tapGestureRecognizer.view];
        
        
    }
    [topImageView release];
    
    tapGestureRecognizer.view.tag++;
    
}


@end
