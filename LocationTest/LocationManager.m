//
//  LocationManager.m
//  LocationTest
//
//  Created by Andrew Lloyd on 23/01/2015.
//  Copyright (c) 2015 Andrew Lloyd. All rights reserved.
//

#import "LocationManager.h"


@interface LocationManager ()

@property NSString *countryName;

@property (nonatomic, weak) CLLocation *location;

@end

@implementation LocationManager

-(void)displayLocationServicesDisabledError
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Services Disabled"
                                                    message:@"To re-enable, please go to Settings and allow Location Services for this app."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)startUpdatingLocation
{
    if (nil == _locationManager)
    {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        _locationManager.pausesLocationUpdatesAutomatically = FALSE;
    }

    [_locationManager startUpdatingLocation];
}

- (void)stopUpdatingLocation
{
    [_locationManager stopUpdatingLocation];
    _locationManager = nil;
}

-(NSString*)countryLocation
{
    [self fetchCountryNameForLocation:self.location];
    return self.countryName;
}

-(void)fetchCountryNameForLocation:(CLLocation*)location
{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog(@"Error %@", error.localizedDescription);
        } else {
            CLPlacemark *placemark = [placemarks lastObject];
            self.countryName = placemark.country;
        }
    }];
}

# pragma mark CLLocationManager Delegate Methods
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    self.location = [locations lastObject];
    [self stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Failed to update location with error: %@", error.localizedDescription);
    [self stopUpdatingLocation];
}

@end
