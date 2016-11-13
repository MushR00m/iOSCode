//
//  MainViewController.m
//  QFImagePickerControllerDemo
//
//  Created by chen cheng on 14-8-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"
#import "QFImagePickerController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight;
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

}

- (void)imagePickerControllerDidCancel:(QFImagePickerController *)picker
{
    NSLog(@"用户取消了选择");
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
