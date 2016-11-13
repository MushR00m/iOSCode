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
    
    [_stuMutableArray release];
    _stuMutableArray = nil;
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _stuMutableArray = [[NSMutableArray alloc] init];
        
        [_stuMutableArray addObject:@"stu1"];
        [_stuMutableArray addObject:@"stu2"];
        [_stuMutableArray addObject:@"stu3"];
        [_stuMutableArray addObject:@"stu4"];
        [_stuMutableArray addObject:@"stu5"];
        
        
        _teacherMutableArray = [[NSMutableArray alloc] init];
        
        [_teacherMutableArray addObject:@"tt1"];
        [_teacherMutableArray addObject:@"tt2"];
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"表视图 问数据源 第%d段有多少行", section);
    
    int rows = 0;
    
    if (section == 0)
    {
        rows = [_stuMutableArray count];
    }
    else if (section == 1)
    {
        rows = [_teacherMutableArray count];
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
    
    //查看表视图的复用队列里面 有没cell标示符等于cellId的cell、并且这个cell现在没有被显示出来 (也就是说这个cell可以被拿出来复用，不需要重新创建新的cell)
    cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil)
    {
        NSLog(@"创建 第%d段%d行 的新cell", section, row);
        
        //创建新的cell  并且新的cell会自动加入到表视图的复用队列里面
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] autorelease];
    }
    
    if (section == 0)
    {
        cell.textLabel.text = [_stuMutableArray objectAtIndex:row];
    }
    else if (section == 1)
    {
        cell.textLabel.text = [_teacherMutableArray objectAtIndex:row];
    }
    
    
    
    return cell;
}

- (IBAction)deleteButtonClick:(id)sender
{
    NSIndexPath  *indexPath = [_tableView indexPathForSelectedRow];
    
    if (indexPath == nil)
    {
        return;
    }

    if ([indexPath section] == 0)
    {
        //从model里面删除数据
        [_stuMutableArray removeObjectAtIndex:[indexPath row]];
    }
    else if ([indexPath section] == 1)
    {
        //从model里面删除数据
        [_teacherMutableArray removeObjectAtIndex:[indexPath row]];
    }
    
    NSArray *indexPathsArray = [NSArray arrayWithObjects:indexPath, nil];
    
    //从表视图中删除某些行
    [_tableView deleteRowsAtIndexPaths:indexPathsArray withRowAnimation:UITableViewRowAnimationLeft];
}

- (IBAction)addButtonClick:(id)sender
{
    NSIndexPath  *indexPath = [_tableView indexPathForSelectedRow];
    
    if (indexPath == nil)
    {
        return;
    }
    
    static int i = 1;
    
    if ([indexPath section] == 0)
    {
        //先把数据插入到model中
        [_stuMutableArray insertObject:[NSString stringWithFormat:@"new_stu_%d", i++] atIndex:[indexPath row]];
    }
    else if ([indexPath section] == 1)
    {
        //先把数据插入到model中
        [_teacherMutableArray insertObject:[NSString stringWithFormat:@"new_tt_%d", i++] atIndex:[indexPath row]];
    }
    //[_tableView reloadData];

    NSArray *indexPathsArray = [NSArray arrayWithObjects:indexPath, nil];
    
    //在视图中插入
    [_tableView insertRowsAtIndexPaths:indexPathsArray withRowAnimation:UITableViewRowAnimationFade];
}


@end
