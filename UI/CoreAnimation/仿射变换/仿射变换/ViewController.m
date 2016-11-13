//
//  ViewController.m
//  仿射变换
//
//  Created by chen songqi on 15/8/11.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

   
}

//GAffineTransform中的“仿射”的意思是无论变换矩阵用什么值，图层中平行的两条线在变换之后任然保持平行，CGAffineTransform可以做出任意符合上述标注的变换，
- (IBAction)translationAction:(id)sender {

    [UIView animateWithDuration:1 animations:^{

        _testView.transform = CGAffineTransformMakeTranslation(0, 100);

    } completion:^(BOOL finished) {
        NSLog(@"translationAction");
//        _testView.transform = CGAffineTransformIdentity;
    }];
}

- (IBAction)revolve:(id)sender {

    [UIView animateWithDuration:1 animations:^{

        _testView.transform = CGAffineTransformMakeRotation(45);

    } completion:^(BOOL finished) {

        NSLog(@"revolve");
    }];

}

- (IBAction)zoomAction:(id)sender {

    [UIView animateWithDuration:1 animations:^{

        _testView.transform = CGAffineTransformMakeScale(2, 2);

    } completion:^(BOOL finished) {
        _testView.transform = CGAffineTransformIdentity;

        NSLog(@"translationAction");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
