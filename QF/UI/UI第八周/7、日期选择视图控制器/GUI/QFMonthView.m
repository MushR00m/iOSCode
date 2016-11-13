//
//  QFMonthView.m
//  日期选择视图控制器
//
//  Created by chen cheng on 14-9-2.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFMonthView.h"


/**
 *  计算某年某月有多少天
 *
 *  @param year  年
 *  @param month 月
 *
 *  @return 天数
 */
int countDays(int year, int month)
{
    if (year <= 0)
    {
        return 0;
    }
    
    switch(month)
    {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            return 31;
        case 4:
        case 6:
        case 9:
        case 11:
            return 30;
        case 2:
            if((year%4!=0) || ((year%100==0)&&(year%400!=0)))
            {
                return 28;
            }
            else
            {
                return 29;
            }
        default:
            return 0;
    };
}

/**
 *  计算某年某月某日是星期几
 *
 *  @param y 年
 *  @param m 月
 *  @param d 日
 *
 *  @return 0：星体天、1-6：星期1-星期6
 */
int  dayOfTheWeek(int year, int month, int day)
{
    int e;
    int t;
    int f;
    
    switch(month)
    {
        case   1:e=day;break;
        case   2:e=31+day;break;
        case   3:e=59+day;break;
        case   4:e=90+day;break;
        case   5:e=120+day;break;
        case   6:e=151+day;break;
        case   7:e=181+day;break;
        case   8:e=212+day;break;
        case   9:e=243+day;break;
        case   10:e=273+day;break;
        case   11:e=304+day;break;
        case   12:e=334+day;break;
        default:
            return 0;
    }
    if((year%4==0&&year%100!=0) || year%400==0)
    {
        if (month > 2)
        {
            ++e;
        }
    }
    --year;
    t = year + year/4 - year/100 + year/400 + e;
    f = t%7;
    
    return f;
}


@implementation QFMonthView

- (void)dealloc
{
    [_titleLabel release];
    _titleLabel = nil;
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 60)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:24];
        
        _titleLabel.text = @"XXXX年XX月";
        
        [self addSubview:_titleLabel];
        
        
        NSString *dayOfWeekString[7] = {@"星期天", @"星期一", @"星期二", @"星期三", @"星期四",  @"星期五", @"星期六"};
        
        for (int i=0; i<7; i++)
        {
            UILabel  *dayOfWeekLabel = [[UILabel alloc] initWithFrame:CGRectMake(i*(frame.size.width/7.0), _titleLabel.frame.origin.y + _titleLabel.frame.size.height, frame.size.width/7.0, 20)];
            
            dayOfWeekLabel.text = dayOfWeekString[i];
            
            dayOfWeekLabel.textAlignment = NSTextAlignmentCenter;
            
            dayOfWeekLabel.font = [UIFont boldSystemFontOfSize:13];
            
            [self addSubview:dayOfWeekLabel];
            
            [dayOfWeekLabel release];
        }
        
        for (int i=0; i<31; i++)
        {
            dayButtonArray[i] = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
            
            [dayButtonArray[i] setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
            
            [dayButtonArray[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        
    }
    return self;
}

- (void)setYear:(int)year month:(int)month
{
    _year = year;
    _month = month;
    
    _titleLabel.text = [NSString stringWithFormat:@"%d年%d月", _year, _month];
    
    
    int dayOfweek = dayOfTheWeek(_year, _month, 1);
    int days = countDays(_year, _month);
    
    CGFloat  dY = _titleLabel.frame.origin.y + _titleLabel.frame.size.height + 20;
    
    
    NSLog(@"days = %d", days);
    
    int m = 0;//当前的行数
    int n = dayOfweek;//当前列数
    
    
    for (int i=0; i<days; i++)
    {
        dayButtonArray[i].frame = CGRectMake(n * self.frame.size.width/7.0, m * 40 + dY, self.frame.size.width/7.0, 40);
        
        n++;//列数增加
        if (n == 7)
        {
            m++;
            n = 0;
        }
        
        
        [self addSubview:dayButtonArray[i]];
    }
    
    for (int i=days; i<31; i++)
    {
        [dayButtonArray[i] removeFromSuperview];
    }

}


@end
