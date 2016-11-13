//
//  SomeTableViewController.m
//  CellAutoLayout
//
//  Created by chensongqi on 16/10/26.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "SomeTableViewController.h"
#import "SomeTableViewCell.h"

#import "SomeTableViewCell2.h"


@implementation SomeTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"TableViewAutoLayout";
    
    self.tableView.tableFooterView = [UIView new];
    
    self.tableView.estimatedRowHeight = 150;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSString *someStr = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. 那么这使得对于不同宽度的table view，我们都可以基于其宽度而得到cell的正确高度。 但是，我们不需要在-[tableView:cellForRowAtIndexPath]方法中做相同的处理，  因为，cell被用到table view中时，这是自动完成的。 也要注意，一些情况下，cell的最终宽度可能不等于table view的宽度  例如当table view的右边显示了section index的时候，必须要减去这个";
    if (indexPath.row == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID1"];
        cell.textLabel.text = @"someTest1";
        cell.detailTextLabel.text = @"detailText";
        return cell;
    } else if (indexPath.row == 1) {
        SomeTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"SomeTableViewCell" owner:self options:nil] firstObject];
        cell.layer.borderWidth = 1.f;
        cell.layer.borderColor = [[UIColor redColor] CGColor];
        return cell;
    } else if (indexPath.row == 2) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID4"];
        cell.textLabel.text = @"someTest2";
        cell.detailTextLabel.text = @"detailText";
        return cell;
    } else if (indexPath.row == 3) {
        SomeTableViewCell2 *cell = [[SomeTableViewCell2 alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID2"];
        cell.layer.borderColor = [UIColor greenColor].CGColor;
        cell.layer.borderWidth = 1.f;
        return cell;
    } else if (indexPath.row == 4) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID4"];
        cell.textLabel.text = @"someTest2";
        cell.detailTextLabel.numberOfLines = 0;
        cell.detailTextLabel.text = @"detailTextxxxxdetailTextxxxxdetailTextxxxxdetailTextxxxxd";
        cell.layer.borderColor = [UIColor blueColor].CGColor;
        cell.layer.borderWidth = 2.f;
        return cell;
    }  else {
        return [UITableViewCell new];
    }
}

@end
