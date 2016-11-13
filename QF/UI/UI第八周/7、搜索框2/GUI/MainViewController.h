//
//  MainViewController.h
//  分组展开
//
//  Created by chen cheng on 14-9-5.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate>
{
    UISearchBar   *_searchBar;
    
    //视图
    UITableView  *_tableView;
    //model
    NSMutableArray   *_dataMutableArray;
    
   
    UISearchDisplayController  *_QF_searchDisplayController;
    
    //搜索结果model
    NSMutableArray   *_resultDataMutableArray;
    
    
}

@end
