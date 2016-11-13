//
//  SomeCollectionViewLayout.m
//  WaterFlowLayoutDemo1
//
//  Created by chensongqi on 16/11/11.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "SomeCollectionViewLayout.h"

#define KCollectionW self.collectionView.frame.size.width


/** 每一行之间的间距 */
static const CGFloat KDefaultRowMargin = 10;
/** 每一列之间的间距 */
static const CGFloat KDefaultColumnMargin = 10;
/** 每一列之间的间距 top, left, bottom, right */
static const UIEdgeInsets KDefaultInsets = {10, 10, 10, 10};
/** 默认的列数 */
static const int KDefaultColumsCount = 3;


@interface SomeCollectionViewLayout ()

@property (nonatomic, strong) NSMutableArray *colunmMaxArray;
@property (nonatomic, strong) NSMutableArray *attrsArray;

@end

@implementation SomeCollectionViewLayout

- (NSMutableArray *)colunmMaxArray
{
    if (!_colunmMaxArray) {
        _colunmMaxArray = [[NSMutableArray alloc] init];
    }
    return _colunmMaxArray;
}

- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [[NSMutableArray alloc] init];
    }
    return _attrsArray;
}

/**
 * 决定了collectionView的contentSize
 */
- (CGSize)collectionViewContentSize
{
    // 找出最长那一列的最大Y值
    CGFloat destMaxY = [self.colunmMaxArray[0] doubleValue];
    for (NSUInteger i = 1; i<self.colunmMaxArray.count; i++) {
        // 取出第i列的最大Y值
        CGFloat columnMaxY = [self.colunmMaxArray[i] doubleValue];
        
        // 找出数组中的最大值
        if (destMaxY < columnMaxY) {
            destMaxY = columnMaxY;
        }
    }
    return CGSizeMake(0, destMaxY + KDefaultInsets.bottom);
}

- (void)prepareLayout
{
    [super prepareLayout];
    //重置最大Y值
    [self.colunmMaxArray removeAllObjects];
    for (NSInteger i = 0; i < KDefaultColumsCount; i++) {
        [self.colunmMaxArray addObject:@(KDefaultInsets.top)];
    }
    //计算所有cell的布局属性
    [self.attrsArray removeAllObjects];
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSUInteger i = 0; i < count; ++i) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}

/**
 * 说明所有元素（比如cell、补充控件、装饰控件）的布局属性
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat xMargin = KDefaultInsets.left + KDefaultInsets.right + (KDefaultColumsCount - 1) * KDefaultColumnMargin;
    CGFloat w = (KCollectionW - xMargin) / KDefaultColumsCount;
    // cell的高度，测试数据，随机数
    CGFloat h = 50 + arc4random_uniform(150);
    // 找出最短那一列的 列号 和 最大Y值
    CGFloat destMaxY = [self.colunmMaxArray[0] doubleValue];
    NSUInteger destColumn = 0;
    for (NSUInteger i = 1; i<self.colunmMaxArray.count; i++) {
        // 取出第i列的最大Y值
        CGFloat columnMaxY = [self.colunmMaxArray[i] doubleValue];
        
        // 找出数组中的最小值
        if (destMaxY > columnMaxY) {
            destMaxY = columnMaxY;
            destColumn = i;
        }
    }
    // cell的x值
    CGFloat x = KDefaultInsets.left + destColumn * (w + KDefaultColumnMargin);
    // cell的y值
    CGFloat y = destMaxY + KDefaultRowMargin;
    // cell的frame
    attrs.frame = CGRectMake(x, y, w, h);
    
    // 更新数组中的最大Y值
    self.colunmMaxArray[destColumn] = @(CGRectGetMaxY(attrs.frame));
    return attrs;
}

/**
 Flow Layout
 主要功能
	Item size（每个item的大小）{
	@property (CGSize)itemSize
	collectionView:layout:sizeForItemAt IndexPath:
 
	}
 
	Line sapcing(每行的间距) {
	@property (CGFloat) minimumLineSpacing
	collectionView:layout:minimumLineSpacingForSectionAtIndex:
	}
 
	Inter cell spacing (每行内部cell item 的间距) {
	@property (CGFloat) minimum InteritemSpacing
	collectionView:layout:minimumInteritemSpacingForSectionAtIndex:
	}
 
	Scrolling direction (滚动方向) {
	UICollectionViewScrollDirectionVertical
	UIcollectionViewScrollDirectionHorizontal
	}
 
	Header and footer size (页眉和页脚大小) {
	- collectionView:viewForSupplementaryElementOfKind:atIndexPath:
 
	}
 
	Section Inset (某个section中cell的边界范围){
	1、  通过全局配置，如下属性
	@property UIEdgeInsets sectionInset;
 
	2、  也通过delegate对每一个section进行配置，如下函数
	- (UIEdgeInsets)collectionView:layout:insetForSectionAtIndex:
 
	}
 
 UICollectionViewLayout 是一个抽象基类，你需要继承自他，来为collection View 生成layout信息，layout对象的作用是决定cells,supplementary views 和Desoration Views在Collection View 中的布局位置
 
 UICollectionViewLayoutAttributes {
	位置
	大小
	透明度
	ZIndex
	转场
 }
 */

@end
