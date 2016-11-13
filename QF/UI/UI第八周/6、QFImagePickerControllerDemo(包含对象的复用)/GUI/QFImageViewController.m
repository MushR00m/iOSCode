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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_imageView];
        
        _selected = NO;
        _selectedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width-24, frame.size.height-24, 24, 24)];
        _selectedImageView.image = [UIImage imageNamed:@"selectedImage.png"];
    }
    
    return self;
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
            
            [self updateImageItemView];
        }];
    }
}

- (void)dealloc
{
    [_groupURL release];
    _groupURL = nil;
    
    [_imageViewMutableArray release];
    _imageViewMutableArray = nil;
    
    [_imageViewInfoMutableArray release];
    _imageViewInfoMutableArray = nil;
    
    [_scrollView release];
    _scrollView = nil;
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight;

        self.navigationItem.title = @"选择照片";
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonClick:)] autorelease];
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
    
    for (int i=0; i<[_imageViewInfoMutableArray count]; i++)
    {
        ImageItemInfo *imageItemInfo = [_imageViewInfoMutableArray objectAtIndex:i];
        
        if (imageItemInfo.selected)
        {
            [imageURLMutableArray addObject:imageItemInfo.imageURL];
        }
    }
    
    [self.delegate didFinishPickingWithArray:[[imageURLMutableArray copy] autorelease]];
    
    [imageURLMutableArray release];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _imageViewMutableArray = [[NSMutableArray alloc] init];
    
    _imageViewInfoMutableArray = [[NSMutableArray alloc] init];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    _scrollView.alwaysBounceVertical = YES;
    

    _scrollView.delegate = self;
    
    [self.view addSubview:_scrollView];
    
    //创建4 * 7 = 28张照片
    for (int i=0; i<28; i++)
    {
        ImageItemView  *imageView = [[ImageItemView alloc] initWithFrame:CGRectMake((i % 4)*80, (i / 4) * 80, 80, 80)];
        
        imageView.index = i;
        
        imageView.layer.borderColor = [UIColor blackColor].CGColor;
        imageView.layer.borderWidth = 1;
        
        UITapGestureRecognizer  *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        
        [imageView addGestureRecognizer:tapGestureRecognizer];
        
        [tapGestureRecognizer release];
        
        [_imageViewMutableArray addObject:imageView];

        
        [imageView release];
    }
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadAllImageInfoOnCompletion:^(BOOL flag) {
        
        NSLog(@"图片信息加载完成");
        [self updateImageItemView];
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static CGFloat oldOffsetY = 0;
    
    CGFloat newOffsetY = scrollView.contentOffset.y;
    
    if (newOffsetY - oldOffsetY > 80)
    {
        oldOffsetY = newOffsetY;//更新老得偏移量
        //把数组的前面4张照片放到最后
        for (int i=0; i<4; i++)
        {
            ImageItemView  *imageItemView = [_imageViewMutableArray objectAtIndex:i];
            
            imageItemView.index += 28;
        }
        
        [_imageViewMutableArray sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            
            ImageItemView *imageItemView1 = obj1;
            ImageItemView *imageItemView2 = obj2;
            
            if (imageItemView1.index == imageItemView2.index)
            {
                return NSOrderedSame;
            }
            else if (imageItemView1.index < imageItemView2.index)
            {
                return NSOrderedAscending;
            }
            else
            {
                return NSOrderedDescending;
            }
        }];
        
        //重新刷新显示
        [self  updateImageItemView];
    }
    else if (oldOffsetY - newOffsetY > 80)
    {
        oldOffsetY = newOffsetY;//更新老得偏移量
        //把数组的最后4张照片放到最前面
        for (int i=[_imageViewMutableArray count]-1; i>=[_imageViewMutableArray count]-4; i--)
        {
            ImageItemView  *imageItemView = [_imageViewMutableArray objectAtIndex:i];
            
            imageItemView.index -= 28;
        }
        
        
        [_imageViewMutableArray sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            
            ImageItemView *imageItemView1 = obj1;
            ImageItemView *imageItemView2 = obj2;
            
            if (imageItemView1.index == imageItemView2.index)
            {
                return NSOrderedSame;
            }
            else if (imageItemView1.index < imageItemView2.index)
            {
                return NSOrderedAscending;
            }
            else
            {
                return NSOrderedDescending;
            }
            
        }];
        
        //重新刷新显示
        [self  updateImageItemView];
    }
}

