//
//  LocationTests.m
//  LocationTest
//
//  Created by Andrew Lloyd on 23/01/2015.
//  Copyright (c) 2015 Andrew Lloyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "LocationManager.h"

@interface LocationTests : XCTestCase

@property LocationManager *locationManager;
@property BOOL downloadComplete;

@end

@implementation LocationTests

- (void)setUp {
    [super setUp];
    self.locationManager = [[LocationManager alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testFindingLocationIsSet
{
    //Send it a location
    CLLocation *location = [[CLLocation alloc]initWithLatitude:10 longitude:10];
    NSArray *locations = @[location];
    
    //simulate three calls of location being updated
    [self.locationManager locationManager:nil didUpdateLocations:locations];
    [self.locationManager locationManager:nil didUpdateLocations:locations];
    [self.locationManager locationManager:nil didUpdateLocations:locations];
    XCTAssertEqualObjects(self.locationManager.location, location);
    
    //clear location manager once used
    XCTAssertNil(self.locationManager.locationManager);
}

- (void)testUpdateLocation
{
    //Send it a location
    CLLocation *location = [[CLLocation alloc]initWithLatitude:10 longitude:10];
    NSArray *locations = @[location];
    
    //simulate three calls of location being updated
    [self.locationManager locationManager:nil didUpdateLocations:locations];
    [self.locationManager locationManager:nil didUpdateLocations:locations];
    [self.locationManager locationManager:nil didUpdateLocations:locations];
    
    XCTAssertEqualObjects(self.locationManager.location, location);
    
    //Send it a new location
    CLLocation *newLocation = [[CLLocation alloc]initWithLatitude:50 longitude:50];
    NSArray *newLocations = @[newLocation];
    
    [self.locationManager locationManager:nil didUpdateLocations:newLocations];
    [self.locationManager locationManager:nil didUpdateLocations:newLocations];
    [self.locationManager locationManager:nil didUpdateLocations:newLocations];
    
    XCTAssertEqualObjects(self.locationManager.location, newLocation);
}

-(void)testFetchLocationName
{
    //Send it a location with London, UK coordinates
    CLLocation *location = [[CLLocation alloc]initWithLatitude:51.5085300 longitude:-0.1257400];
    NSArray *locations = @[location];
    
    //simulate three calls of location being updated
    [self.locationManager locationManager:nil didUpdateLocations:locations];
    [self.locationManager locationManager:nil didUpdateLocations:locations];
    [self.locationManager locationManager:nil didUpdateLocations:locations];
    
    //perform to allow threads to complete
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
    
    XCTAssertEqualObjects([self.locationManager stringForLocationCountry], @"United Kingdom");
}


@end
