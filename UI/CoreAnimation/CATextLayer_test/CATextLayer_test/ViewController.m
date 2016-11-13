//
//  ViewController.m
//  CATextLayer_test
//
//  Created by chen songqi on 15/8/13.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreText/CoreText.h>

@interface ViewController ()

@property (nonatomic, strong) UIView *labelView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _labelView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    _labelView.center = self.view.center;
    [self.view addSubview:_labelView];

    [self TextLayer2];


}

- (void)TextLayer1
{

    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = self.labelView.bounds;
    [self.labelView.layer addSublayer:textLayer];

    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentLeft;
    textLayer.wrapped = YES;

    UIFont *font = [UIFont systemFontOfSize:15];

    CFStringRef fontName = (__bridge CFStringRef)(font.fontName);
    CGFontRef fontref = CGFontCreateWithFontName(fontName);
    textLayer.font = fontref;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontref);

    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing \n elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \n leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel \n fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \n lobortis";

    textLayer.string = text;
    textLayer.contentsScale = [UIScreen mainScreen].scale;

    textLayer.borderColor = [UIColor redColor].CGColor;
    textLayer.borderWidth = 1;

}

- (void)TextLayer2
{


    //create a text layer
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = self.labelView.bounds;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.labelView.layer addSublayer:textLayer];

    textLayer.alignmentMode = kCAAlignmentNatural;
    textLayer.wrapped = YES;


    //chose a font
    UIFont *font = [UIFont systemFontOfSize:15];

    //chose some text
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing \n elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \n leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc \n elementum, libero ut porttitor dictum, diam odio congue lacus, vel \n fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \n lobortis";

    //create attributed string
    NSMutableAttributedString *string = nil;
    string = [[NSMutableAttributedString alloc] initWithString:text];

    //convert UIFont to a CTFont
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFloat fontSize = font.pointSize;
    CTFontRef fontRef = CTFontCreateWithName(fontName, fontSize, NULL);

    //set text attributes
    NSDictionary *attribs = @{
                              (__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor blackColor].CGColor,
                              (__bridge id)kCTFontAttributeName: (__bridge id)fontRef
                              };


    [string setAttributes:attribs range:NSMakeRange(0, text.length)];
    attribs = @{
                (__bridge id)kCTForegroundColorAttributeName: (__bridge id)[UIColor redColor].CGColor,
                (__bridge id)kCTUnderlineStyleAttributeName: @(kCTUnderlineStyleSingle),
                (__bridge id)kCTFontAttributeName: (__bridge id)fontRef
                };
    [string setAttributes:attribs range:NSMakeRange(6, 5)];

    //release the CTFont we created earlier
    CFRelease(fontRef);
    
    //set layer text
    textLayer.string = string;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