//重新刷新显示照片
- (void)updateImageItemView
{
    for (int i=0; i<[_imageViewMutableArray count]; i++)
    {
        ImageItemView  *imageItemView = [_imageViewMutableArray objectAtIndex:i];
        
        if (imageItemView.index < 0 || imageItemView.index >= [_imageViewInfoMutableArray count])
        {
            //[imageItemView removeFromSuperview];
            continue;
        }
        
        ImageItemInfo  *imageViewInfo = [_imageViewInfoMutableArray objectAtIndex:imageItemView.index];
        
        imageItemView.imageURL = imageViewInfo.imageURL;
        imageItemView.selected = imageViewInfo.selected;
        
        //数组里面第i张照片  就是   所有照片中的第(index + i)张照片
        imageItemView.frame = CGRectMake((imageItemView.index % 4) * 80, (imageItemView.index / 4) * 80, 80, 80);
        
        [_scrollView addSubview:imageItemView];
    }
}


/**
 *  异步的去加载所有照片的信息 当加载完成后  会回调completion块对象
 *
 *  @param completion 回调的代码块
 */
- (void)loadAllImageInfoOnCompletion:(void (^)(BOOL flag))completion
{
    NSLog(@"loadAllImage");
    
    
    //把28张照片从父视图中移除 （不予显示）
    for (int i=0; i<[_imageViewMutableArray count]; i++)
    {
        ImageItemView *imageView = [_imageViewMutableArray objectAtIndex:i];
        imageView.imageURL = nil;
        imageView.selected = NO;
        
        [imageView removeFromSuperview];
    }
    
    //情况图片信息数组
    [_imageViewInfoMutableArray removeAllObjects];
    
    
    
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    
    [assetsLibrary groupForURL:self.groupURL resultBlock:^(ALAssetsGroup *group) {
        
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            
            if (result == nil)
            {
                //当所有照片枚举结束/*****************************************/
                CGFloat contentHeight = ([_imageViewInfoMutableArray count] / 4) * 80;
                
                NSLog(@"[_imageViewInfoMutableArray count] = %d", [_imageViewInfoMutableArray count]);
                
                if (contentHeight > _scrollView.frame.size.height)
                {
                    _scrollView.contentSize = CGSizeMake(320, contentHeight);
                }
                else
                {
                    
                    
                    _scrollView.contentSize = CGSizeMake(320, _scrollView.frame.size.height);
                }
                
                if (completion != nil)
                {
                    completion(YES);
                }
                
                return;
            }
            

            ImageItemInfo *imageItemInfo = [[ImageItemInfo alloc] init];
            
            imageItemInfo.imageURL = [result valueForProperty:ALAssetPropertyAssetURL];
            imageItemInfo.selected = NO;
            
            [_imageViewInfoMutableArray addObject:imageItemInfo];
            
            [imageItemInfo release];
            

           /* ImageItemView *imageView = [[ImageItemView alloc] initWithFrame:CGRectMake((index%4 * 80), index/4 * 80, 80, 80)];
            
            imageView.imageURL = [result valueForProperty:ALAssetPropertyAssetURL];
            
            [_imageViewMutableArray addObject:imageView];
            
            imageView.image = [UIImage imageWithCGImage:result.thumbnail];
            
            
            UITapGestureRecognizer  *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
            
            [imageView addGestureRecognizer:tapGestureRecognizer];
            
            [tapGestureRecognizer release];
            
            [_scrollView addSubview:imageView];
            
            [imageView release];*/
            
        }];
        
    } failureBlock:^(NSError *error) {
        
    }];
    
    [assetsLibrary release];
}

- (void)tap:(UITapGestureRecognizer *)tapGestureRecognizer
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
}

@end
