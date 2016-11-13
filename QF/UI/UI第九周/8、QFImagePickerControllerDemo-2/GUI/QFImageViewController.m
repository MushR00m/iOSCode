//
//  QFImageViewController.m
//  QFImagePickerControllerDemo
//
//  Created by chen cheng on 14-8-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFImageViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "QFImagePickerController.h"


@interface ImageItemView : UIView
{
    UIImageView  *_imageView;
    UIImageView  *_selectedImageView;
    BOOL          _selected;
    
    NSURL        *_imageURL;
    
    int           _index;
}

@property(assign, readwrite, nonatomic)int index;
@property(retain, readwrite, nonatomic)NSURL *imageURL;
@property(assign, readwrite, nonatomic)BOOL selected;

@end


@implementation ImageItemView

- (void)dealloc
{
    [_imageView release];
    _imageView = nil;
    
    
    [_selectedImageView release];
    _selectedImageView = nil;
    
    [_imageURL release];
    _imageURL = nil;
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_imageView];
        
        _selected = NO;
        _selectedImageView = [[UIImageView alloc] init];
        _selectedImageView.image = [UIImage imageNamed:@"selectedImage.png"];
        
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    _imageView.frame = self.bounds;
    _selectedImageView.frame = CGRectMake(self.frame.size.width-24, self.frame.size.height-24, 24, 24);
}

- (void)setImageURL:(NSURL *)imageURL
{
    if (imageURL == _imageURL)
    {
        return;
    }
    
    [imageURL retain];
    [_imageURL release];
    _imageURL = imageURL;
    
    
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    
    [assetsLibrary assetForURL:imageURL resultBlock:^(ALAsset *asset) {
        
        _imageView.image = [UIImage imageWithCGImage:asset.thumbnail];
        
    } failureBlock:^(NSError *error) {
        
    }];

}


- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    
    if (_selected)
    {
        [self addSubview:_selectedImageView];
    }
    else
    {
        [_selectedImageView removeFromSuperview];
    }
}

@end


@interface ImageItemTableViewCell : UITableViewCell
{
    ImageItemView   *_imageItemView1;
    ImageItemView   *_imageItemView2;
    ImageItemView   *_imageItemView3;
    ImageItemView   *_imageItemView4;
}

@property(retain, readwrite, nonatomic)ImageItemView *imageItemView1;
@property(retain, readwrite, nonatomic)ImageItemView *imageItemView2;
@property(retain, readwrite, nonatomic)ImageItemView *imageItemView3;
@property(retain, readwrite, nonatomic)ImageItemView *imageItemView4;



@end


@implementation ImageItemTableViewCell



- (void)dealloc
{
    [_imageItemView1 release];
    _imageItemView1 = nil;
    
    [_imageItemView2 release];
    _imageItemView2 = nil;
    
    [_imageItemView3 release];
    _imageItemView3 = nil;
    
    [_imageItemView4 release];
    _imageItemView4 = nil;
    
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self != nil)
    {
        _imageItemView1 = [[ImageItemView alloc] init];
        [self addSubview:_imageItemView1];
        
        
        _imageItemView2 = [[ImageItemView alloc] init];
        [self addSubview:_imageItemView2];
        
        _imageItemView3 = [[ImageItemView alloc] init];
        [self addSubview:_imageItemView3];
        
        _imageItemView4 = [[ImageItemView alloc] init];
        [self addSubview:_imageItemView4];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    CGFloat  d = 5;
    
    CGFloat  imageWidth = (self.frame.size.width-d * 3)/4.0;
    CGFloat  imageHeight = self.frame.size.height;
    
    _imageItemView1.frame = CGRectMake(0, 0, imageWidth, imageHeight);
    
    _imageItemView2.frame = CGRectMake(imageWidth + d, 0, imageWidth, imageHeight);
    
    _imageItemView3.frame = CGRectMake((imageWidth + d)*2, 0, imageWidth, imageHeight);
    
    _imageItemView4.frame = CGRectMake((imageWidth + d)*3, 0, imageWidth, imageHeight);
}

@end



//存放的是图片的信息
@interface ImageItemInfo : NSObject

@property(retain, readwrite, nonatomic)NSURL *imageURL;
@property(assign, readwrite, nonatomic)BOOL selected;

