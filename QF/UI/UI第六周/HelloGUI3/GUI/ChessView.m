//
//  ChessView.m
//  HelloGUI
//
//  Created by chen cheng on 14-8-18.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "ChessView.h"

@implementation ChessView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //把背景颜色设置成透明的
        self.backgroundColor = [UIColor clearColor];
        
        CGFloat width = self.bounds.size.width/9.0;
        CGFloat height = self.bounds.size.height/9.0;
        
        for (int i=1; i<9; i++)
        {
            for (int j=1; j<9; j++)
            {
                UIView  *subView = [[UIView alloc] init];
                subView.frame = CGRectMake(i * width, (j-1) * height, width, height);
                if ((i + j) % 2 == 0)
                {
                    subView.backgroundColor = [UIColor greenColor];
                }
                else
                {
                    subView.backgroundColor = [UIColor grayColor];
                }
                [self addSubview:subView];
                
                [subView release];
            }
            
        }
        for (int i=1; i<9; i++)
        {
            UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(i*width, height*8, width, height)];
            label.text = [NSString stringWithFormat:@"%c",'A'+i-1];
            label.textColor = [UIColor redColor];
            label.textAlignment = NSTextAlignmentCenter;
            [self addSubview:label];
        }
//        CGFloat width = self.bounds.size.width/8.0;
//        CGFloat height = self.bounds.size.height/8.0;
        
        for (int j=0; j<8; j++)
        {
            UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, height*j, width, height)];
            label.text = [NSString stringWithFormat:@"%i",8-j];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor redColor];
            [self addSubview:label];
        }


    }
    
   
    return self;
}

@end
