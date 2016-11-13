//
//  View1Controller.m
//  滚动视图的contentInset
//
//  Created by chen cheng on 14-9-3.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "View1Controller.h"

@interface View1Controller ()

@end

@implementation View1Controller

- (id)init
{
    self = [super init];
    if (self)
    {
        self.navigationItem.title = @"视图1";
        
        self.edgesForExtendedLayout =  UIRectEdgeLeft | UIRectEdgeRight;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)];
    
    _scrollView.layer.borderColor = [UIColor redColor].CGColor;
    _scrollView.layer.borderWidth = 1;
    
    
    UILabel  *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.backgroundColor = [UIColor redColor];
    
    _scrollView.alwaysBounceVertical = YES;
    
    [_scrollView addSubview:label];
    
    [label release];
    
    _scrollView.contentSize = CGSizeMake(320, 416);
    
 
    
    //_scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    
    NSLog(@"_scrollView== %@",_scrollView);
    [self.view addSubview:_scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
