//
//  XuBigView.h
//  XuLib
//
//  Created by xuwenyuan on 2017/6/6.
//  Copyright © 2017年 xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XuBigViewDelegate <NSObject>



@end

@interface XuBigView : UIView

@property (nonatomic, weak) id delegate;


- (void)refreshScrollViewDidScroll:(UIScrollView *)scrollView;
- (void)refreshScrollViewDidEndDragging:(UIScrollView *)scrollView;
- (void)refreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;
- (void)refreshScrollViewDataSourceLoadingFailed:(UIScrollView *)scrollView;

@end
