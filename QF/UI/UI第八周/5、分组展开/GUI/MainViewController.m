//
//  MainViewController.m
//  分组展开
//
//  Created by chen cheng on 14-9-5.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"


@interface SectionModel : NSObject
{
    BOOL            _flag;
    NSMutableArray  *_sectionDataMutableArray;
}

@property(assign, readwrite, nonatomic)BOOL flag;
@property(readonly, nonatomic)NSMutableArray *sectionDataMutableArray;

@end

@implementation SectionModel

- (void)dealloc
{
    [_sectionDataMutableArray release];
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        _sectionDataMutableArray = [[NSMutableArray alloc] init];
    }
    return self;
}

@end





@interface SectionHeaderView : UIView
{
    UIImageView *_imageView;
    
    UILabel   *_titleLabel;
    
    UILabel   *_numberLabel;
    
    BOOL            _flag;
}
@property(assign, readwrite, nonatomic)BOOL flag;
@property(retain, readwrite, nonatomic)NSString  *title;
@property(assign, readwrite, nonatomic)int  number;

@end

@implementation SectionHeaderView

- (void)setFlag:(BOOL)flag
{
    _flag = flag;
    
    if (_flag)
    {
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            _imageView.layer.transform = CATransform3DIdentity;
            
        } completion:^(BOOL finished) {
            
        }];
    }
    else
    {
        
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            _imageView.layer.transform = CATransform3DMakeRotation(-90 * 3.1415926 / 180.0, 0, 0, 1);
            
        } completion:^(BOOL finished) {
            
        }];

        
    }
}

- (void)setTitle:(NSString *)title
{
    _titleLabel.text = title;
}

- (NSString *)title
{
    return _titleLabel.text;
}

- (void)setNumber:(int)number
{
    _numberLabel.text = [NSString stringWithFormat:@"%d", number];
}

- (int)number
{
    return [_numberLabel.text intValue];
}


- (void)dealloc
{
    [_imageView release];
    
    [_titleLabel release];
    
    [_numberLabel release];
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        self.backgroundColor = [UIColor whiteColor];
        
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back_normal.png"]];
        
        
        [self addSubview:_imageView];
        
        _titleLabel = [[UILabel alloc] init];
        
        _titleLabel.textColor = [UIColor blackColor];
        
        [self addSubview:_titleLabel];
        
        
        _numberLabel = [[UILabel alloc] init];
        
        _numberLabel.textColor = [UIColor blackColor];
        
        _numberLabel.textAlignment = NSTextAlignmentRight;
        
        [self addSubview:_numberLabel];
    }
    
    return self;
}



//布局子视图的函数
- (void)layoutSubviews
{
    _imageView.frame = CGRectMake(10, 15, 10, self.frame.size.height-30);
    
    _titleLabel.frame = CGRectMake(_imageView.frame.origin.x + _imageView.frame.size.width+10, 0, self.frame.size.width - 100, self.frame.size.height);
    
    _numberLabel.frame = CGRectMake(self.frame.size.width-50, 0, 40, self.frame.size.height);
}

@end





@interface MainViewController ()

@end

@implementation MainViewController

- (void)dealloc
{
    [_dataMutableArray release];
    _dataMutableArray = nil;
    
    [_tableView release];
    _tableView = nil;
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        _dataMutableArray = [[NSMutableArray alloc] init];
        
    
        for (int i=0; i<6; i++)
        {
            
            SectionModel *sectionModel = [[SectionModel alloc] init];
            
            [sectionModel.sectionDataMutableArray addObject:[NSString stringWithFormat:@"第%d组",i+1]];
            

            
            sectionModel.flag = YES;//展开的
            
            for (int j=0; j<10; j++)
            {
                [sectionModel.sectionDataMutableArray addObject:[NSString stringWithFormat:@"联系人%d",j+1]];
            }
            
            [_dataMutableArray addObject:sectionModel];
            
            [sectionModel release];
        }
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 30, 300, 400) style:UITableViewStylePlain];
    
    _tableView.layer.borderColor = [UIColor blackColor].CGColor;
    _tableView.layer.borderWidth = 1;
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    
    [self.view addSubview:_tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SectionHeaderView  *sectionHeaderView = [[SectionHeaderView alloc] init];
    
    sectionHeaderView.tag = section;
    
    sectionHeaderView.title = [NSString stringWithFormat:@"第%d组",section+1];
    
    sectionHeaderView.layer.borderColor = [UIColor grayColor].CGColor;
    sectionHeaderView.layer.borderWidth = 1;
    
    SectionModel *sectionModel = [_dataMutableArray objectAtIndex:section];
    
    sectionHeaderView.number = [sectionModel.sectionDataMutableArray count];
    
    NSLog(@"sectionHeaderView.number = %d",sectionHeaderView.number);
    
    sectionHeaderView.flag = sectionModel.flag;/*************************/
    
    UITapGestureRecognizer  *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionClick:)];
    
    [sectionHeaderView addGestureRecognizer:tapGestureRecognizer];
    
    [tapGestureRecognizer release];
    
    
    
    return [sectionHeaderView autorelease];
}

- (void)sectionClick:(UITapGestureRecognizer  *)tapGestureRecognizer
{
    SectionHeaderView  *sectionHeaderView = (SectionHeaderView *)tapGestureRecognizer.view;
    NSLog(@"第%d个分段单击了", sectionHeaderView.tag);
    
    SectionModel * sectionModel = [_dataMutableArray objectAtIndex:sectionHeaderView.tag];
    
    sectionModel.flag =  !(sectionModel.flag);
    
    sectionHeaderView.flag = sectionModel.flag;
    
    NSMutableArray   *indexPathsMutableArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[sectionModel.sectionDataMutableArray count]; i++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:sectionHeaderView.tag];
        
        [indexPathsMutableArray addObject:indexPath];
    }
    
    
    //NSArray   *indexPathsArray = [indexPathsMutableArray copy];
    
    //[indexPathsMutableArray release];
    
    if (sectionModel.flag)
    {
        [_tableView insertRowsAtIndexPaths:indexPathsMutableArray withRowAnimation:UITableViewRowAnimationFade];
    }
    else
    {
        [_tableView deleteRowsAtIndexPaths:indexPathsMutableArray withRowAnimation:UITableViewRowAnimationFade];
    }
    
    [indexPathsMutableArray release];
    
    //[_tableView reloadData];//刷新表视图
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_dataMutableArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SectionModel *sectionModel = [_dataMutableArray objectAtIndex:section];
    
    if (sectionModel.flag)
    {
        return [sectionModel.sectionDataMutableArray count];
    }
    else
    {
        return 0;
    }
    
   // return [sectionModel.sectionDataMutableArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString   *cellId = @"cellId";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }

    SectionModel *sectionModel = [_dataMutableArray objectAtIndex:[indexPath section]];
    
    cell.textLabel.text = [sectionModel.sectionDataMutableArray objectAtIndex:[indexPath row]];
    
    
    return cell;
}


@end
