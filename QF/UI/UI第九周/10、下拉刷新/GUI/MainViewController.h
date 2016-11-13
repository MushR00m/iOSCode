//
//  MainViewController.h
//  下拉刷新
//
//  Created by chen cheng on 14-9-9.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFTableView.h"

@interface MainViewController : UIViewController<QFTableViewDataSource>
{
    QFTableView  *_qftableView;
    
    NSMutableArray  *_dataMutableArray;
}

@end
