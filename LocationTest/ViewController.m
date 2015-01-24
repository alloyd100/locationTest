//
//  ViewController.m
//  LocationTest
//
//  Created by Andrew Lloyd on 23/01/2015.
//  Copyright (c) 2015 Andrew Lloyd. All rights reserved.
//

#import "ViewController.h"
#import "LocationManager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;
@property (strong, nonatomic) LocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.loadingIndicator setHidden:YES];
    self.locationManager = [[LocationManager alloc] init];
}


- (IBAction)findMeTouchUpInside:(id)sender
{
    [self.loadingIndicator setHidden:NO];
    [self.loadingIndicator startAnimating];
    
    
    [self.locationManager startUpdatingLocation];
    
//    [self.locationManager :self.flightSearch.managedObjectContext
//               withCompletionHandler: ^(Airport *closestAirport) {
//                   if (closestAirport)
//                   {
//                       weakSelf.flightSearch.fromAirport = closestAirport;
//                       [gpsButton setAsFound];
//                   }
//                   else
//                   {
//                       [gpsButton setAsNotFound];
//                   }
//                   [gpsButton stopAnimating];
//               }];
}


@end
