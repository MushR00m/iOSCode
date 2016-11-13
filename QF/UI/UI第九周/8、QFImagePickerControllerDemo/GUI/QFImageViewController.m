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
        
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        
        [self addGestureRecognizer:tapGestureRecognizer];
        
        [tapGestureRecognizer release];
    }
    
    return self;
}

- (void)tap:(UITapGestureRecognizer *)tapGestureRecognizer
{
    self.selected = !(self.selected);
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

@property(retain, readwrite, nonatomic)NSURL *imageURL1;
@property(retain, readwrite, nonatomic)NSURL *imageURL2;
@property(retain, readwrite, nonatomic)NSURL *imageURL3;
@property(retain, readwrite, nonatomic)NSURL *imageURL4;

@property(assign, readwrite, nonatomic)BOOL selected1;
@property(assign, readwrite, nonatomic)BOOL selected2;
@property(assign, readwrite, nonatomic)BOOL selected3;
@property(assign, readwrite, nonatomic)BOOL selected4;

@end


@implementation ImageItemTableViewCell

- (void)setImageURL1:(NSURL *)imageURL1
{
    _imageItemView1.imageURL = imageURL1;
}

- (NSURL *)imageURL1
{
    return _imageItemView1.imageURL;
}


- (void)setImageURL2:(NSURL *)imageURL2
{
    _imageItemView2.imageURL = imageURL2;
}

- (NSURL *)imageURL2
{
    return _imageItemView2.imageURL;
}


- (void)setImageURL3:(NSURL *)imageURL3
{
    _imageItemView3.imageURL = imageURL3;
}

- (NSURL *)imageURL3
{
    return _imageItemView3.imageURL;
}

- (void)setImageURL4:(NSURL *)imageURL4
{
    _imageItemView4.imageURL = imageURL4;
}

- (NSURL *)imageURL4
{
    return _imageItemView4.imageURL;
}


- (void)setSelected1:(BOOL)selected1
{
    _imageItemView1.selected = selected1;
}

- (BOOL)selected1
{
    return _imageItemView1.selected;
}

- (void)setSelected2:(BOOL)selected2
{
    _imageItemView2.selected = selected2;
}

- (BOOL)selected2
{
    return _imageItemView2.selected;
}

- (void)setSelected3:(BOOL)selected1
{
    _imageItemView3.selected = selected1;
}

- (BOOL)selected3
{
    return _imageItemView3.selected;
}

- (void)setSelected4:(BOOL)selected4
{
    _imageItemView1.selected = selected4;
}

- (BOOL)selected4
{
    return _imageItemView4.selected;
}



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
    if (groupURL == _groupURL)
    {
        return;
    }
    
    NSLog(@"_groupURL = %@", _groupURL);
    
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
  /*  NSMutableArray  *imageURLMutableArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[_imageViewInfoMutableArray count]; i++)
    {
        ImageItemInfo *imageItemInfo = [_imageViewInfoMutableArray objectAtIndex:i];
        
        if (imageItemInfo.selected)
        {
            [imageURLMutableArray addObject:imageItemInfo.imageURL];
        }
    }
    
    [self.delegate didFinishPickingWithArray:[[imageURLMutableArray copy] autorelease]];
    
    [imageURLMutableArray release];*/
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    
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
    }
    
    
    if ([indexPath row]*4 < [_imageItemInfoMutableArray count])
    {
        ImageItemInfo  *imageItemInfo1 = [_imageItemInfoMutableArray objectAtIndex:[indexPath row]*4];
        
        NSLog(@"imageItemInfo1 = %@", imageItemInfo1);
        
        cell.imageURL1 = imageItemInfo1.imageURL;
        cell.selected1 = imageItemInfo1.selected;

    }
    
    
    if ([indexPath row]*4 + 1 < [_imageItemInfoMutableArray count])
    {
        ImageItemInfo  *imageItemInfo2 = [_imageItemInfoMutableArray objectAtIndex:[indexPath row]*4 + 1];
        cell.imageURL2 = imageItemInfo2.imageURL;
        cell.selected2 = imageItemInfo2.selected;
    }
    
    if ([indexPath row]*4 + 2 < [_imageItemInfoMutableArray count])
    {
        ImageItemInfo  *imageItemInfo3 = [_imageItemInfoMutableArray objectAtIndex:[indexPath row]*4 + 2];
        cell.imageURL3 = imageItemInfo3.imageURL;
        cell.selected3 = imageItemInfo3.selected;
    }
    
    
    if ([indexPath row]*4 + 3 < [_imageItemInfoMutableArray count])
    {
        ImageItemInfo  *imageItemInfo4 = [_imageItemInfoMutableArray objectAtIndex:[indexPath row]*4 + 3];
        cell.imageURL4 = imageItemInfo4.imageURL;
        cell.selected4 = imageItemInfo4.selected;
    }

    return cell;
}



/**
 *  异步的去加载所有照片的信息 当加载完成后  会回调completion块对象
 *
 *  @param completion 回调的代码块
 */
- (void)loadAllImageInfoOnCompletion:(void (^)(BOOL flag))completion
{
    NSLog(@"loadAllImage self.groupURL = %@", self.groupURL);
    
    
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

/*- (void)tap:(UITapGestureRecognizer *)tapGestureRecognizer
{
    ImageItemView *imageView = (ImageItemView *)(tapGestureRecognizer.view);
    
    imageView.selected =  !(imageView.selected);
    
    
    //把是否被选择的信息保存到  图片信息数组里面去
    ImageItemInfo *imageInfo = [_imageViewInfoMutableArray objectAtIndex:imageView.index];
    
    imageInfo.selected = imageView.selected;
    
    
    int numberOfSelectedImage = 0;
    
    for (int i=0; i<[_imageViewMutableArray count]; i++)
    {
        imageView = [_imageViewMutableArray objectAtIndex:i];
        if (imageView.selected)
        {
            numberOfSelectedImage++;
        }
    }
    
    if (numberOfSelectedImage > 0)
    {
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonClick:)] autorelease];
    }
    else
    {
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonClick:)] autorelease];
    }
}*/

@end
