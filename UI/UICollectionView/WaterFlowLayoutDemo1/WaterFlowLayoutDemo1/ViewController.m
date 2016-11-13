//
//  ViewController.m
//  WaterFlowLayoutDemo1
//
//  Created by chensongqi on 16/11/11.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"
#import "SomeCollectionViewLayout.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *aCollectionView;

@property (nonatomic, strong) SomeCollectionViewLayout *aLayout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.aLayout = [[SomeCollectionViewLayout alloc] init];

    self.aCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.aLayout];
    
    [self.aCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"DemoCell"];
    self.aCollectionView.delegate = self;
    self.aCollectionView.dataSource = self;

    self.aCollectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.aCollectionView];

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

@end
