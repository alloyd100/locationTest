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
#import "LocationManager.h"

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

- (void)testLocationManagerSetUp
{
    [self.viewController viewDidLoad];
    
    XCTAssertNotNil(self.viewController.locationManager);
}

- (void)testTwitterButtonDisabledAtStartUp
{
    [self.viewController viewDidLoad];
    
    XCTAssertFalse(self.viewController.TwitterButton.enabled);
}

- (void)testTwitterButton
{
    UIButton *sampleButton = [[UIButton alloc] init];
    [sampleButton setTitle:@"sample twitter button" forState:UIControlStateNormal];
    
    [self.viewController tweetThis:sampleButton];
}

- (void)testAlertDisplayedWhenIPandLocationDoNotMatchAndTextTurnedRed
{
    [self.viewController view];
    
    LocationManager *locMan = [[LocationManager alloc] init];
    
    locMan.ipAddressCountry = @"Ireland";
    locMan.countryName = @"United Kingdom";
    
    self.viewController.locationManager = locMan;
    
    [self.viewController updateView];
    
    //XCTAssertEqualObjects(self.viewController.countryLabel.textColor, [UIColor redColor]);
}


@end
