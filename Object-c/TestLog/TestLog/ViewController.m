//
//  ViewController.m
//  TestLog
//
//  Created by chensongqi on 16/10/24.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    setenv("XcodeColors", "YES", 0);
    static const int ddLogLevel = DDLogLevelVerbose;//定义日志级别
    [DDLog addLogger:[DDTTYLogger sharedInstance]];// 初始化DDLog日志输出
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];// 启用颜色区分
//    [DDTTYLogger sharedInstance].logFormatter = [MyCustomFormatter sharedInstance];
    
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor grayColor] backgroundColor:nil forFlag:DDLogFlagVerbose];
    
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor greenColor] backgroundColor:nil forFlag:DDLogFlagDebug];
    
    DDLogError(@"DDLogError");      // red
    DDLogWarn(@"DDLogWarn");        // orange
    DDLogDebug(@"DDLogDebug");      // green
    DDLogInfo(@"DDLogInfo");        // pink
    DDLogVerbose(@"DDLogVerbose");  // gray
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
