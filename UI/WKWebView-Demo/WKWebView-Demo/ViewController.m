//
//  ViewController.m
//  WKWebView-Demo
//
//  Created by chensongqi on 16/9/7.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"

#import <WebKit/WebKit.h>

@interface ViewController () <WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation ViewController


// OC版本用法： http://www.jianshu.com/p/3c0ff88daba7

/**
 swift 版本用法  ：http://www.jianshu.com/p/d29384454a9a
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WKWebViewConfiguration *config =[[WKWebViewConfiguration alloc]init];
    /** WebView的偏好设置 */
    config.preferences.minimumFontSize = 10;
    config.preferences.javaScriptEnabled = YES;
    /** 默认是不能通过JS自动打开窗口的，必须通过用户交互才能打开 */
    config.preferences.javaScriptCanOpenWindowsAutomatically = NO;
    /**  添加JS到到HTML中  */
    NSString *js = @"window.alert('欢迎体验WkWebView!!');";
    WKUserScript *script = [[WKUserScript alloc]initWithSource:js injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:YES];
    
    [config.userContentController addUserScript:script];

    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *reuqest = [[NSURLRequest alloc] initWithURL:url];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView loadRequest:reuqest];
}

/** 基本方法和属性
 (1)loadRequest()  加载请求
 (2)goBack()  网页后退
 (3)goForward()  网页前进
 (4)reload()  网页重新加载
 (5)stopLoading()  网页停止加载
 (6)title  网页标题
 (7)canGoBack  网页是否能够后退
 (8)canGoForward  网页是否能够前进
 (9)estimatedProgress  网页加载中当前的进度
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id>*)change context:(void *)context{
    // 获得进度值
    CGFloat progress = [change[NSKeyValueChangeNewKey] floatValue];
    // 显示进度
    NSLog(@"progress = %f",progress);
}

#pragma mark - WKNavigationDelegate 代理方法
/**
 *  每当加载一个请求之前会调用该方法，通过该方法决定是否允许或取消请求的发送
 *
 *  @param navigationAction 导航动作对象
 *  @param decisionHandler  请求处理的决定
 */
- (void)webView:(WKWebView*)webView decidePolicyForNavigationAction:(WKNavigationAction*)navigationAction decisionHandler:(void(^)(WKNavigationActionPolicy))decisionHandler {
    NSLog(@"%s", __FUNCTION__);

    // 获得协议头(可以自定义协议头，根据协议头判断是否要执行跳转)
    NSString *scheme = navigationAction.request.URL.scheme;
    if ([scheme isEqualToString:@"itheima"]) {
        // decisionHandler 对请求处理回调
        //WKNavigationActionPolicyCancel:取消请求
        //WKNavigationActionPolicyAllow:允许请求
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

/**
 *  当开始发送请求时调用
 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"当开始发送请求时调用  %s", __FUNCTION__);
}

/**
 *  当请求过程中出现错误时调用
 */
- (void)webView:(WKWebView*)webView didFailNavigation:(WKNavigation*)navigation withError:(NSError *)error {
    NSLog(@"当请求过程中出现错误时调用  %@= %s",error, __FUNCTION__);
}

/**
 *  当开始发送请求时出错调用
 */
- (void)webView:(WKWebView*)webView didFailProvisionalNavigation:(WKNavigation*)navigation withError:(NSError *)error {
    NSLog(@"当开始发送请求时出错调用 %@= %s",error, __FUNCTION__);
}

/**
 *  当收到服务器返回的受保护空间(证书)时调用
 *  @param challenge         安全质询-->包含受保护空间和证书
 *  @param completionHandler 完成回调-->告诉服务器如何处置证书
 */
- (void)webView:(WKWebView*)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge*)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *__nullablecredential))completionHandler {
    // 创建凭据对象
    NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
    // 告诉服务器信任证书
    completionHandler(NSURLSessionAuthChallengeUseCredential,credential);
}

/**
 *  当网页加载完毕时调用：该方法使用最频繁
 */
- (void)webView:(WKWebView*)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    // js 代码
    NSString*jsCode = [NSString stringWithFormat:@"window.location.href='#howtorecharge'"];
    // 可以在这个方法执行JS代码
    [webView evaluateJavaScript:jsCode completionHandler:^(id _Nullable result, NSError* _Nullable error) {
        NSLog(@"执行完毕JS代码");
    }];
}

@end
