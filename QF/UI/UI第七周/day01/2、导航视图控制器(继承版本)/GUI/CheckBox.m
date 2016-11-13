//
//  CheckBox.m
//  CheckBox
//
//  Created by chen cheng on 14-8-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "CheckBox.h"

@interface TargetInfo : NSObject
{
    id _target;
    SEL _action;
}

@property(assign, readwrite, nonatomic)id target;
@property(assign, readwrite, nonatomic)SEL action;


@end


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
            [targetInfo.target performSelector:targetInfo.action withObject:self];// 在本例当中、这里就是在调用MainView当中的checkBoxValueChange：函数、同时将self作为实参传给函数checkBoxValueChange,这里的self就是CheckBox(复选框)自己.
        }
    }
}

- (void)setTitle:(NSString *)title
{
    _titleLabel.text = title;
}

- (NSString *)title
{
    return _titleLabel.text;
}

- (void)setTitleFont:(UIFont *)titleFont
{
    _titleLabel.font = titleFont;
}

- (UIFont *)titleFont
{
    return _titleLabel.font;
}

- (void)setTitleColor:(UIColor *)titleColor
{
    _titleLabel.textColor = titleColor;
}

- (UIColor *)titleColor
{
    return _titleLabel.textColor;
}

- (void)dealloc
{
    [_titleLabel release];
    _titleLabel = nil;
    
    [_button release];
    _button = nil;
    
    [_targetInfoMutableArray release];
    _targetInfoMutableArray = nil;
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        [self createSubView];
        
        _targetInfoMutableArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        [self createSubView];
        
        _titleLabel.frame = CGRectMake(0, 0, self.frame.size.width - 23, self.frame.size.height);
        _button.frame = CGRectMake(self.frame.size.width-23, 0, 23, self.frame.size.height);

        
        _targetInfoMutableArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createSubView
{
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textAlignment = NSTextAlignmentRight;
    _titleLabel.font = [UIFont systemFontOfSize:17];
    
    [self addSubview:_titleLabel];
    
    _button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    
    _on = NO;
    [_button setImage:[UIImage imageNamed:@"noselected.png"] forState:UIControlStateNormal];
    [_button setImage:[UIImage imageNamed:@"noselected.png"] forState:UIControlStateHighlighted];
    
    
    [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_button];
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    _titleLabel.frame = CGRectMake(0, 0, self.frame.size.width - 23, self.frame.size.height);
    _button.frame = CGRectMake(self.frame.size.width-23, 0, 23, self.frame.size.height);
}

- (void)buttonClick:(id)sender
{
    self.on = !(self.on);
}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    //UIControlEventValueChanged = 100000000000
    //controlEvents              = 010101010101
    //--------------------------------------------
    //                              00000000000
    if (controlEvents & UIControlEventValueChanged)
    {
        TargetInfo *targetInfo = [[TargetInfo alloc] init];
        targetInfo.target = target; //在本例当中、这里的target就是MainView当中的self
        targetInfo.action = action; //在本例当中、这里的action就MainView当中的checkBoxValueChange:函数

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
