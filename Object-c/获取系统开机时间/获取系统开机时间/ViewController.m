//
//  ViewController.m
//  获取系统开机时间
//
//  Created by chensongqi on 16/7/15.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *systemLabel;

@property (weak, nonatomic) IBOutlet UILabel *currentLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *systemStr = [self getLaunchSystemTime];
    NSString *currentStr = [self getTime];

    
    self.systemLabel.text = systemStr;
    self.currentLabel.text = currentStr;
}


- (NSString *)getLaunchSystemTime
{
    NSTimeInterval timer_ = [NSProcessInfo processInfo].systemUptime;
    NSDate *currentDate = [NSDate new];
    
    NSDate *startTime = [currentDate dateByAddingTimeInterval:(-timer_)];
    NSString *vStr = [self nsdateToString:startTime];
    NSLog(@"---- vStr = %@",vStr);
    return vStr;
//    NSTimeInterval convertStartTimeToSecond = [startTime timeIntervalSince1970];
//    
//    return convertStartTimeToSecond;
}

//将NSDate按yyyy-MM-dd HH:mm:ss格式时间输出
-(NSString*)nsdateToString:(NSDate *)date
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString* string=[dateFormat stringFromDate:date];
    NSLog(@"%@",string);
    return string;
}

//获取当前系统的yyyy-MM-dd HH:mm:ss格式时间
-(NSString *)getTime
{
    NSDate *fromdate=[NSDate date];
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString* string=[dateFormat stringFromDate:fromdate];
    return string;
}

@end
