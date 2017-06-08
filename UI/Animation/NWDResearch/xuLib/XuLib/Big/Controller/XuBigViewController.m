//
//  XuBigViewController.m
//  XuLib
//
//  Created by xuwenyuan on 2017/6/6.
//  Copyright © 2017年 xu. All rights reserved.
//

#import "XuBigViewController.h"
#import "XuBigView.h"

@interface XuBigViewController ()<XuBigViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UITableView *tView;
@property (nonatomic, strong) XuBigView *topView;

@end

@implementation XuBigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.tView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tView];
    
    self.topView = [[XuBigView alloc] init];
    self.topView.delegate = self;
    [self.tView addSubview:self.topView];
    self.tView.delegate = self;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.topView refreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.topView refreshScrollViewDidEndDragging:scrollView];
}

//- (void)refreshTableHeaderDidTriggerRefresh:(NWDRefreshTableHeaderView*)view
//{
//    self.isPullRequest = YES;
//    [self requestMain];
//}


@end
