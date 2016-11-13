//
//  MainViewController.m
//  分组展开
//
//  Created by chen cheng on 14-9-5.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"
#import "MyTableViewCell.h"

@interface ResultDataItem : NSObject
{
    NSString  *_name;
    NSIndexPath *_indexPath;
}

@property(copy, readwrite, nonatomic)NSString  *name;
@property(retain, readwrite, nonatomic)NSIndexPath  *indexPath;

@end

@implementation ResultDataItem

- (void)dealloc
{
    self.name = nil;
    
    self.indexPath = nil;
    
    [super dealloc];
}

@end




@interface SectionModel : NSObject
{
    BOOL             _flag;
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
    
    UIView    *_bottomLineView;
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
    
    [_bottomLineView release];
    
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
        
        [self addSubview:_numberLabel];
    
        
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = [UIColor lightGrayColor];
        
        [self addSubview:_bottomLineView];
    }
    
    return self;
}



//布局子视图的函数
- (void)layoutSubviews
{
    _imageView.frame = CGRectMake(10, 12.5, 15, self.frame.size.height-25);
    
    _titleLabel.frame = CGRectMake(_imageView.frame.origin.x + _imageView.frame.size.width+10, 0, self.frame.size.width - 100, self.frame.size.height);
    
    _numberLabel.frame = CGRectMake(self.frame.size.width - 50, 0, 50, self.frame.size.height);
    
    _bottomLineView.frame = CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width, 0.5);
}

@end





@interface MainViewController ()

@end

@implementation MainViewController

- (void)dealloc
{
    [_dataMutableArray release];
    _dataMutableArray = nil;
    
    [_resultDataMutableArray release];
    _resultDataMutableArray = nil;
    
    [_tableView release];
    _tableView = nil;
    
    [_resultTableView release];
    _resultTableView = nil;
    
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
            
            sectionModel.flag = NO;//展开的
            
            for (int j=0; j<5; j++)
            {
                [sectionModel.sectionDataMutableArray addObject:[NSString stringWithFormat:@"%c联系人%d", 'A'+i, j+1]];
            }
            
            [_dataMutableArray addObject:sectionModel];
            
            [sectionModel release];
        }
        
        _resultDataMutableArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, 320, 40)];
    
    _searchBar.delegate = self;
    
    [self.view addSubview:_searchBar];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, 320, 480-60) style:UITableViewStylePlain];

    [_tableView setSeparatorColor:[UIColor clearColor]];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    _resultTableView = [[UITableView alloc] initWithFrame:_tableView.frame style:UITableViewStylePlain];

    _resultTableView.dataSource = self;
    _resultTableView.delegate = self;
    
    
    [self.view addSubview:_tableView];
}


- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar

