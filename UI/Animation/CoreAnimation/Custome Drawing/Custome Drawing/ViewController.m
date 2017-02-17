//
//  ViewController.m
//  Custome Drawing
//
//  Created by chen songqi on 15/8/11.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (nonatomic, strong) UIView *layerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    _layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
    _layerView.center = self.view.center;
    _layerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:_layerView];


    //create sublayer
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;


    //set controller as layer delegate
    blueLayer.delegate = self;

    //ensure that layer backing image uses correct scale
    blueLayer.contentsScale = [UIScreen mainScreen].scale; //add layer to our view
    [self.layerView.layer addSublayer:blueLayer];

    //force layer to redraw
    [blueLayer display];
}


- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //draw a thick red circle
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

@end
