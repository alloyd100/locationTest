//
//  FlagImageManagerTests.m
//  LocationTest
//
//  Created by Andrew Lloyd on 25/01/2015.
//  Copyright (c) 2015 Andrew Lloyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "FlagImageManager.h"

@interface FlagImageManagerTests : XCTestCase

@end

@implementation FlagImageManagerTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testFlagFileNameCalledCorrectly
{
    UIImage *result = [FlagImageManager flagImageForCountryISOCode:@"us"];
    XCTAssertEqualObjects(result, [UIImage imageNamed:@"us.png"]);
}

@end
