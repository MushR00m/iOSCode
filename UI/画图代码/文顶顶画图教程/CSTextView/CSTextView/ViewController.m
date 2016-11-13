//
//  ViewController.m
//  CSTextView
//
//  Created by chen songqi on 15/8/18.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"

#import "TextView.h"
#import "ImageView.h"

#import "ContextTest.h"

@interface ViewController ()

@property (nonatomic, strong) ContextTest *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _textView = [[ContextTest alloc] initWithFrame:self.view.bounds];
    _textView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_textView];

}


@end
