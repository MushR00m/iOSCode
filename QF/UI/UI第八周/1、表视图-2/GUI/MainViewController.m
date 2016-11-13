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
    
    // 提供数据信息
    _tableView.dataSource = self;
    
    
    //一般提供外观信息
    _tableView.delegate = self;
    
    
    //设置表视图分割线的颜色
    [_tableView setSeparatorColor:[UIColor redColor]];
    
    [self.view addSubview:_tableView];
    
}

//_tableView.delegate  当中的一些方法

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel  *label = [[UILabel alloc] init];
    label.font = [UIFont boldSystemFontOfSize:30];
    
    label.text = [NSString stringWithFormat:@"第%d段标" , section + 1];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.textColor = [UIColor redColor];
    
    return [label autorelease];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UILabel  *label = [[UILabel alloc] init];
    label.font = [UIFont boldSystemFontOfSize:15];
    
    label.text = [NSString stringWithFormat:@"第%d段尾部文" , section + 1];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.textColor = [UIColor redColor];
    
    return [label autorelease];

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath section] == 0)
    {
        return 100;
    }
    else
    {
        return 40;
    }
    
}

//每一段头部上方的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

//每一段尾部下方的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 50;
    }
    else
    {
        return 40;
    }
    
}


//数据源的方法

//设置头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"第%d段标题",section+1];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"第%d段尾部文本",section+1];
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
        rows = 600;
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
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d_%d", section, row] ;
    
    //设置cell的附件按钮类型
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    //设置自定义附件视图
    UIView *accessoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 50)];
   // accessoryView.backgroundColor = [UIColor yellowColor];
   // cell.accessoryView = accessoryView;
    [accessoryView release];
    
    return cell;
}

//附件按钮被点击的时候会被执行
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:
(NSIndexPath *)indexPath
{
    NSLog(@"accessoryButtonTappedForRowWithIndexPath");
}



@end
