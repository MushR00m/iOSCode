//
//  MainView.m
//  ChessBoard
//
//  Created by chen cheng on 14-8-18.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainView.h"
#import "ChessBoard.h"

@implementation MainView

- (void)dealloc
{
    [_chessBoard release];
    _chessBoard = nil;
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        
        /*ChessBoard   *chessBoard = [[ChessBoard alloc] initWithFrame:CGRectMake(10, 30, 300, 400)];
        
        //设置视图的边框
        chessBoard.layer.borderColor = [UIColor blackColor].CGColor;
        chessBoard.layer.borderWidth = 2;
        
        
        [self addSubview:chessBoard];
        
        [chessBoard release];*/
        
    
        _chessBoard = [[ChessBoard alloc] initWithFrame:CGRectMake(10, 30, 300, 400)];
        
        //设置视图的边框
        _chessBoard.layer.borderColor = [UIColor blackColor].CGColor;
        _chessBoard.layer.borderWidth = 2;
        //舍子阴影颜色
        _chessBoard.layer.shadowColor = [UIColor blackColor].CGColor;
        //设置阴影的偏移量
        _chessBoard.layer.shadowOffset = CGSizeMake(10, 20);
        
        //设置阴影的透明度:1表示不透明  0表示完全透明  0-1表示部分透明
        _chessBoard.layer.shadowOpacity =1;
        //
        _chessBoard.layer.shadowRadius = 15;
        
        
        [self addSubview:_chessBoard];
        
    }
    return self;
}


@end
