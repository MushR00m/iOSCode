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


@interface GroupInfoCell : UITableViewCell
{
    UIImageView   *_imageView;
    UILabel       *_titleLabel;
    UILabel       *_numberOfImageLabel;
    NSURL         *_groupURL;
}

@property(retain, readwrite, nonatomic)UIImage *image;
@property(retain, readwrite, nonatomic)NSString *title;
@property(assign, readwrite, nonatomic)int numberOfImage;


@end

@implementation GroupInfoCell

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


- (void)dealloc
{
    [_imageView release];
    [_titleLabel release];
    [_numberOfImageLabel release];
    [_groupURL release];
    
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self != nil)
    {
        _imageView = [[UIImageView alloc] init];
        
        [self addSubview:_imageView];
        
        _titleLabel = [[UILabel alloc] init];
        
        [self addSubview:_titleLabel];
        
        
        _numberOfImageLabel = [[UILabel alloc] init];
        
        [self addSubview:_numberOfImageLabel];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    _imageView.frame = CGRectMake(0, 0, 100, self.frame.size.height);
    
    _titleLabel.frame = CGRectMake(_imageView.frame.origin.x + _imageView.frame.size.width + 10, self.frame.size.height/2.0 - 40, 200, 40);
    
    _numberOfImageLabel.frame = CGRectMake(_imageView.frame.origin.x + _imageView.frame.size.width + 10, self.frame.size.height/2.0, 200, 40);
}


@end


@interface GroupInfo : NSObject
{
    NSURL   *_groupURL;
    UIImage   *_posterImage;
    NSString  *_groupName;
    NSInteger  _numberOfAssets;
}

@property(retain, readwrite, nonatomic)NSURL *groupURL;
@property(retain, readwrite, nonatomic)UIImage *posterImage;
@property(copy, readwrite, nonatomic)NSString *groupName;
@property(assign, readwrite, nonatomic)NSInteger numberOfAssets;

@end

@implementation GroupInfo

- (void)dealloc
{
    self.groupURL = nil;
    self.posterImage = nil;
    self.groupName = nil;
    
    [super dealloc];
}

@end





@interface QFGroupViewController ()

@end

@implementation QFGroupViewController

- (void)dealloc
{
    [_tableView release];
    _tableView  = nil;
    
    [_groupInfoMutableArray release];
    _groupInfoMutableArray = nil;

    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.navigationItem.title = @"选择相册";
        
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonClick:)] autorelease];
        
        self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight;
        
        _groupInfoMutableArray = [[NSMutableArray alloc] init];
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
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-64)];
    
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    
    [self.view addSubview:_tableView];
    
    [self loadAllGroupInfoOnCompletion:^(BOOL flag) {
        
        if (flag)
        {
            [_tableView reloadData];
        }
    }];
}

/**
 *  异步的去加载所有相册的信息 当加载完成后  会回调completion块对象
 *
 *  @param completion 回调的代码块
 */
- (void)loadAllGroupInfoOnCompletion:(void (^)(BOOL flag))completion
{
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        if (group == nil)
        {
            
            if (completion != nil)
            {
                completion(YES);
            }
            
            return ;
        }
        
        GroupInfo *groupInfo = [[GroupInfo alloc] init];
        
        groupInfo.groupURL = [group valueForProperty:ALAssetsGroupPropertyURL];
        
        
        groupInfo.posterImage = [UIImage imageWithCGImage:group.posterImage];
        
        groupInfo.groupName = [group valueForProperty:ALAssetsGroupPropertyName];
        
        groupInfo.numberOfAssets = group.numberOfAssets;
        
        
        
        [_groupInfoMutableArray addObject:groupInfo];
        
        [groupInfo release];
        
    } failureBlock:^(NSError *error) {
        
        if (completion != nil)
        {
            completion(NO);
        }

    }];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_groupInfoMutableArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString   *cellId = @"cellId";
    
    GroupInfoCell   *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil)
    {
        cell = [[[GroupInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] autorelease];
    }
    
    GroupInfo   *groupInfo = [_groupInfoMutableArray objectAtIndex:[indexPath row]];
    
    cell.image = groupInfo.posterImage;
    cell.title = groupInfo.groupName;
    cell.numberOfImage = groupInfo.numberOfAssets;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GroupInfo  *groupInfo = [_groupInfoMutableArray objectAtIndex:[indexPath row]];
    
    NSLog(@"22 groupInfo.groupURL = %@", groupInfo.groupURL);
    
    [self.delegate showImageViewWithGroupURL:groupInfo.groupURL];
}



@end
