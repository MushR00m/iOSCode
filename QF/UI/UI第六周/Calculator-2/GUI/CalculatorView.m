//
//  CalculatorView.m
//  Calculator
//
//  Created by chen cheng on 14-8-19.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "CalculatorView.h"

@implementation CalculatorView


- (void)setOperatorType:(OperatorType)operatorType
{
    if (_operatorType == operatorType)
    {
        return;
    }
    
    _operatorType = operatorType;
    
    if (_operatorType == OperatorTypeNone)
    {
        _operatorDivButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorDivButton.layer.borderWidth = 1;
        
        _operatorMulButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorMulButton.layer.borderWidth = 1;
        
        _operatorSubButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorSubButton.layer.borderWidth = 1;
        
        _operatorAddButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorAddButton.layer.borderWidth = 1;
    }
    else if (_operatorType == OperatorTypeAdd)
    {
        _operatorDivButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorDivButton.layer.borderWidth = 1;
        
        _operatorMulButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorMulButton.layer.borderWidth = 1;
        
        _operatorSubButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorSubButton.layer.borderWidth = 1;
        
        _operatorAddButton.layer.borderColor = [UIColor blackColor].CGColor;
        _operatorAddButton.layer.borderWidth = 2;
    }
    else if (_operatorType == OperatorTypeSub)
    {
        _operatorDivButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorDivButton.layer.borderWidth = 1;
        
        _operatorMulButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorMulButton.layer.borderWidth = 1;
        
        _operatorSubButton.layer.borderColor = [UIColor blackColor].CGColor;
        _operatorSubButton.layer.borderWidth = 2;
        
        _operatorAddButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorAddButton.layer.borderWidth = 1;
    }
    else if (_operatorType == OperatorTypeMul)
    {
        _operatorDivButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorDivButton.layer.borderWidth = 1;
        
        _operatorMulButton.layer.borderColor = [UIColor blackColor].CGColor;
        _operatorMulButton.layer.borderWidth = 2;
        
        _operatorSubButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorSubButton.layer.borderWidth = 1;
        
        _operatorAddButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorAddButton.layer.borderWidth = 1;
    }
    else if (_operatorType == OperatorTypeDiv)
    {
        _operatorDivButton.layer.borderColor = [UIColor blackColor].CGColor;
        _operatorDivButton.layer.borderWidth = 2;
        
        _operatorMulButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorMulButton.layer.borderWidth = 1;
        
        _operatorSubButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorSubButton.layer.borderWidth = 1;
        
        _operatorAddButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorAddButton.layer.borderWidth = 1;
    }



}

