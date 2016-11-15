//
//  ViewController.m
//  CLLocationManagerDemo1
//
//  Created by chensongqi on 16/11/15.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>

@property(nonatomic, strong) CLLocationManager *locationM;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (CLLocationManager *)locationM
{
    if (!_locationM) {
        _locationM = [[CLLocationManager alloc] init];
        
        _locationM.delegate = self;
        
        if ([_locationM respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            //NSLocationAlwaysUsageDescription
            [_locationM requestAlwaysAuthorization];
            
            //NSLocationWhenInUseUsageDescription  必须添加key 
            [_locationM requestWhenInUseAuthorization];
        }
        
        _locationM.distanceFilter = 1000;
        _locationM.desiredAccuracy =  kCLLocationAccuracyBest;
        
    }
    
    return _locationM;
}

- (void)aRequestLocationStatus
{
    if ([CLLocationManager locationServicesEnabled]) {
        NSLog(@"3.定位服务是开启状态，需要手动授权，即跳转设置界面");
        NSURL *settingURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:settingURL]) {
            [[UIApplication sharedApplication] openURL:settingURL options:nil completionHandler:^(BOOL success) {
                NSLog(@"用户跳转设置界面");
            }];
        }
        
    } else {
        NSLog(@"用户关闭");
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([CLLocationManager locationServicesEnabled]) {
        NSLog(@"已开启定位服务");
        
        
        //单次定位服务
        //必须实现代理的定位失败方法
        //不能与startupdatinglocation 方法同事使用
        //[self.locationM requestLocation];
        
        
        //方法1：标准定位服务 （使用位置管理器进行定位）
        //开始更新位置信息（一旦调用了这个方法，就会不断的刷新用户位置，然后告诉外界）
        //以下代码默认只能在前台获取用户的位置信息,如果想要在后台获取用户的位置信息, 那么需要勾选后台模式 location updates
        // 小经验: 如果以后使用位置管理者这个对象, 实现某个服务,可以用startXX开始某个服务，stopXX停止某个服务
        [self.locationM startUpdatingLocation];
        
        
        //方法2： 监听重大位置变化的服务（基于基站进行定位）（显著位置变化定位服务）
        //[self.locationM startMonitoringSignificantLocationChanges];
    } else {
        NSLog(@"没有开启定位服务");
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    NSLog(@"位置信息:%@", locations);
    [manager stopUpdatingLocation];

}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"定位失败");
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
        {
            NSLog(@"用户还未决定");
        }
            break;
        case kCLAuthorizationStatusRestricted:
        {
            NSLog(@"2.访问受限（苹果预留选项，暂时没用）");
        }
            break;
        case kCLAuthorizationStatusDenied:
        {
            [self aRequestLocationStatus];
        }
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
        {
            NSLog(@"4.获取前后台定位授权");
        }
            break;
            
        case kCLAuthorizationStatusAuthorizedWhenInUse:
        {
            NSLog(@"5.获取前台定位授权");
        }
            break;
        default:
            break;
    }
}

@end
