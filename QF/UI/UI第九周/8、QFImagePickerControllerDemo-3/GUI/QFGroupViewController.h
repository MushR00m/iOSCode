//
//  QFGroupViewController.h
//  QFImagePickerControllerDemo
//
//  Created by chen cheng on 14-8-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QFImagePickerController;

@interface QFGroupViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    QFImagePickerController *_delegate;
    
    //视图
    UITableView    *_tableView;
    
    //model
    NSMutableArray  *_groupInfoMutableArray;
}

@property(assign, readwrite, nonatomic)QFImagePickerController *delegate;

@end
