//
//  XuMenuViewController.m
//  XuLib
//
//  Created by xu on 15/8/29.
//  Copyright (c) 2015年 xu. All rights reserved.
//

#import "XuMenuViewController.h"
#import "XuAnimationViewController.h"
#import "XuThreeBallViewController.h"

#import "XuPaintingViewController.h"
#import "XuUIViewAnimationViewController.h"
#import "XuBase2ViewController.h"
#import "XuCoreAnimationViewController.h"
#import "XuMaskViewController.h"
#import "XuBigViewController.h"

@interface XuMenuViewController ()

@end

@implementation XuMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuItemCell" forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuItemCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MenuItemCell"];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"animation";
            break;
            
        case 1:
            cell.textLabel.text = @"3个球";
            break;
            
        case 2:
            cell.textLabel.text = @"画图";
            break;
            
        case 3:
            cell.textLabel.text = @"UIViewAnimation";
            break;
            
        case 4:
            cell.textLabel.text = @"UIViewAni2";
            break;
            
        case 5:
            cell.textLabel.text = @"CoreAnimation";
            break;
            
        case 6:
            cell.textLabel.text = @"mask";
            break;
            
        case 7:
            cell.textLabel.text = @"组合";
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            XuAnimationViewController *wCon = [[XuAnimationViewController alloc] init];
            [self.navigationController pushViewController:wCon animated:YES];
        }
            break;
            
        case 1:
        {
            XuThreeBallViewController *wCon = [[XuThreeBallViewController alloc] init];
            [self.navigationController pushViewController:wCon animated:YES];
        }
            break;
            
        case 2:
        {
            XuPaintingViewController *wCon = [[XuPaintingViewController alloc] init];
            [self.navigationController pushViewController:wCon animated:YES];
        }
            break;
            
        case 3:
        {
            XuUIViewAnimationViewController *wCon = [[XuUIViewAnimationViewController alloc] init];
            [self.navigationController pushViewController:wCon animated:YES];
        }
            break;
            
        case 4:
        {
            XuBase2ViewController *wCon = [[XuBase2ViewController alloc] init];
            [self.navigationController pushViewController:wCon animated:YES];
        }
            break;
            
        case 5:
        {
            XuCoreAnimationViewController *wCon = [[XuCoreAnimationViewController alloc] init];
            [self.navigationController pushViewController:wCon animated:YES];
        }
            break;
          
        case 6:
        {
            XuMaskViewController *wCon = [[XuMaskViewController alloc] init];
            [self.navigationController pushViewController:wCon animated:YES];
        }
            break;
            
        case 7:
        {
            XuBigViewController *wCon = [[XuBigViewController alloc] init];
            [self.navigationController pushViewController:wCon animated:YES];
        }
            break;
            
        default:
            break;
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
