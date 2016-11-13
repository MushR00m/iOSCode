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
}

@property(retain, readwrite, nonatomic)UIImage *image;
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


- (void)setImage:(UIImage *)image
{
    _imageView.image = image;
}

- (UIImage *)image
{
    return _imageView.image;
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
        [self loadAllImage];
    }
}

- (void)dealloc
{
    [_groupURL release];
    _groupURL = nil;
    
    [_imageViewMutableArray release];
    _imageViewMutableArray = nil;
    
    [_scrollView release];
    _scrollView = nil;
    
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.navigationItem.title = @"选择照片";
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonClick:)] autorelease];
    }
    return self;
}

- (void)cancelButtonClick:(id)sender
{
   // [self.delegate didCancel];
    [self.navigationController popViewControllerAnimated:YES];
     }

- (void)doneButtonClick:(id)sender
{
    NSMutableArray  *imageURLMutableArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[_imageViewMutableArray count]; i++)
    {
        ImageItemView *imageView = [_imageViewMutableArray objectAtIndex:i];
        
        if (imageView.selected)
        {
            [imageURLMutableArray addObject:imageView.imageURL];
        }
    }
    
    [self.delegate didFinishPickingWithArray:[[imageURLMutableArray copy] autorelease]];
    
    [imageURLMutableArray release];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _imageViewMutableArray = [[NSMutableArray alloc] init];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-64)];
    _scrollView.alwaysBounceVertical = YES;
    /************************************************************/
    //_scrollView.contentSize = CGSizeMake(320, 2*self.view.frame.size.height);
    [self.view addSubview:_scrollView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadAllImage];
    
}

- (void)loadAllImage
{
    NSLog(@"loadAllImage");
    
    
    for (int i=0; i<[_imageViewMutableArray count]; i++)
    {
        ImageItemView *imageView = [_imageViewMutableArray objectAtIndex:i];
        [imageView removeFromSuperview];
    }
    [_imageViewMutableArray removeAllObjects];
    
    
    
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    
    [assetsLibrary groupForURL:self.groupURL resultBlock:^(ALAssetsGroup *group) {
        
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            
            if (result == nil)
            {
                return;
            }
            

            ImageItemView *imageView = [[ImageItemView alloc] initWithFrame:CGRectMake((index%4 * 80), index/4 * 80, 80, 80)];
            
            imageView.imageURL = [result valueForProperty:ALAssetPropertyAssetURL];
            
            [_imageViewMutableArray addObject:imageView];
            
            imageView.image = [UIImage imageWithCGImage:result.thumbnail];
            
            
            UITapGestureRecognizer  *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
            
            [imageView addGestureRecognizer:tapGestureRecognizer];
            
            [tapGestureRecognizer release];
            
            [_scrollView addSubview:imageView];
            
            [imageView release];
            
        }];
        
    } failureBlock:^(NSError *error) {
        
    }];
    
    [assetsLibrary release];
}

- (void)tap:(UITapGestureRecognizer *)tapGestureRecognizer
{
    ImageItemView *imageView = (ImageItemView *)(tapGestureRecognizer.view);
    
    imageView.selected =  !(imageView.selected);
    
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
