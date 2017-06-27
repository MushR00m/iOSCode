//
//  XuUIViewAnimationViewController.m
//  XuLib
//
//  Created by xuwenyuan on 2017/5/25.
//  Copyright © 2017年 xu. All rights reserved.
//

#import "XuUIViewAnimationViewController.h"

@interface XuUIViewAnimationViewController ()

@property (strong, nonatomic) IBOutlet UITextField *nameTF;
@property (strong, nonatomic) IBOutlet UITextField *pswTF;
@property (strong, nonatomic) IBOutlet UIButton *loginBtn;
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic, assign) BOOL isFlip;
@property (strong, nonatomic) IBOutlet UIImageView *anotherImgView;
@property (nonatomic, assign) CGFloat distance;

@end

@implementation XuUIViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.imgView setImage:[UIImage imageNamed:@"trans1"]];
    UITapGestureRecognizer *wTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doTransitionAnimation)];
    self.imgView.userInteractionEnabled = YES;
    [self.imgView addGestureRecognizer:wTap];
    
    //layout
    [self.anotherImgView setImage:[UIImage imageNamed:@"trans1"]];
    self.distance = -50;
    [self.anotherImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view).offset(self.distance);
        make.bottom.equalTo(self.view).offset(-40);
        make.width.height.equalTo(@80);
    }];
    UITapGestureRecognizer *wTap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doLaoutAnimation)];
    self.anotherImgView.userInteractionEnabled = YES;
    [self.anotherImgView addGestureRecognizer:wTap2];
    self.anotherImgView.layer.cornerRadius = 40.f;
    self.anotherImgView.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startLogin:(id)sender
{
    [self doBaseAnimation];
}

- (void)doBaseAnimation
{
    CGFloat centerX = [UIScreen mainScreen].bounds.size.width / 2.f;
    
    self.nameTF.center = CGPointMake(centerX - 300, self.nameTF.center.y);
    self.pswTF.center = CGPointMake(centerX - 300, self.pswTF.center.y);
    
    [UIView animateWithDuration:0.4f animations:^{
        self.nameTF.center = CGPointMake(centerX, self.nameTF.center.y);
    }];
    
    [UIView animateWithDuration:0.4f delay:0.2f options:UIViewAnimationOptionCurveLinear animations:^{
        self.pswTF.center = CGPointMake(centerX, self.pswTF.center.y);
    } completion:^(BOOL finished) {
        NSLog(@"self.pswTF end");
    }];
    
    [UIView animateWithDuration:0.6f delay:0.f options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat  animations:^{
        self.loginBtn.backgroundColor = [UIColor yellowColor];
    } completion:^(BOOL finished) {
        NSLog(@"self.loginBtn end");
    }];
    
}


- (void)doTransitionAnimation
{
    [UIView transitionWithView:self.imgView duration:0.5f options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [self flipImg];
    } completion:^(BOOL finished) {
        self.isFlip = !self.isFlip;
    }];
}

- (void)flipImg
{
    if (self.isFlip) {
        [self.imgView setImage:[UIImage imageNamed:@"trans1"]];
    } else {
        [self.imgView setImage:[UIImage imageNamed:@"trans2"]];
    }
}

- (void)doLaoutAnimation
{
    self.distance = -self.distance;
    [UIView animateWithDuration:1.f animations:^{
        [self.anotherImgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view).offset(self.distance);
        }];
        [self.view layoutIfNeeded];
    }];
}



@end
