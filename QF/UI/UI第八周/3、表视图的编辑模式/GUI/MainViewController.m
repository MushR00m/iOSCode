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
    
    
    //向表视图提供数据信息
    _tableView.dataSource = self;
    
    //向表视图提供外观信息
    _tableView.delegate = self;
    
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

//_tableView.delegate 的方法
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath

{
    NSLog(@"111editingStyleForRowAtIndexPath");
    if ([indexPath section] == 0)
    {
        NSLog(@"122editingStyleForRowAtIndexPath");
        return UITableViewCellEditingStyleDelete;
    }
    else if ([indexPath section] == 1)
    {
        return UITableViewCellEditingStyleInsert;
    }
    else
    {
        return UITableViewCellEditingStyleNone;
    }
}


//数据源告诉表视图哪些行可以支持编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"222canEditRowAtIndexPath");
    return YES;
}

//表视图向数据源提交编辑、数据源在这个函数执行相应的数据修改
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"commitEditingStyle editingStyle = %d", editingStyle);
    
    static int i = 1;
    
    if ([indexPath section] == 0
        && editingStyle == UITableViewCellEditingStyleDelete)
    {
        [_stuMutableArray removeObjectAtIndex:[indexPath row]];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if ([indexPath section] == 1
             && editingStyle == UITableViewCellEditingStyleInsert)
    {
        [_teacherMutableArray insertObject:[NSString stringWithFormat:@"new_tt_%d", i++] atIndex:[indexPath row]];
        
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
    }
}


- (IBAction)editeButtonClick:(id)sender
{
    [_tableView setEditing:YES animated:YES];
}
- (IBAction)cancelEditeButtonClick:(id)sender
{
    [_tableView setEditing:NO animated:YES];
}

@end
