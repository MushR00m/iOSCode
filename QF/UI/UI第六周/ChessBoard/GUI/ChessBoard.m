//
//  ChessBoard.m
//  ChessBoard
//
//  Created by chen cheng on 14-8-18.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "ChessBoard.h"

@implementation ChessBoard

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        CGFloat  cellWidth = frame.size.width / 9.0;
        CGFloat  cellHeight = frame.size.height / 9.0;
        
        for (int i=0; i<9; i++)
        {
            for (int j=0; j<9; j++)
            {
                if (j == 0 && i < 8)
                {
                    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(j * cellWidth, i * cellHeight, cellWidth, cellHeight)];
                    
                    label.text = [NSString stringWithFormat:@"%d", 8-i];
                    
                    label.textAlignment = NSTextAlignmentRight;
                    
                    [self addSubview:label];
                    
                    [label release];
                }
                else if (i == 8 && j > 0)
                {
                    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(j * cellWidth, i * cellHeight, cellWidth, cellHeight)];
                    
                    label.text = [NSString stringWithFormat:@"%c", 'A' + j - 1];
                    
                    label.textAlignment = NSTextAlignmentCenter;
                    
                    [self addSubview:label];
                    
                    [label release];
                }
                else if (j>0 && i < 8)
                {
                    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(j * cellWidth, i * cellHeight, cellWidth, cellHeight)];
                    
                    if ((i + j) % 2 == 0)
                    {
                        subView.backgroundColor = [UIColor greenColor];
                    }
                    else
                    {
                        subView.backgroundColor = [UIColor darkGrayColor];
                    }
                    
                    [self addSubview:subView];
                    [subView release];
                }
            }
        }
    }
    return self;
}


@end
