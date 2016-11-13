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

- (void)dealloc
{
    [_groupViewController release];
    _groupViewController = nil;
    
    [_imageViewController release];
    _imageViewController = nil;
    
    [_navigationController release];
    _navigationController = nil;
    
    [super dealloc];
}

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
    _imageViewController.delegate = self;
    
    _navigationController = [[UINavigationController alloc] initWithRootViewController:_groupViewController];
    
    
    [self.view addSubview:_navigationController.view];
}

- (void)showImageViewWithGroupURL:(NSURL *)groupURL
{
    _imageViewController.groupURL = groupURL;
    
    [_navigationController pushViewController:_imageViewController animated:YES];
}

- (void)didCancel
{
    [_delegate imagePickerControllerDidCancel:self];
}

- (void)didFinishPickingWithArray:(NSArray *)imageArray
{
    [_delegate imagePickerController:self didFinishPickingWithArray:imageArray];
}


@end