{
    NSLog(@"searchBarShouldBeginEditing");
    [self.view insertSubview:_resultTableView aboveSubview:_tableView];
    
    [_searchBar setShowsCancelButton:YES animated:YES];
    
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
     NSLog(@"textDidChange");
    
    [_resultDataMutableArray removeAllObjects];
    
    //搜索联系人
    NSString *keyString = searchBar.text;
    
    for (int i=0; i<[_dataMutableArray count]; i++)
    {
        SectionModel *sectionModel = [_dataMutableArray objectAtIndex:i];
        
        for (int j=0; j<[sectionModel.sectionDataMutableArray count]; j++)
        {
            NSString  *name = [sectionModel.sectionDataMutableArray objectAtIndex:j];
            

            if ([name rangeOfString:keyString].length > 0)
            {
                ResultDataItem *resultDataItem = [[ResultDataItem alloc] init];
                
                
                resultDataItem.name = name;
                resultDataItem.indexPath = [NSIndexPath indexPathForRow:j inSection:i];
                
                [_resultDataMutableArray addObject:resultDataItem];
                
                [resultDataItem release];
            }
        }
    }
    [_resultTableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_resultTableView == tableView)
    {
        ResultDataItem *resultDataItem = [_resultDataMutableArray objectAtIndex:[indexPath row]];
        
        [_searchBar resignFirstResponder];
        [_searchBar setShowsCancelButton:NO animated:YES];
        [_resultTableView removeFromSuperview];
        
         SectionModel *sectionModel = [_dataMutableArray objectAtIndex:[resultDataItem.indexPath section]];
        
        if (sectionModel.flag == NO)
        {
            
             sectionModel.flag =  !(sectionModel.flag);
            
            NSMutableArray   *indexPathsMutableArray = [[NSMutableArray alloc] init];
            
            for (int i=0; i<[sectionModel.sectionDataMutableArray count]; i++)
            {
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:[resultDataItem.indexPath section]];
                
                [indexPathsMutableArray addObject:indexPath];
            }
             [_tableView insertRowsAtIndexPaths:indexPathsMutableArray withRowAnimation:UITableViewRowAnimationFade];
        }
        NSLog(@"resultDataItem.indexPath %@",resultDataItem.indexPath);
        
        [_tableView scrollToRowAtIndexPath:resultDataItem.indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
      
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [_searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [_resultTableView removeFromSuperview];
    
    [_searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
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
    if (_tableView == tableView)
    {
        SectionHeaderView  *sectionHeaderView = [[SectionHeaderView alloc] init];
        
        sectionHeaderView.tag = section;
        
        sectionHeaderView.title = [NSString stringWithFormat:@"第%d分组",section+1];
        
        SectionModel *sectionModel = [_dataMutableArray objectAtIndex:section];
        sectionHeaderView.number = [sectionModel.sectionDataMutableArray count];
        
        sectionHeaderView.flag=sectionModel.flag;
        UITapGestureRecognizer  *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionClick:)];
        
        [sectionHeaderView addGestureRecognizer:tapGestureRecognizer];
        
        [tapGestureRecognizer release];

        return [sectionHeaderView autorelease];
    }
    else if (_resultTableView == tableView)
    {
        UILabel *label = [[UILabel alloc] init];
        label.text = @"搜索结果";
        return [label autorelease];
    }
    
    return nil;
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
    
    
    NSArray   *indexPathsArray = [indexPathsMutableArray copy];
    
    [indexPathsMutableArray release];
    
    if (sectionModel.flag)
    {
        [_tableView insertRowsAtIndexPaths:indexPathsArray withRowAnimation:UITableViewRowAnimationFade];
    }
    else
    {
        [_tableView deleteRowsAtIndexPaths:indexPathsArray withRowAnimation:UITableViewRowAnimationFade];
    }
    
    [indexPathsArray release];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_tableView == tableView)
    {
        return [_dataMutableArray count];
    }
    else if (_resultTableView == tableView)
    {
        return 1;
    }
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_tableView == tableView)
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
    }
    else if (_resultTableView == tableView)
    {
        return [_resultDataMutableArray count];
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _tableView)
    {
        static  NSString   *cellId = @"cellId";
        
        
        MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil)
        {
            cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        
        SectionModel *sectionModel = [_dataMutableArray objectAtIndex:[indexPath section]];
        
        cell.textLabel.text = [sectionModel.sectionDataMutableArray objectAtIndex:[indexPath row]];
        
        if ([sectionModel.sectionDataMutableArray count]-1
            == [indexPath row])
        {
            [cell setBottomLineLength:_tableView.bounds.size.width];
        }
        else
        {
            [cell setBottomLineLength:_tableView.bounds.size.width-20];
        }

        return cell;
    }
    else if (tableView == _resultTableView)
    {
        static  NSString   *cellId = @"cellId";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
    
        ResultDataItem *resultDataItem =  [_resultDataMutableArray objectAtIndex:[indexPath row]];
        cell.textLabel.text = resultDataItem.name;
        
        return cell;

    }
    
    return nil;
}


@end
