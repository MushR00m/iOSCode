//
//  ViewController.m
//  JSContextDemo1
//
//  Created by chensongqi on 16/11/30.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"


@interface ViewController()<UIWebViewDelegate,ObjcExportMethod>
{
    UIWebView *web;
}
@end

@implementation ViewController

#pragma mark - ObjcExportMethod

/**
 *  无参导出方法
 */
- (void)show
{
    NSLog(@"%s", __func__);
}
/**
 *  返回一个OC字符串到JavaScript
 */
- (NSString *)returnString
{
    return @"从OC返回成功";
}
/**
 *  返回一个OC数组到JavaScript
 */
- (NSArray *)returnArray
{
    return @[@(1), @"hello"];
}
/**
 *  返回一个OC字典到JavaScript
 */
- (NSDictionary *)returnDict
{
    return @{
             @"name" : @"jack",
             @"date" : @[@(1), @"hello"]
             };
}
/**
 *  从JavaScript接收两个NSNumber参数，计算他们的和并返回计算结果到JS
 */
- (NSNumber *)returnSumWithNum1:(NSNumber *)n1 andNum2:(NSNumber *)n2
{
    return @(n1.intValue + n2.intValue);
}
/**
 *  从JavaScript接收两个NSNumber类型的值，打印出来
 */
- (void)showNumber1:(NSNumber *)n1 andNumber2:(NSNumber *)n2
{
    NSLog(@"number1 = %@, number2 = %@", n1, n2);
}
/**
 *  从JavaScript接收一个字典
 */
- (void)dictTest:(NSDictionary *)dict
{
    NSLog(@"%@",dict);
}
/**
 *  从JavaScript接收一个数组
 */
- (void)arrayTest:(NSArray *)array
{
    NSLog(@"%@", array);
}


#pragma mark - viewDidLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    
    web = [[UIWebView alloc] initWithFrame:self.view.bounds];
    web.delegate = self;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [web loadRequest:request];
    [self.view addSubview:web];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    //JS上下文
    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    //设置js内的方法为本身的方法
    context[@"method"] = self;
    
    //block方式 实现JS点击回调
    context[@"test"] = ^() {
        NSArray *args = [JSContext currentArguments];//获取参数集合
        for (id obj in args) {
            NSLog(@"%@",obj);
        }
    };
    
    //调用JS内的方法test2()
    [context evaluateScript:@"test2('oc调js')"];
}

@end
