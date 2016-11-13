//
//  CalculatorView.h
//  Calculator
//
//  Created by chen cheng on 14-8-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, OperatorType)
{
    OperatorTypeNone = 0,
    OperatorTypeAdd,
    OperatorTypeSub,
    OperatorTypeMul,
    OperatorTypeDiv
};

typedef NS_ENUM(NSUInteger, CalculatorState)
{
    CalculatorStateStartInputNumber1 = 0, //即将开始输入第一个运算数据
    CalculatorStateInputingNumber1, //正在输入第一个运算数据
    CalculatorStateStartInputNumber2, //即将开始输入第二个运算数据
    CalculatorStateInputingNumber2, //正在输入第二个运算数据
    CalculatorStateComplete, //完成一次计算
};
 

@interface CalculatorView : UIView
{
    UILabel   *_resultLabel;
    
    UIButton  *_operatorAddButton;
    UIButton  *_operatorSubButton;
    UIButton  *_operatorMulButton;
    UIButton  *_operatorDivButton;
    UIButton  *_operatorResultButton;
    
    CGFloat   _number1;
    NSMutableString  *_number1MutableString;
    
    CGFloat   _number2;
    NSMutableString  *_number2MutableString;
    
    OperatorType _operatorType;
    
    CalculatorState _calculatorState;
    
    
}

@property(assign, readwrite, nonatomic) OperatorType operatorType;
@property(assign, readwrite, nonatomic) CalculatorState calculatorState;

@end
