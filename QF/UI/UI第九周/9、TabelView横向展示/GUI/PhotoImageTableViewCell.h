//
//  TableViewCell.h
//  TabelView横向展示
//
//  Created by chen cheng on 14-9-9.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoImageTableViewCell : UITableViewCell
{
    UIImageView  *_photoImageView;
}

@property(retain, readwrite, nonatomic)UIImage *photoImage;

@end
