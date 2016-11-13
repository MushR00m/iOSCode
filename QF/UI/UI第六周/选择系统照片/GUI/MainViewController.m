//
//  MainViewController.m
//  选择系统照片
//
//  Created by chen cheng on 14-8-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)dealloc
{
    [_imageView release];
    _imageView = nil;
    
    [super dealloc];
}

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
    [button setTitle:@"选择照片" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    button.frame = CGRectMake(0, 50, 320, 40);
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 300, 300)];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.layer.borderColor = [UIColor blackColor].CGColor;
    _imageView.layer.borderWidth = 1;
    [self.view addSubview:_imageView];
}

- (void)buttonClick:(id)sender
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    
    
    BOOL ret = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    NSLog(@"ret = %d", ret);
    if (ret)
    {
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    
    
    imagePickerController.delegate = self;
    
    [self presentViewController:imagePickerController animated:YES completion:^{
        
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"didFinishPickingMediaWithInfo  info = %@", info);
    
    
    UIImage  *image = [info valueForKey:@"UIImagePickerControllerOriginalImage"];
    
    NSLog(@"image = %@", image);
    
    _imageView.image = image;
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"imagePickerControllerDidCancel");
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
