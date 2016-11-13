//
//  SomeTest1.m
//  TestCase
//
//  Created by chensongqi on 16/11/3.
//  Copyright © 2016年 chensongqi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppDelegate.h"
#import "ViewController.h"

@interface SomeTest1 : XCTestCase

@property (nonatomic, strong) UIApplication *app;
@property (nonatomic, strong) ViewController *someVC;
@property (nonatomic, assign) NSInteger someInteger;

@end

@implementation SomeTest1

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.app = [UIApplication sharedApplication];
    self.someVC = (ViewController *)self.app.keyWindow.rootViewController;
    self.someInteger = 1;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testSomeTestMethon {
    [self.someVC testAction];
    self.someInteger++;
    NSLog(@"--- someInteger = %ld",(long)self.someInteger);
    XCTAssertTrue([[self.someVC someTestStr] isEqualToString:@"test"], @"Part 1 failed.");
}

- (void)testDocumentOpening
{
    
    // Create an expectation object.
    
    // This test only has one, but it's possible to wait on multiple expectations.
    
    XCTestExpectation *documentOpenExpectation = [self
                                                  expectationWithDescription:@"document open"];
    NSURL *URL = [[NSBundle bundleForClass:[self class]]
                  
                  URLForResource:@"TestDocument" withExtension:@"txt"];
    
    UIDocument *doc = [[UIDocument alloc] initWithFileURL:URL];
    
    [doc openWithCompletionHandler:^(BOOL success) {
        
        XCTAssert(success);
        
        // Possibly assert other things here about the document after it has
//        opened...
        // Fulfill the expectation-this will cause -waitForExpectation
        
        // to invoke its completion handler and then return.
        
        [documentOpenExpectation fulfill];
        
    }];
    
    
    
    // The test will pause here, running the run loop, until the timeout is hit
    
    // or all expectations are fulfilled.
    
    [self waitForExpectationsWithTimeout:1 handler:^(NSError *error) {
        
        [doc closeWithCompletionHandler:nil];
        
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        for (int i = 0; i< 100; i++) {
            NSLog(@"---- %d",i);
        }
    }];
}

@end
