//
//  QFTableView.m
//  下拉刷新
//
//  Created by chen cheng on 14-9-9.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFTableView.h"

typedef NS_ENUM(NSInteger, RefreshTableHeaderViewState) {
    RefreshTableHeaderViewStateNormal = 0,
    RefreshTableHeaderViewStatePulling,
    RefreshTableHeaderViewStateLoading,
};



@interface RefreshTableHeaderView : UIView
{
    UIImageView *_pullDownImageView;
    UILabel     *_stateLabel;
    
    UIImageView *_activityLoadingImageView;
    
    RefreshTableHeaderViewState _state;
}

@property(assign, readwrite, nonatomic)RefreshTableHeaderViewState state;


@end




@implementation RefreshTableHeaderView

- (void)dealloc
{
    [_pullDownImageView release];
    _pullDownImageView = nil;
    
    [_stateLabel release];
    _stateLabel = nil;
    
    [_activityLoadingImageView release];
    _activityLoadingImageView = nil;
    
    [super dealloc];
}

- (void)setState:(RefreshTableHeaderViewState)state
{
    _state = state;
    
    if (state == RefreshTableHeaderViewStateNormal)
    {
        [_activityLoadingImageView removeFromSuperview];
        [self addSubview:_pullDownImageView];
        
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            _pullDownImageView.layer.transform = CATransform3DIdentity;
            
        } completion:^(BOOL finished) {
            
            _stateLabel.text = @"下拉刷新";
        }];
        
        
        
    }
    else if (state == RefreshTableHeaderViewStatePulling)
    {
        [_activityLoadingImageView removeFromSuperview];
        [self addSubview:_pullDownImageView];
        
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            _pullDownImageView.layer.transform = CATransform3DMakeRotation(-3.1415926, 0, 0, 1);
            
        } completion:^(BOOL finished) {
            
            _stateLabel.text = @"松开刷新";
        }];
    }
    else if (state == RefreshTableHeaderViewStateLoading)
    {
        [_pullDownImageView removeFromSuperview];
        [self addSubview:_activityLoadingImageView];
        
        [self startLoadingAnimate];
        
        _stateLabel.text = @"正在加载...";
    }
}

- (void)startLoadingAnimate
{
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        _activityLoadingImageView.layer.transform = CATransform3DRotate(_activityLoadingImageView.layer.transform, 60.0 / 180.0 * 3.1415926, 0, 0, 1);
        
    } completion:^(BOOL finished) {
        
        if (self.state == RefreshTableHeaderViewStateLoading)
        {
            [self startLoadingAnimate];
        }
    }];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        self.backgroundColor = [UIColor whiteColor];
        
        _pullDownImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pullDown_arrow.png"]];
        
        _pullDownImageView.frame = CGRectMake(frame.size.width/2.0-12, frame.size.height-24-40, 24, 24);
        NSLog(@"11frame.size.height = %f",frame.size.height);
        
        [self addSubview:_pullDownImageView];
        
        _activityLoadingImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"activity_loading.png"]];
        _activityLoadingImageView.frame = _pullDownImageView.frame;
        

         _stateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _pullDownImageView.frame.origin.y + _pullDownImageView.frame.size.height, self.frame.size.width, 40)];
        _stateLabel.textAlignment = NSTextAlignmentCenter;
        _stateLabel.text = @"下拉刷新";
        
        [self addSubview:_stateLabel];
    }
    return self;
}



@end




@interface QFTableView()
{
    RefreshTableHeaderView *_refreshTableHeaderView;
}

@end


@implementation QFTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self != nil)
    {
        
        _refreshTableHeaderView = [[RefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, -frame.size.height, frame.size.width, frame.size.height)];
        
        NSLog(@"22frame.size.height = %f",frame.size.height);

        [self addSubview:_refreshTableHeaderView];
        
       
        self.delegate = self;
        
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollView.contentOffset.y = %f", scrollView.contentOffset.y);
    
    if (_refreshTableHeaderView.state == RefreshTableHeaderViewStateLoading)
    {
        return;
    }
    
    if (scrollView.contentOffset.y <= -70)
    {
        _refreshTableHeaderView.state = RefreshTableHeaderViewStatePulling;
    }
    else
    {
        _refreshTableHeaderView.state = RefreshTableHeaderViewStateNormal;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (_refreshTableHeaderView.state == RefreshTableHeaderViewStateLoading)
    {
        return;
    }

    if (scrollView.contentOffset.y <= -70)
    {
        _refreshTableHeaderView.state = RefreshTableHeaderViewStateLoading;
        
        self.contentInset = UIEdgeInsetsMake(70, 0, 0, 0);
        
        [self.dataSource tableViewRefreshData:self];
    }
}

- (void)didLoadData
{
    _refreshTableHeaderView.state = RefreshTableHeaderViewStateNormal;
    
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
    } completion:^(BOOL finished) {
        
    }];
}

@end
