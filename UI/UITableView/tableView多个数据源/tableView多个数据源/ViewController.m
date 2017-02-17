//
//  ViewController.m
//  tableView多个数据源
//
//  Created by chen songqi on 15/7/1.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"

@interface Dog : NSObject <UITableViewDataSource>

@end

@implementation Dog

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"MycellID1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"Dog";
    return cell;
}

@end


@interface Cat : NSObject <UITableViewDataSource>

@end

@implementation Cat

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"MycellID2";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"Cat";
    return cell;
}

@end



@interface ViewController () <UITableViewDelegate>


@property (nonatomic, strong) Dog *ddog;

@property (nonatomic, strong) Cat *ccat;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _myTableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) style:UITableViewStylePlain];
    [self.view addSubview:_myTableView];
    _myTableView.delegate = self;

    _ddog = [[Dog alloc] init];

    _ccat = [[Cat alloc] init];

    _myTableView.dataSource = _ddog;


    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"测试按钮" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(30, 300, 100, 40);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];

}

- (void)btnClick
{
    _myTableView.dataSource = _ccat;
    [_myTableView reloadData];
}



@end
