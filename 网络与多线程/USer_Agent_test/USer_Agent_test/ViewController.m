//
//  ViewController.m
//  USer_Agent_test
//
//  Created by chensongqi on 2017/5/18.
//  Copyright © 2017年 chensongqi. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WKWebView.h>
#import <objc/runtime.h>

@interface NSObject (Swizzle)

+ (BOOL)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector;

@end

@implementation NSObject (Swizzle)

+ (BOOL)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector
{
    Method origMethod = class_getInstanceMethod(self, origSelector);
    Method newMethod = class_getInstanceMethod(self, newSelector);
    
    if (origMethod && newMethod) {
        if (class_addMethod(self, origSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
            class_replaceMethod(self, newSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
        } else {
            method_exchangeImplementations(origMethod, newMethod);
        }
        return YES;
    }
    return NO;
}

@end


@interface NSMutableURLRequest (MyMutableURLRequest)

+ (void)setupUserAgentOverwrite;

@end

@implementation NSMutableURLRequest (MyMutableURLRequest)

- (void)newSetValue:(NSString *)value forHTTPHeaderField:(NSString *)field;
{
    if ([field isEqualToString:@"User-Agent"]) {
        
        //Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Mobile/14E269
        //Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36
        NSLog(@"value = %@",value);
        value = @"The new User-Agent string";
    }
    [self newSetValue:value forHTTPHeaderField:field];
}

+ (void)setupUserAgentOverwrite
{
    [self swizzleMethod:@selector(setValue:forHTTPHeaderField:)
             withMethod:@selector(newSetValue:forHTTPHeaderField:)];
}

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *wkWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview: wkWebView];
    [NSMutableURLRequest setupUserAgentOverwrite];

//    NSString *customUserAgent = @"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36";
//    [[NSUserDefaults standardUserDefaults] registerDefaults:@{@"UserAgent":customUserAgent}];
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    request.URL = url;
//    [request setValue:@"The new User-Agent string" forHTTPHeaderField:@"User-Agent"];

    
    NSString *sysUA = request.allHTTPHeaderFields[@"User-Agent"];
    NSLog(@"sysUA = %@",sysUA);

    [wkWebView loadRequest:request];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