@end

@implementation ImageItemInfo

- (void)dealloc
{
    self.imageURL = nil;
    [super dealloc];
}

@end



@interface QFImageViewController ()

@end

@implementation QFImageViewController

- (void)setGroupURL:(NSURL *)groupURL
{
   /* if (groupURL == _groupURL)
    {
        return;
    }
    
    NSLog(@"_groupURL = %@", _groupURL);
    */
    [groupURL retain];
    [_groupURL release];
    _groupURL = groupURL;
    
    if ([self isViewLoaded])
    {
        //刷新照片
        [self loadAllImageInfoOnCompletion:^(BOOL flag) {
            
            [_tableView reloadData];
        }];
    }
}

- (void)dealloc
{
    [_groupURL release];
    _groupURL = nil;
    
    [_imageItemInfoMutableArray release];
    _imageItemInfoMutableArray = nil;
    
    [_tableView release];
    _tableView = nil;
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.navigationItem.title = @"选择照片";
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonClick:)] autorelease];
        
        self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight;
        
        
        _imageItemInfoMutableArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)cancelButtonClick:(id)sender
{
    [self.delegate didCancel];
}

- (void)doneButtonClick:(id)sender
{
    NSMutableArray  *imageURLMutableArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[_imageItemInfoMutableArray count]; i++)
    {
        ImageItemInfo *imageItemInfo = [_imageItemInfoMutableArray objectAtIndex:i];
        
        
        
        if (imageItemInfo.selected)
        {
            NSLog(@"addObject imageItemInfo.imageURL = %@", imageItemInfo.imageURL);
            [imageURLMutableArray addObject:imageItemInfo.imageURL];
        }
    }
    
    [self.delegate didFinishPickingWithArray:[[imageURLMutableArray copy] autorelease]];
    
    [imageURLMutableArray release];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-64)];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;

    [self.view addSubview:_tableView];
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadAllImageInfoOnCompletion:^(BOOL flag) {
        
        if (flag)
        {
            [_tableView reloadData];
        }
        else
        {
            NSLog(@"数据加载失败");
        }
    
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows = [_imageItemInfoMutableArray count] / 4;
    
    if ([_imageItemInfoMutableArray count] % 4 > 0)
    {
        numberOfRows++;
    }
    
    NSLog(@"numberOfRows = %d", numberOfRows);
    
    return numberOfRows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (_tableView.frame.size.width-15)/4.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString  *cellId = @"cellId";
    
    NSLog(@"cellForRowAtIndexPath");
    
    ImageItemTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil)
    {
        cell = [[ImageItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
        UITapGestureRecognizer  *tapGestureRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [cell.imageItemView1 addGestureRecognizer:tapGestureRecognizer1];
        [tapGestureRecognizer1 release];
        
        UITapGestureRecognizer  *tapGestureRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [cell.imageItemView2 addGestureRecognizer:tapGestureRecognizer2];
        [tapGestureRecognizer2 release];
        
        UITapGestureRecognizer  *tapGestureRecognizer3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [cell.imageItemView3 addGestureRecognizer:tapGestureRecognizer3];
        [tapGestureRecognizer3 release];
       
        UITapGestureRecognizer  *tapGestureRecognizer4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [cell.imageItemView4 addGestureRecognizer:tapGestureRecognizer4];
        [tapGestureRecognizer4 release];
        
    }
    
    
    if ([indexPath row]*4 < [_imageItemInfoMutableArray count])
    {
        ImageItemInfo  *imageItemInfo1 = [_imageItemInfoMutableArray objectAtIndex:[indexPath row]*4];
        
        NSLog(@"imageItemInfo1 = %@", imageItemInfo1);
        
        cell.imageItemView1.imageURL = imageItemInfo1.imageURL;
        cell.imageItemView1.selected = imageItemInfo1.selected;
        
        cell.imageItemView1.index = [indexPath row]*4;

    }
    else
    {
        cell.imageItemView1.imageURL = nil;
        cell.imageItemView1.userInteractionEnabled = NO;
    }

    
    
    if ([indexPath row]*4 + 1 < [_imageItemInfoMutableArray count])
    {
        ImageItemInfo  *imageItemInfo2 = [_imageItemInfoMutableArray objectAtIndex:[indexPath row]*4 + 1];
        cell.imageItemView2.imageURL = imageItemInfo2.imageURL;
        cell.imageItemView2.selected = imageItemInfo2.selected;
        
        cell.imageItemView2.index = [indexPath row]*4 + 1;
    }
    else
    {
        cell.imageItemView2.imageURL = nil;
        cell.imageItemView2.userInteractionEnabled = NO;
    }

    
    if ([indexPath row]*4 + 2 < [_imageItemInfoMutableArray count])
    {
        ImageItemInfo  *imageItemInfo3 = [_imageItemInfoMutableArray objectAtIndex:[indexPath row]*4 + 2];
        cell.imageItemView3.imageURL = imageItemInfo3.imageURL;
        cell.imageItemView3.selected = imageItemInfo3.selected;
        
        cell.imageItemView3.index = [indexPath row]*4 + 2;

    }else
    {
        cell.imageItemView3.imageURL = nil;
        cell.imageItemView3.userInteractionEnabled = NO;
    }

    
    
    if ([indexPath row]*4 + 3 < [_imageItemInfoMutableArray count])
    {
        ImageItemInfo  *imageItemInfo4 = [_imageItemInfoMutableArray objectAtIndex:[indexPath row]*4 + 3];
        cell.imageItemView4.imageURL = imageItemInfo4.imageURL;
        cell.imageItemView4.selected = imageItemInfo4.selected;
        
        cell.imageItemView4.index = [indexPath row]*4 + 3;

    }
    else
    {
        cell.imageItemView4.imageURL = nil;
        cell.imageItemView4.userInteractionEnabled = NO;
    }
        
    

    return cell;
}


- (void)tap:(UITapGestureRecognizer  *)tapGestureRecognizer
{
    ImageItemView  *imageItemView = (ImageItemView *)tapGestureRecognizer.view;
    
    //改变视图的显示
    imageItemView.selected = !(imageItemView.selected);
    
    //更新model里面现有的数据
    ImageItemInfo * imageItemInfo = [_imageItemInfoMutableArray objectAtIndex:imageItemView.index];
    
    
    NSLog(@"[_imageItemInfoMutableArray count] = %d", [_imageItemInfoMutableArray count]);
    
    NSLog(@"imageItemView.index = %d", imageItemView.index);
    
    imageItemInfo.selected = imageItemView.selected;
    
    
    int numberOfSelectedImage = 0;
    
    for (int i=0; i<[_imageItemInfoMutableArray count]; i++)
    {
        ImageItemInfo *imageItemInfo = [_imageItemInfoMutableArray objectAtIndex:i];
        if (imageItemInfo.selected)
        {
            numberOfSelectedImage++;
        }
    }
    
    NSLog(@"numberOfSelectedImage = %d", numberOfSelectedImage);
    
    if (numberOfSelectedImage > 0)
    {
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonClick:)] autorelease];
    }
    else
    {
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonClick:)] autorelease];
    }

}


/**
 *  异步的去加载所有照片的信息 当加载完成后  会回调completion块对象
 *
 *  @param completion 回调的代码块
 */
- (void)loadAllImageInfoOnCompletion:(void (^)(BOOL flag))completion
{
    NSLog(@"loadAllImage self.groupURL = %@", self.groupURL);
   
    
    
    [_imageItemInfoMutableArray removeAllObjects];

    
    
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    
    [assetsLibrary groupForURL:self.groupURL resultBlock:^(ALAssetsGroup *group) {
        
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            
            if (result == nil)
            {
                
                NSLog(@"[_imageItemInfoMutableArray count] = %d", [_imageItemInfoMutableArray count]);
                
                if (completion != nil)
                {
                    completion(YES);
                }
                
                return;
            }
            

            ImageItemInfo *imageItemInfo = [[ImageItemInfo alloc] init];
            
            imageItemInfo.imageURL = [result valueForProperty:ALAssetPropertyAssetURL];
            imageItemInfo.selected = NO;
            
            [_imageItemInfoMutableArray addObject:imageItemInfo];
            
            [imageItemInfo release];
        
        }];
        
    } failureBlock:^(NSError *error) {
        
    }];
    
    [assetsLibrary release];
}


@end
