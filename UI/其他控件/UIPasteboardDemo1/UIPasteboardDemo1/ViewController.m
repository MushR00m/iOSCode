//
//  ViewController.m
//  UIPasteboardDemo1
//
//  Created by chensongqi on 16/10/28.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *testlLabel;

@property (weak, nonatomic) IBOutlet UILabel *pasteLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadingTapGR];
}

//添加点击手势
-(void)loadingTapGR{
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(showMenuVC:)];
    
    self.testlLabel.userInteractionEnabled = YES;
    
    [self.testlLabel addGestureRecognizer:longPress];
    
    UILongPressGestureRecognizer *longPress2 = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(showMenuVC:)];
    
    self.pasteLabel.userInteractionEnabled = YES;
    
    [self.pasteLabel addGestureRecognizer:longPress2];
    
}

//显示菜单
-(void)showMenuVC:(UILongPressGestureRecognizer *)longPress{
    
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    UIMenuItem * menuItem = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyTitle)];
    UIMenuItem * pasteItem = [[UIMenuItem alloc] initWithTitle:@"黏贴" action:@selector(paste:)];
    [menuController setMenuItems:@[menuItem,pasteItem]];
    CGPoint location = [longPress locationInView:[longPress view]];
    CGRect menuLocation = CGRectMake(location.x, location.y, 0, 0);
    [menuController setTargetRect:menuLocation inView:[longPress view]];
    [menuController setMenuVisible:YES animated:YES];
}

//复制文本
-(void)copyTitle{
    
    NSLog(@"复制功能的实现~");
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];//普通的黏贴板
    
    pasteboard.string = self.testlLabel.text;
    
}

-(void)paste:(id)sender
{
    
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    
    //判断是否数据
    if (nil != pboard.string) {
        
        
        
        self.pasteLabel.text = pboard.string;
    }
}

//
- (BOOL)canBecomeFirstResponder{
    
    return YES;
    
}



@end
