//
//  MyTableViewCell.h
//  分组展开
//
//  Created by chen cheng on 14-9-5.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
{
    UIView  *_bottomLineView;
    
    CGFloat _bottomLineLength;
}

@property(assign, readwrite, nonatomic)CGFloat bottomLineLength;



@end
