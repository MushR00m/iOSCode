//
//  MainViewController.m
//  TabelView横向展示
//
//  Created by chen cheng on 14-9-9.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainViewController.h"
#import "PhotoImageTableViewCell.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"NSHomeDirectory() = %@", NSHomeDirectory());
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width) style:UITableViewStylePlain];
    
    _tableView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, [UIScreen mainScreen].bounds.size.height/2.0);
    
    _tableView.layer.borderColor = [UIColor blackColor].CGColor;
    _tableView.layer.borderWidth = 1;
    
    [_tableView setSeparatorColor:[UIColor blackColor]];

    
    _tableView.layer.transform = CATransform3DMakeRotation(90.0 /180.0 * 3.1415926, 0, 0, 1);
    
    

    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    _tableView.pagingEnabled = YES;
    
    [_tableView setSeparatorColor:[UIColor clearColor]];
    
    [self.view addSubview:_tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UIScreen mainScreen].bounds.size.width;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 17;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    
    PhotoImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil)
    {
        cell = [[[PhotoImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] autorelease];
    }
    
    cell.photoImage = [UIImage imageWithContentsOfFile:[NSString  stringWithFormat:@"%@/Documents/%d.jpg", NSHomeDirectory(), [indexPath row]+1]];
    
    return cell;
}


@end
