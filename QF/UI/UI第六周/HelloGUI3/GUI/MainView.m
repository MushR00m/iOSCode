//
//  MainView.m
//  HelloGUI
//
//  Created by chen cheng on 14-8-18.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "MainView.h"
#import "ChessView.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        ChessView  *chessView = [[ChessView alloc] initWithFrame:CGRectMake(30, 50, 260, 260)];
        chessView.layer.borderColor = [UIColor blackColor].CGColor;
        chessView.layer.borderWidth =2;
        [self addSubview:chessView];
        
        [chessView release];
    }
       

    return self;
}


@end
