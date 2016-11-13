//
//  QFGroupViewController.m
//  QFImagePickerControllerDemo
//
//  Created by chen cheng on 14-8-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFGroupViewController.h"

#import <AssetsLibrary/AssetsLibrary.h>

#import "QFImagePickerController.h"


@interface GroupViewCell : UIView
{
    UIImageView   *_imageView;
    UILabel       *_titleLabel;
    UILabel       *_numberOfImageLabel;
    NSURL         *_groupURL;
}

@property(retain, readwrite, nonatomic)UIImage *image;
@property(retain, readwrite, nonatomic)NSString *title;
@property(assign, readwrite, nonatomic)int numberOfImage;
@property(retain, readwrite, nonatomic)NSURL *groupURL;

@end

@implementation GroupViewCell

- (void)setImage:(UIImage *)image
{
    _imageView.image = image;
}

- (UIImage *)image
{
    return _imageView.image;
}

- (void)setTitle:(NSString *)title
{
    _titleLabel.text = title;
}
- (NSString *)title
{
    return _titleLabel.text;
}

- (void)setNumberOfImage:(int)numberOfImage
{
    _numberOfImageLabel.text = [NSString stringWithFormat:@"%d", numberOfImage];
}

- (int)numberOfImage
{
    return [_numberOfImageLabel.text integerValue];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, frame.size.height)];
        
        [self addSubview:_imageView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_imageView.frame.origin.x + _imageView.frame.size.width + 10, frame.size.height/2.0 - 40, 200, 40)];
        
        [self addSubview:_titleLabel];
        
        
        _numberOfImageLabel = [[UILabel alloc] initWithFrame:CGRectMake(_imageView.frame.origin.x + _imageView.frame.size.width + 10, frame.size.height/2.0, 200, 40)];
        
        [self addSubview:_numberOfImageLabel];
    }
    
    return self;
}



@end




@interface QFGroupViewController ()

@end

@implementation QFGroupViewController

- (void)dealloc
{
    [_scrollView release];
    _scrollView  = nil;

    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.navigationItem.title = @"选择相册";
        
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonClick:)] autorelease];
    }
    return self;
}

- (void)cancelButtonClick:(id)sender
{
    [self.delegate didCancel];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-64)];
    _scrollView.alwaysBounceVertical = YES;
    [self.view addSubview:_scrollView];
    
    static  CGFloat  groupViewCellY = 0;
    
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        if (group == nil)
        {
            //当所有相册都显示完毕后  重新把groupViewCellY设置为0
            groupViewCellY = 0;
            return ;
        }
        
        GroupViewCell  *groupViewCell = [[GroupViewCell alloc] initWithFrame:CGRectMake(0, groupViewCellY, 320, 100)];

        groupViewCellY  = groupViewCellY + 100;
        
        
        groupViewCell.groupURL = [group valueForProperty:ALAssetsGroupPropertyURL];

        
        groupViewCell.image = [UIImage imageWithCGImage:group.posterImage];
        
        groupViewCell.title = [group valueForProperty:ALAssetsGroupPropertyName];
        
        groupViewCell.numberOfImage = group.numberOfAssets;
        
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        
        [groupViewCell addGestureRecognizer:tapGestureRecognizer];
        
        [tapGestureRecognizer release];
        
        
        [_scrollView addSubview:groupViewCell];
        
        
        if (groupViewCellY + 100 > _scrollView.frame.size.height)
        {
            _scrollView.contentSize = CGSizeMake(320, groupViewCellY + 100);
        }
        else
        {
            _scrollView.contentSize = CGSizeMake(320, _scrollView.frame.size.height);
        }
        
        
        [groupViewCell release];
        
        
        
    } failureBlock:^(NSError *error) {
        
    }];
    
}

- (void)tap:(UITapGestureRecognizer *)tapGestureRecognizer
{
    //获取手势的视图
    GroupViewCell *groupViewCell = (GroupViewCell *)tapGestureRecognizer.view;
    
    NSLog(@"groupViewCell.title = %@", groupViewCell.title);
    
    [self.delegate showImageViewWithGroupURL:groupViewCell.groupURL];
}


@end
