//
//  MainViewController.m
//  下拉刷新
//
//  Created by chen cheng on 14-9-9.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        _dataMutableArray = [[NSMutableArray alloc] init];
        
        
        for (int i=0; i<20; i++)
        {
            [_dataMutableArray addObject:[NSString stringWithFormat:@"第几行%d数据", i+1]];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _qftableView = [[QFTableView alloc] initWithFrame:CGRectMake(0, 20, 320, 460) style:UITableViewStylePlain];
    
    _qftableView.dataSource = self;
    
    [self.view addSubview:_qftableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataMutableArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString  *cellId = @"cellId";
    
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = [_dataMutableArray objectAtIndex:[indexPath row]];
    
    return cell;
}

- (void)tableViewRefreshData:(QFTableView *)tableView
{
    NSLog(@"重新加载数据");
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(didLoadData) userInfo:nil repeats:NO];
}

- (void)didLoadData
{
    NSLog(@"数据加载完成");
    
    //把数据替换掉
    
    
    [_dataMutableArray removeAllObjects];
    
    for (int i=0; i<20; i++)
    {
        [_dataMutableArray addObject:[NSString stringWithFormat:@"重新加载的数据 %d", i+1]];
    }

    [_qftableView reloadData];
    
    [_qftableView didLoadData];
}



@end
