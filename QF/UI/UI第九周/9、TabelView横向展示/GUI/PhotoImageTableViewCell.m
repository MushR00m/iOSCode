//
//  PhotoImageTableViewCell.m
//  TabelView横向展示
//
//  Created by chen cheng on 14-9-9.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "PhotoImageTableViewCell.h"

@implementation PhotoImageTableViewCell

- (void)setPhotoImage:(UIImage *)photoImage
{
    _photoImageView.image = photoImage;
}

- (UIImage *)photoImage
{
    return _photoImageView.image;
}

- (void)dealloc
{
    [_photoImageView release];
    _photoImageView = nil;
    
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _photoImageView = [[UIImageView alloc] init];
        [self addSubview:_photoImageView];
        
        //内容的填充模式 不拉伸
        _photoImageView.contentMode = UIViewContentModeScaleAspectFit;
        //超出部分不显示
        self.layer.masksToBounds = YES;
    }
    return self;
}


- (void)layoutSubviews
{
    NSLog(@"layoutSubviews");
    
    NSLog(@"self.frame.size.height = %f, self.frame.size.width = %f", self.frame.size.height, self.frame.size.width);
    [super layoutSubviews];
    
    _photoImageView.layer.transform = CATransform3DIdentity;
    _photoImageView.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.width);
    
    _photoImageView.center = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
    
    _photoImageView.layer.transform = CATransform3DMakeRotation(-90.0 / 180.0 * 3.1415926, 0, 0, 1);
}


@end
