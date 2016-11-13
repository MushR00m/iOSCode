//
//  ViewController1.m
//  获取系统开机时间
//
//  Created by chensongqi on 16/7/15.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController1.h"
#import <SystemConfiguration/CaptiveNetwork.h>

@interface ViewController1 ()

@property (weak, nonatomic) IBOutlet UILabel *vLabel1;

@property (weak, nonatomic) IBOutlet UILabel *vLabel2;

@property (weak, nonatomic) IBOutlet UILabel *vLabel3;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
//    NSString *currentWifiSSID = [self currentWifiSSID];
//    NSLog(@"--- currentWifiSSID: %@",currentWifiSSID);
    [self wifiList];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)currentWifiSSID
{
    NSString *ssid = nil;
    NSArray *ifs = (__bridge   id)CNCopySupportedInterfaces();
    for (NSString *ifname in ifs) {
        NSDictionary *info = (__bridge id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifname);
        if (info[@"SSIDD"])
        {
            ssid = info[@"SSID"];
        }
    }
    return ssid;
}

//Without the use of private library (Apple80211) you can only get the SSID of the network your device is currently connected to.
- (void)wifiList//获取当前WiFi
{
    CFArrayRef myArray = CNCopySupportedInterfaces();
    
    CFDictionaryRef myDict = CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(myArray, 0));
    NSDictionary *dict = (__bridge id)myDict;
    NSLog(@" %@,%@,%@",[dict objectForKey:@"BSSID"],[dict objectForKey:@"SSID"],[dict objectForKey:@"SSIDDATA"]);
    if (dict && [dict isKindOfClass:NSDictionary.class]) {
        self.vLabel1.text = [dict objectForKey:@"BSSID"];
        self.vLabel2.text = [dict objectForKey:@"SSID"];
//        self.vLabel3.text = [dict objectForKey:@"SSIDDATA"];
    }
}

@end
