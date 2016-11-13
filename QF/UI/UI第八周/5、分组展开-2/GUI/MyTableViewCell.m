//
//  MyTableViewCell.m
//  分组展开
//
//  Created by chen cheng on 14-9-5.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self != nil)
    {
        _bottomLineView = [[UIView alloc] init];
        
        _bottomLineView.backgroundColor = [UIColor lightGrayColor];
        
        [self addSubview:_bottomLineView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _bottomLineView.frame = CGRectMake(self.frame.size.width-_bottomLineLength, self.frame.size.height-1, _bottomLineLength, 1);
}

- (void)setBottomLineLength:(CGFloat)bottomLineLength
{
    _bottomLineLength = bottomLineLength;
    
    _bottomLineView.frame = CGRectMake(self.frame.size.width-_bottomLineLength, self.frame.size.height-1, _bottomLineLength, 1);
}


@end
