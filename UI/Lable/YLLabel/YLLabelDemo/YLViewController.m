//
//  YLViewController.m
//  YLLabelDemo
//
//  Created by Eric Yuan on 12-11-8.
//  Copyright (c) 2012年 YuanLi. All rights reserved.
//

#import "YLViewController.h"
#import "YLLabel.h"

NSString* const msg = @"尊敬的用户:接邮储银行临时通知，由于受银行系统维护，2015年1月7日22：00至2015年1月8日4：00将暂停你我贷网站和手机客户端通过邮储银行的快捷支付充值服务，届时您可以使用其他银行进行支付充值，由此给您带来不便，敬请谅解!  尊敬的用户:接邮储银行临时通知，由于受银行系统维护，2015年1月7日22：00至2015年1月8日4：00将暂停你我贷网站和手机客户端通过邮储银行的快捷支付充值服务，届时您可以使用其他银行进行支付充值，由此给您带来不便，敬请谅解!  尊敬的用户:接邮储银行临时通知，由于受银行系统维护，2015年1月7日22：00至2015年1月8日4：00将暂停你我贷网站和手机客户端通过邮储银行的快捷支付充值服务，届时您可以使用其他银行进行支付充值，由此给您带来不便，敬请谅解!  尊敬的用户:接邮储银行临时通知，由于受银行系统维护，2015年1月7日22：00至2015年1月8日4：00将暂停你我贷网站和手机客户端通过邮储银行的快捷支付充值服务，届时您可以使用其他银行进行支付充值，由此给您带来不便，敬请谅解!   尊敬的用户:接邮储银行临时通知，由于受银行系统维护，2015年1月7日22：00至2015年1月8日4：00将暂停你我贷网站和手机客户端通过邮储银行的快捷支付充值服务，届时您可以使用其他银行进行支付充值，由此给您带来不便，敬请谅解! ";

@interface YLViewController ()

@end

@implementation YLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // YLLabel
    [justifyLabel setText:msg];
    justifyLabel.textColor = [UIColor darkGrayColor];
    justifyLabel.font = [UIFont systemFontOfSize:16.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
