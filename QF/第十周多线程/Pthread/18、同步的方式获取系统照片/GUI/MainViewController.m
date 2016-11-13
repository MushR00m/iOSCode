//
//  MainViewController.m
//  同步的方式获取系统照片
//
//  Created by chen cheng on 14-9-18.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

#import "QFAssetsTool.h"

@interface MainViewController ()

@end


@implementation MainViewController


- (IBAction)downloadPhoto1:(id)sender
{
    //同步方式获取照片
    
    NSURL *imageURL = [NSURL URLWithString:@"assets-library://asset/asset.JPG?id=5B030D31-4AD8-41E9-8B56-62DBBCE3BD92&ext=JPG"];
    
    UIImage *image = [QFAssetsTool synchronousImageWithURL:imageURL];
    
    self.imagView.image = image;
}

- (IBAction)downloadPhoto2:(id)sender
{
    //异步方式获取照片
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    [_imagView release];
    [super dealloc];
}
@end
