//
//  ViewControllerTests.m
//  LocationTest
//
//  Created by Andrew Lloyd on 23/01/2015.
//  Copyright (c) 2015 Andrew Lloyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface ViewControllerTests : XCTestCase

@property ViewController *viewController;

@end

@implementation ViewControllerTests

- (void)setUp {
    [super setUp];
    
    self.viewController = [[ViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testLoadingIndicatorStartsAndStopsOnFailedCalls
{
    [self.viewController viewDidLoad];
    
    XCTAssertTrue([self.viewController.loadingIndicator isHidden]);

    [self.viewController findMeTouchUpInside:(nil)];
    
    XCTAssertFalse([self.viewController.loadingIndicator isHidden]);
}

@end
