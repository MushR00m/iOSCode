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
    
    [_stuMutableArray1 release];
    _stuMutableArray1 = nil;
    
    [_stuMutableArray2 release];
    _stuMutableArray2 = nil;
    
    [_stuMutableArray3 release];
    _stuMutableArray3 = nil;
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _stuMutableArray1 = [[NSMutableArray alloc] init];
        
        [_stuMutableArray1 addObject:@"A1"];
        [_stuMutableArray1 addObject:@"A2"];
        [_stuMutableArray1 addObject:@"A3"];
        [_stuMutableArray1 addObject:@"A4"];
        [_stuMutableArray1 addObject:@"A5"];
        [_stuMutableArray1 addObject:@"A6"];
        [_stuMutableArray1 addObject:@"A7"];
        [_stuMutableArray1 addObject:@"A8"];
        [_stuMutableArray1 addObject:@"A9"];
        [_stuMutableArray1 addObject:@"A10"];
        
        
        _stuMutableArray2 = [[NSMutableArray alloc] init];
        
        [_stuMutableArray2 addObject:@"B1"];
        [_stuMutableArray2 addObject:@"B2"];
        [_stuMutableArray2 addObject:@"B3"];
        [_stuMutableArray2 addObject:@"B4"];
        [_stuMutableArray2 addObject:@"B5"];
        [_stuMutableArray2 addObject:@"B6"];
        [_stuMutableArray2 addObject:@"B7"];
        [_stuMutableArray2 addObject:@"B8"];
        [_stuMutableArray2 addObject:@"B9"];
        [_stuMutableArray2 addObject:@"B10"];
        
        
        _stuMutableArray3 = [[NSMutableArray alloc] init];
        
        [_stuMutableArray3 addObject:@"C1"];
        [_stuMutableArray3 addObject:@"C2"];
        [_stuMutableArray3 addObject:@"C3"];
        [_stuMutableArray3 addObject:@"C4"];
        [_stuMutableArray3 addObject:@"C5"];
        [_stuMutableArray3 addObject:@"C6"];
        [_stuMutableArray3 addObject:@"C7"];
        [_stuMutableArray3 addObject:@"C8"];
        [_stuMutableArray3 addObject:@"C9"];
        [_stuMutableArray3 addObject:@"C10"];
        
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 30, 300, 400) style:UITableViewStylePlain];
    
    _tableView.layer.borderWidth = 1;
    _tableView.layer.borderColor = [UIColor blackColor].CGColor;
    
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
    
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"%c", 'A' + section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80;
}

- (NSArray *)sectionIndexTitlesForTableView: (UITableView *)tableView
{
    return [NSArray arrayWithObjects:@"A", @"B", @"C",  nil];
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
        rows = [_stuMutableArray1 count];
    }
    else if (section == 1)
    {
        rows = [_stuMutableArray2 count];
    }
    else if (section == 2)
    {
        rows = [_stuMutableArray3 count];
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
        cell.textLabel.text = [_stuMutableArray1 objectAtIndex:row];
    }
    else if (section == 1)
    {
        cell.textLabel.text = [_stuMutableArray2 objectAtIndex:row];
    }
    else if (section == 2)
    {
        cell.textLabel.text = [_stuMutableArray3 objectAtIndex:row];
    }

    
    
    
    
    return cell;
}




@end
