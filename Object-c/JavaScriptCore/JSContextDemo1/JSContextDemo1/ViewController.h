//
//  ViewController.h
//  JSContextDemo1
//
//  Created by chensongqi on 16/11/30.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <JavaScriptCore/JavaScriptCore.h>

//自己定义一个协议遵守JSExport协议，然后想要导出这些方法的类再遵守这个协议就可以了
@protocol ObjcExportMethod <JSExport>

//JSExportAs宏将 "- showNumber1:andNumber2:"方法名 转换为showNumber(param1, param2)
//如果不使用JSExportAs转换，那么在js中调用的函数名为showNumber1AndNumber2(param1, param2);
//注意：JSExportAs宏只适合转换有参的方法，不能转换无参的方法
JSExportAs(showNumber,
           - (void)showNumber1:(NSNumber *)n1 andNumber2:(NSNumber *)n2
           );

JSExportAs(returnSum,
           - (NSNumber *)returnSumWithNum1:(NSNumber *)n1 andNum2:(NSNumber *)n2
           );

JSExportAs(dictTest,
           - (void)dictTest:(NSDictionary *)dict
           );

JSExportAs(arrayTest,
           - (void)arrayTest:(NSArray *)array
           );

- (void)show;
- (NSString *)returnString;
- (NSDictionary *)returnDict;
- (NSArray *)returnArray;

@end



@interface ViewController : UIViewController


@end

