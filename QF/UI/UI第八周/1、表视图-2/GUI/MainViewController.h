//
//  MainViewController.h
//  表视图
//
//  Created by chen cheng on 14-9-4.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    UITableView  *_tableView;
}

@end
