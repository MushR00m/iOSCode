//
//  ViewController.m
//  TTFDemo
//
//  Created by Xinfeng Du on 14-7-15.
//  Copyright (c) 2014年 新风作浪. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    for(NSString *fontfamilyname in [UIFont familyNames])
    {
        NSLog(@"family:'%@'",fontfamilyname);
        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
        {
            NSLog(@"\tfont:'%@'",fontName);
        }
        NSLog(@"-------------");
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 50)];
    label.text = @"这是一个TEST。123456";
    UIFont *font = [UIFont fontWithName:@"HanziPen SC" size:24];
    label.font = font;
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
