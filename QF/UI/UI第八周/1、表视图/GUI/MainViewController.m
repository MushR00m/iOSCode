//
//  MainViewController.m
//  表视图
//
//  Created by chen cheng on 14-9-4.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)dealloc
{
    [_tableView release];
    _tableView = nil;
    
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
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 30, 300, 400) style:UITableViewStyleGrouped];
    
    _tableView.layer.borderWidth = 1;
    _tableView.layer.borderColor = [UIColor blackColor].CGColor;
    
    
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"表视图 问数据源 一共有多少段");
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"表视图 问数据源 第%d段有多少行", section);
    
    int rows = 0;
    
    if (section == 0)
    {
        rows = 3;
    }
    else if (section == 1)
    {
        rows = 5;
    }
    else if (section == 2)
    {
        rows = 10;
    }
    
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = [indexPath section];
    NSInteger row = [indexPath row];
    
    NSLog(@"表视图 问数据源 第%d段 第%d行 的内容是什么", section, row);
    
    //cellId  相同、表示的是cell之间是可以复用  （cellId标示cell的类型）
    static  NSString  *cellId = @"cellId";
    
    //如果每一个cell的cellId不一样 则cell之间是不能复用的
    //NSString  *cellId2 = [NSString stringWithFormat:@"%d_%d", section, row];
    
    
    UITableViewCell  *cell = nil;
    
    //查看表视图的复用队列里面 有没cell标示符等于cellId的cell、并且这个cell现在没有被现实出来 (也就是说这个cell可以被拿出来复用，不需要重新创建新的cell)
    cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil)
    {
        NSLog(@"创建 第%d段%d行 的新cell", section, row);
        
        //创建新的cell  并且新的cell会自动加入到表视图的复用队列里面
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] autorelease];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d_%d", section, row] ;
    
    return cell;
}



@end
