//
//  MainViewController.m
//  storebody测试
//
//  Created by chen songqi on 15/7/24.
//  Copyright (c) 2015年 niwodai. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController


/**
 一个UIStoryboardSegue对象负责执行两个试图控制器之间的视觉过渡。另外，segue对象通常用来准备从一个控制器过渡到另一个控制器。segue对象包含了涉及过渡的控制器的信息。当segue被触发，并且在视觉过渡发生之前，正在运行的storyboard调用当前的视图控制器的 prepareForSegue：sender： 方法从而可以传送任何将要展示的必须数据到下一个视图控制器。

 UIStoryboardSegue类支持UIKit提供的标准视觉过渡。您还可以继承到您的故事板文件中定义的视图控制器之间的自定义转换。

 你不必直接创建segue对象。运行的storyboard创建他们当它必须执行一个在两个视图之间的segue时候。如果你希望的话，你也可以通过编程的方法启动一个segue通过使用UIViewController中的 performSegueWithIdentifier:sender: 方法。你可以通过这种方法启动一个segue从通过代码添加的资源并且在Interface builder中不可用。
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"主视图控制器";

    self.view.backgroundColor = [UIColor greenColor];
            }

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"调用这个方法 MainViewController");

    UIViewController *vc =  segue.destinationViewController;
    [vc.navigationItem setTitle:@"MainViewController"];
}


//- (IBAction)btnClick:(id)sender {
//
//     [self performSegueWithIdentifier:@"oneToTwo" sender:nil];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