- (void)dealloc
{
    [_resultLabel release];
    _resultLabel = nil;
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1;
        
        
        _resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 80)];
        _resultLabel.backgroundColor = [UIColor blackColor];
        _resultLabel.textColor = [UIColor whiteColor];
        _resultLabel.font = [UIFont systemFontOfSize:40];
        _resultLabel.textAlignment = NSTextAlignmentRight;
        
        _resultLabel.text = @"0";
        
        [self addSubview:_resultLabel];
        
        
        CGFloat  buttonWidth = self.frame.size.width/4.0;
        CGFloat  buttonHeight = (self.frame.size.height-_resultLabel.frame.size.height)/5.0;
        
        
        _operatorDivButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _operatorDivButton.tag = '/';
        [_operatorDivButton addTarget:self action:@selector(operatorButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _operatorDivButton.backgroundColor = [UIColor orangeColor];
        [_operatorDivButton setTitle:@"/" forState:UIControlStateNormal];
        _operatorDivButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [_operatorDivButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        
        _operatorDivButton.frame = CGRectMake(buttonWidth * 3, _resultLabel.frame.size.height, buttonWidth, buttonHeight);
        
        _operatorDivButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorDivButton.layer.borderWidth = 1;
        
        [self addSubview:_operatorDivButton];
        
        
        _operatorMulButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _operatorMulButton.tag = '*';
        [_operatorMulButton addTarget:self action:@selector(operatorButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _operatorMulButton.backgroundColor = [UIColor orangeColor];
        [_operatorMulButton setTitle:@"*" forState:UIControlStateNormal];
        _operatorMulButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [_operatorMulButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        
        _operatorMulButton.frame = CGRectMake(buttonWidth * 3, _resultLabel.frame.size.height + buttonHeight, buttonWidth, buttonHeight);
        
        
        _operatorMulButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorMulButton.layer.borderWidth = 1;
        
        [self addSubview:_operatorMulButton];
        
        
        _operatorSubButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _operatorSubButton.tag = '-';
        [_operatorSubButton addTarget:self action:@selector(operatorButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _operatorSubButton.backgroundColor = [UIColor orangeColor];
        [_operatorSubButton setTitle:@"-" forState:UIControlStateNormal];
        _operatorSubButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [_operatorSubButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        
        _operatorSubButton.frame = CGRectMake(buttonWidth * 3, _resultLabel.frame.size.height + buttonHeight*2, buttonWidth, buttonHeight);
        
        
        _operatorSubButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorSubButton.layer.borderWidth = 1;
        
        [self addSubview:_operatorSubButton];
        
        
        
        
        _operatorAddButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _operatorAddButton.tag = '+';
        [_operatorAddButton addTarget:self action:@selector(operatorButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _operatorAddButton.backgroundColor = [UIColor orangeColor];
        [_operatorAddButton setTitle:@"+" forState:UIControlStateNormal];
        _operatorAddButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [_operatorAddButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        
        _operatorAddButton.frame = CGRectMake(buttonWidth * 3, _resultLabel.frame.size.height + buttonHeight * 3, buttonWidth, buttonHeight);
        
        _operatorAddButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorAddButton.layer.borderWidth = 1;
        
        [self addSubview:_operatorAddButton];

        
        _operatorResultButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _operatorResultButton.tag = '=';
        [_operatorResultButton addTarget:self action:@selector(operatorButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _operatorResultButton.backgroundColor = [UIColor orangeColor];
        [_operatorResultButton setTitle:@"=" forState:UIControlStateNormal];
        _operatorResultButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [_operatorResultButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        
        _operatorResultButton.frame = CGRectMake(buttonWidth * 3, _resultLabel.frame.size.height + buttonHeight * 4, buttonWidth, buttonHeight);
        
        _operatorResultButton.layer.borderColor = [UIColor grayColor].CGColor;
        _operatorResultButton.layer.borderWidth = 1;
        
        [self addSubview:_operatorResultButton];
        
        [self createOperatorNumberButton];

    }
    return self;
}

- (void)createOperatorNumberButton
{
    CGFloat  buttonWidth = self.frame.size.width/4.0;
    CGFloat  buttonHeight = (self.frame.size.height-_resultLabel.frame.size.height)/5.0;
    
    for (int i=0; i<5; i++)
    {
        for (int j=0; j<3; j++)
        {
            if (i == 4 && j == 1)
            {
                continue;
            }
            
            UIButton  *operatorNumberButton = [UIButton buttonWithType:UIButtonTypeCustom];
            
            if (i == 4 && j == 0)
            {
                operatorNumberButton.frame = CGRectMake(buttonWidth * j, _resultLabel.frame.size.height +buttonHeight * i, buttonWidth*2, buttonHeight);
            }
            else
            {
                operatorNumberButton.frame = CGRectMake(buttonWidth * j, _resultLabel.frame.size.height +buttonHeight * i, buttonWidth, buttonHeight);
            }
            
            [operatorNumberButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            operatorNumberButton.titleLabel.font = [UIFont systemFontOfSize:20];
            
            if (i == 0)
            {
                if (j == 0)
                {
                    [operatorNumberButton setTitle:@"AC" forState:UIControlStateNormal];
                    
                    operatorNumberButton.tag = 'A';
                }
                if (j == 1)
                {
                    [operatorNumberButton setTitle:@"+/-" forState:UIControlStateNormal];
                    operatorNumberButton.tag = '+';
                }
                if (j == 2)
                {
                    [operatorNumberButton setTitle:@"%" forState:UIControlStateNormal];
                    operatorNumberButton.tag = '%';
                }
            }
            if (i == 1)
            {
                [operatorNumberButton setTitle:[NSString stringWithFormat:@"%c", '7' + j] forState:UIControlStateNormal];
                operatorNumberButton.tag = '7' + j;
            }
            else if (i == 2)
            {
                [operatorNumberButton setTitle:[NSString stringWithFormat:@"%c", '4' + j] forState:UIControlStateNormal];
                operatorNumberButton.tag = '4' + j;
            }
            else if (i == 3)
            {
                [operatorNumberButton setTitle:[NSString stringWithFormat:@"%c", '1' + j] forState:UIControlStateNormal];
                operatorNumberButton.tag = '1' + j;
            }
            else if (i == 4)
            {
                if (j == 0)
                {
                    [operatorNumberButton setTitle:@"0" forState:UIControlStateNormal];
                    operatorNumberButton.tag = '0';
                }
                else if (j == 2)
                {
                    [operatorNumberButton setTitle:@"." forState:UIControlStateNormal];
                    operatorNumberButton.tag = '.';
                }
            }


            [operatorNumberButton addTarget:self action:@selector(operatorNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            
            
            operatorNumberButton.layer.borderColor = [UIColor grayColor].CGColor;
            operatorNumberButton.layer.borderWidth = 1;
            
            [self addSubview:operatorNumberButton];
        }
    }
}


- (void)operatorButtonClick:(UIButton *)operatorButton
{
    NSLog(@"operatorButton.tag = %d", operatorButton.tag);
    
    if (operatorButton.tag == '=')
    {
        if (self.calculatorState != CalculatorStateInputingNumber2)
        {
            return;
        }
        //1、先进行计算
        _number2MutableString = [_resultLabel.text mutableCopy];
        
        _number1 = [_number1MutableString floatValue];
        _number2 = [_number2MutableString floatValue];
        
        CGFloat z = 0;
        
        if (self.operatorType == OperatorTypeAdd)
        {
            z = _number1 + _number2;
        }
        else if (self.operatorType == OperatorTypeSub)
        {
            z = _number1 - _number2;
        }
        else if (self.operatorType == OperatorTypeMul)
        {
            z = _number1 * _number2;
        }
        else if (self.operatorType == OperatorTypeDiv)
        {
            z = _number1 / _number2;
        }
        
        _resultLabel.text = [NSString stringWithFormat:@"%g", z];
        
        
        //2、改变计算器的状态
        self.calculatorState = CalculatorStateComplete;
        self.operatorType = OperatorTypeNone;
    }
    else if (operatorButton.tag == '+')
    {
        //改变计算器的状态
        self.calculatorState = CalculatorStateStartInputNumber2;
        self.operatorType = OperatorTypeAdd;
    }
    else if (operatorButton.tag == '-')
    {
        //改变计算器的状态
        self.calculatorState = CalculatorStateStartInputNumber2;
        self.operatorType = OperatorTypeSub;
    }
    else if (operatorButton.tag == '*')
    {
        //改变计算器的状态
        self.calculatorState = CalculatorStateStartInputNumber2;
        self.operatorType = OperatorTypeMul;
    }
    else if (operatorButton.tag == '/')
    {
        //改变计算器的状态
        self.calculatorState = CalculatorStateStartInputNumber2;
        self.operatorType = OperatorTypeDiv;
    }
}

- (void)operatorNumberButtonClick:(UIButton *)operatorNumberButton
{
    NSLog(@"operatorNumberButton.tag = %d", operatorNumberButton.tag);
    if (self.calculatorState == CalculatorStateStartInputNumber1)
    {
        //1、再清空_resultLabel.text
        _resultLabel.text = @"";
        
        //2、改变计算器的状态
        self.calculatorState = CalculatorStateInputingNumber1;
    }
    else if (self.calculatorState == CalculatorStateStartInputNumber2)
    {
        //1、先备份第一个操作数据
        _number1MutableString = [_resultLabel.text mutableCopy];
        
        //2、再清空_resultLabel.text
        _resultLabel.text = @"";
        
        //3、改变计算器的状态
        self.calculatorState = CalculatorStateInputingNumber2;
    }
    
    
    if (operatorNumberButton.tag == 'A')
    {
        _resultLabel.text = @"0";
        
        if (self.calculatorState == CalculatorStateInputingNumber1)
        {
            self.calculatorState = CalculatorStateStartInputNumber1;
            self.operatorType = OperatorTypeNone;
        }
        else if (self.calculatorState == CalculatorStateInputingNumber2)
        {
            self.calculatorState = CalculatorStateStartInputNumber1;
            self.operatorType = OperatorTypeNone;
        }
    }
    else if (operatorNumberButton.tag == '+')
    {
        NSMutableString  *mutableString = [_resultLabel.text mutableCopy];
        
        NSLog(@"[mutableString length] = %d", [mutableString length]);
        
        if ([mutableString length] == 0)
        {
            _resultLabel.text = @"-0";
           /* if (self.calculatorState == CalculatorStateInputingNumber1)
            {
                self.calculatorState = CalculatorStateStartInputNumber1;
            }
            else if (self.calculatorState == CalculatorStateInputingNumber2)
            {
                self.calculatorState = CalculatorStateStartInputNumber2;
            }*/
        }
        else
        {
            if ([mutableString UTF8String][0] == '-')
            {
                [mutableString deleteCharactersInRange:NSMakeRange(0, 1)];
            }
            else
            {
                [mutableString insertString:@"-" atIndex:0];
            }
            
            _resultLabel.text = mutableString;
        }
        
        [mutableString release];
    }
    else if (operatorNumberButton.tag == '%')
    {
        NSMutableString  *mutableString = [_resultLabel.text mutableCopy];
        
        CGFloat number = [mutableString floatValue];
        
        [mutableString release];
        
        number = number/100.0;
        
        _resultLabel.text = [NSString stringWithFormat:@"%g", number];
        
    }
    else if (operatorNumberButton.tag >= '0' && operatorNumberButton.tag <= '9')
    {
        NSMutableString *operatorNumberMutableString = [_resultLabel.text mutableCopy];
        
        [operatorNumberMutableString appendString:[NSString stringWithFormat:@"%c", operatorNumberButton.tag]];
        
        _resultLabel.text = operatorNumberMutableString;
        
        [operatorNumberMutableString release];
    }
    else if (operatorNumberButton.tag == '.')
    {
        NSMutableString  *mutableString = [_resultLabel.text mutableCopy];
        
        if ([mutableString rangeOfString:@"."].length == 1)
        {
            [mutableString release];
            return;
        }

        [mutableString appendString:@"."];
        
        _resultLabel.text = mutableString;
        
        [mutableString release];
    }
}


@end
