//
//  CheckBox.m
//  CheckBox
//
//  Created by chen cheng on 14-8-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "CheckBox.h"

@implementation TargetInfo


@end


@implementation CheckBox

- (void)setOn:(BOOL)on
{
    if (_on == on)
    {
        return;
    }
    
    
    _on = on;
    
    if (_on)
    {
        [_button setImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateHighlighted];

    }
    else
    {
        [_button setImage:[UIImage imageNamed:@"noselected.png"] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"noselected.png"] forState:UIControlStateHighlighted];
    }
    
    for (int i=0; i<[_targetInfoMutableArray count]; i++)
    {
        TargetInfo *targetInfo = [_targetInfoMutableArray objectAtIndex:i];
        
        if ([targetInfo.target respondsToSelector:targetInfo.action])
        {
            [targetInfo.target performSelector:targetInfo.action withObject:self];
        }
    }
}

- (void)dealloc
{
    [_button release];
    _button = nil;
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        _button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
        
        _on = NO;
        [_button setImage:[UIImage imageNamed:@"noselected.png"] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"noselected.png"] forState:UIControlStateHighlighted];
        
        _button.frame = self.bounds;
        
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_button];
        
        _targetInfoMutableArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)buttonClick:(id)sender
{
    self.on = !(self.on);
}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    if (controlEvents & UIControlEventValueChanged)
    {
        TargetInfo *targetInfo = [[TargetInfo alloc] init];
        targetInfo.target = target;
        targetInfo.action = action;

        [_targetInfoMutableArray addObject:targetInfo];
        
        [targetInfo release];
    }
}

- (void)removeTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    if (controlEvents & UIControlEventValueChanged)
    {
        TargetInfo *targetInfo = nil;
        
        for (int i=0; i<[_targetInfoMutableArray count]; i++)
        {
            targetInfo = [_targetInfoMutableArray objectAtIndex:i];
            if (targetInfo.target == target)
            {
                break;
            }
        }
        if (targetInfo != nil)
        {
            [_targetInfoMutableArray removeObject:targetInfo];
        }
    }
}


@end
