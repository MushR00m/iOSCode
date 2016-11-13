//
//  SettingView.m
//  XIBDemo1
//
//  Created by chen cheng on 14-8-29.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "SettingView.h"

@implementation SettingView


- (IBAction)scValueChanged:(id)sender
{
    UISegmentedControl *sc = (UISegmentedControl *)sender;
    
    NSLog(@"sc.selectedSegmentIndex = %d", sc.selectedSegmentIndex);
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
    }
    return self;
}



- (void)dealloc
{
    [_segmentedControl release];
    [_button release];
    [_switchControl release];
    [super dealloc];
}
@end
