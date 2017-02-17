//
//  ViewController.m
//  UICollectionViewDemo1
//
//  Created by chensongqi on 16/11/10.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UICollectionViewFlowLayout *aLayout = [[UICollectionViewFlowLayout alloc] init];
    aLayout.itemSize = CGSizeMake(100, 100);
    aLayout.sectionInset = UIEdgeInsetsMake(20, 20, 5, 5);
    
    UICollectionView *aCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:aLayout];
    [self.view addSubview:aCollectionView];
    
    [aCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"DemoCell"];
    aCollectionView.delegate = self;
    aCollectionView.dataSource = self;
    aCollectionView.backgroundColor = [UIColor whiteColor];
    
    [aCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SectionHeader"];
    
    [aCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"SectionFooter"];

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DemoCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SectionHeader" forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor orangeColor];
        return headerView;
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"SectionFooter" forIndexPath:indexPath];
        footerView.backgroundColor = [UIColor yellowColor];
        return footerView;
    } else {
        return [UICollectionReusableView new];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.view.frame.size.width, 50);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(self.view.frame.size.width, 50);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath: %@",indexPath);
}

@end
