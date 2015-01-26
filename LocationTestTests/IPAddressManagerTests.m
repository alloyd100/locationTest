//
//  IPAddressManagerTests.m
//  LocationTest
//
//  Created by Andrew Lloyd on 25/01/2015.
//  Copyright (c) 2015 Andrew Lloyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IPAddressManager.h"

@interface IPAddressManagerTests : XCTestCase

@end

@implementation IPAddressManagerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIPAddressCountryFetch
{
    XCTAssertNotNil([IPAddressManager countryForIPAddress]);
}

@end
