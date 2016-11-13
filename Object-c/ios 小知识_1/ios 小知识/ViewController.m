//
//  ViewController.m
//  ios 小知识
//
//  Created by chen songqi on 15/6/4.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"

#import "B.h"

@interface ViewController ()

@property (nonatomic, strong) B *b;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    self.b = [[B alloc] initWithNibName:@"B" bundle:nil];

    UIButton *bButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [bButton setTitle:@"测试一下" forState:UIControlStateNormal];
    [bButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [bButton addTarget:self action:@selector(bButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bButton];
    bButton.frame = CGRectMake(0, 0, 200, 30);
    bButton.center = self.view.center;
    bButton.layer.borderColor = [UIColor blackColor].CGColor;
    bButton.layer.borderWidth = 1;
    [bButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];//改变Button文字对齐方式
    bButton.tag = 1;
    NSLog(@"--bButton  %@",bButton);


    UIView *view = [self.view viewWithTag:1];//通过tag取Cell的控件
    NSLog(@"--view    %@",view);



    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300, 50)];
    label.text = @"这是一个TEST";
    label.layer.borderWidth =1;
    label.layer.borderColor = [UIColor redColor].CGColor;
    UIFont *font = [UIFont fontWithName:@"文鼎CS中等線" size:15];
    label.font = font;
    [self.view addSubview:label];



}


- (void)bButtonClick:(UIButton *)send
{


    //NSString 编码UTF8
    NSString *urlStr = @"www.baidu.com/搜索";
    NSString *URLString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)urlStr, nil, nil, kCFStringEncodingUTF8));
    NSLog(@"----URLString %@",URLString);


}

/*
//验证图片有效性
- (BOOL)isJPEGValid:(NSData *)jpeg {
    if ([jpeg length] < 4) return NO;
    const char * bytes = (const char *)[jpeg bytes];
    if (bytes[0] != 0xFF || bytes[1] != 0xD8) return NO;
    if (bytes[[jpeg length] - 2] != 0xFF || bytes[[jpeg length] - 1] != 0xD9) return NO;
    return YES;
}*/

@end
