//
//  QFImagePickerController.m
//  QFImagePickerControllerDemo
//
//  Created by chen cheng on 14-8-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFImagePickerController.h"

@interface QFImagePickerController ()

@end

@implementation QFImagePickerController

- (id)init
{
    self = [super init];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _groupViewController = [[QFGroupViewController alloc] init];
    
    _groupViewController.delegate = self;
    
    _imageViewController = [[QFImageViewController alloc] init];
    
    _navigationController = [[UINavigationController alloc] initWithRootViewController:_groupViewController];
    
    
    [self.view addSubview:_navigationController.view];
}

- (void)showImageViewWithGroupURL:(NSURL *)groupURL
{
    _imageViewController.groupURL = groupURL;
    
    [_navigationController pushViewController:_imageViewController animated:YES];
}


@end
