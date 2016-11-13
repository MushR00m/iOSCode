//
//  ViewController.m
//  CoreData-Demo
//
//  Created by chen songqi on 16/3/23.
//  Copyright © 2016年 niwodai. All rights reserved.
//

#import "ViewController.h"

#import <CoreData/CoreData.h>
#import "SomePerson.h"

#import "DetailViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *listArray;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"列表";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPerson)];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (NSMutableArray *)listArray
{
    if (_listArray) {
        return _listArray;
    }
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"SomePerson" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *listArray = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"查询报错 = %@",error);
    } else {
        NSLog(@"查询正确");
    }
    _listArray = [listArray mutableCopy];
    return _listArray;
}

- (void)addPerson
{
    DetailViewController *vc = [[DetailViewController alloc] init];
    vc.managedObjectContext = self.managedObjectContext;
    vc.vType = OperationAdd;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    SomePerson *person = [self.listArray objectAtIndex:indexPath.row];
    cell.textLabel.text = person.name;;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"年龄：%@",person.age];
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    SomePerson *person = [self.listArray objectAtIndex:indexPath.row];
    [self.managedObjectContext deleteObject:person];
    NSError *error = nil;
    [self.managedObjectContext save:&error];
    if (error) {
        NSLog(@"删除数据时，保存失败%@",error);
    } else {
        NSLog(@"删除数据时，保存成功");
        [self.listArray removeObject:person];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *vc = [[DetailViewController alloc] init];
    vc.managedObjectContext = self.managedObjectContext;
    vc.vType = OperationUpdate;
    vc.person = [self.listArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
