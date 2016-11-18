//
//  ViewController.m
//  xls
//
//  Created by tongguan on 7/28/16.
//  Copyright © 2016 ruiwenfeng. All rights reserved.
//

#import "ViewController.h"
#import "DHxlsReader.h"
#import "DHcell.h"
@interface ViewController ()
@property (strong,nonatomic)DHxlsReader * reader;
@end

@implementation ViewController

- (void)viewDidLoad { 
    [super viewDidLoad];
    
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"xls"];
    _reader = [DHxlsReader xlsReaderWithPath:filePath];
    
    for (NSUInteger row = 1; row <= 10; row ++) {
        for (NSUInteger col = 1; col <= 10; col ++) {
            DHcell * cell = [_reader cellInWorkSheetIndex:0 row:row col:col];
            switch(cell.type) {
                case cellString:    NSLog(@"cellString:%@",cell.str);   break;
                case cellBlank:     NSLog(@"cellBlank!");               break;
                case cellInteger:	NSLog(@"cellInteger:%@",cell.val);	break;
                case cellFloat:		NSLog(@"cellFloat:%@",cell.val);	break;
                case cellBool:		NSLog(@"cellBool:%@",cell.val);     break;
                case cellError:		NSLog(@"cellError:%@",cell.val);	break;
                default: break;
            }
        }
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
