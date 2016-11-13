//
//  QFTableView.h
//  下拉刷新
//
//  Created by chen cheng on 14-9-9.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>



@class QFTableView;

@protocol QFTableViewDataSource <NSObject, UITableViewDataSource>

@required
- (void)tableViewRefreshData:(QFTableView *)tableView;

@end


@interface QFTableView : UITableView<UITableViewDelegate>


@property (nonatomic, assign)   id <QFTableViewDataSource> dataSource;

- (void)didLoadData;

@end
