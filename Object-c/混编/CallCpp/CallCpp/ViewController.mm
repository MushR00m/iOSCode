//
//  ViewController.m
//  CallCpp
//
//  Created by songqi on 2016/11/23.
//  Copyright © 2016年 好样的. All rights reserved.
//

#import "ViewController.h"

#include "CPPHello.hpp"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    SomeCPP::sayHello();

    CPPHello::sayHello();
    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
