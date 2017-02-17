//
//  ViewController.m
//  searchBarDemo
//
//  Created by chensongqi on 16/7/14.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UISearchBarDelegate, UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *vTableView;

@property (nonatomic, strong) UISearchBar *vSearchBar;

@property (strong,nonatomic) NSMutableArray  *dataList;

@property (strong,nonatomic) NSMutableArray  *searchList;

@property (strong, nonatomic) NSArray *tableViewData;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataList=[NSMutableArray arrayWithCapacity:50];
    
    for (NSInteger i=0; i<50; i++) {
        [self.dataList addObject:[NSString stringWithFormat:@"%ld-FlyElephant",(long)i]];
    }
    _vTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _vTableView.delegate = self;
    _vTableView.dataSource = self;
    _tableViewData = self.dataList;
    [self.view addSubview:_vTableView];
    
//    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@",@"2"];
//   NSArray *vArray =  [self.dataList filteredArrayUsingPredicate:pred];
//    NSLog(@"---- %@",vArray);

    
    _vSearchBar=[[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.frame), 40)];
    _vSearchBar.autocapitalizationType = UITextAutocapitalizationTypeWords;
    _vSearchBar.autocorrectionType = UITextAutocorrectionTypeYes;
    _vSearchBar.delegate = self;
    _vSearchBar.showsCancelButton = YES;
    _vTableView.tableHeaderView = _vSearchBar;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableViewData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSString *vStr = [self.tableViewData objectAtIndex:indexPath.row];
    cell.textLabel.text = vStr;
    return cell;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSMutableString *str = [[NSMutableString alloc] init];
    
    for (NSInteger i=0; i < searchText.length; i++) {
        NSString *s = [searchText substringWithRange:NSMakeRange(i, 1)];
        [str appendString:[NSString stringWithFormat:@".*%@",s]];
    }
    [str appendString:@".*"];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",str];
    self.tableViewData =  [self.dataList filteredArrayUsingPredicate:pre];
    [self.vTableView reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text = @"";
    self.tableViewData = self.dataList;
    [_vTableView reloadData];
    [searchBar resignFirstResponder];
}

@end
