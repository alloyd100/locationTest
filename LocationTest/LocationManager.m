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
@property (nonatomic, copy) CurrentLocationCompletionHandler completionHandler;

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
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
        if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [self.locationManager requestWhenInUseAuthorization];
        }
        
        [self.locationManager startUpdatingLocation];
    }
    
}

- (void)stopUpdatingLocation
{
    [self.locationManager stopUpdatingLocation];
}

-(NSString*)stringForLocationCountry
{
    return self.countryName;
}

//-(void)fetchCountryNameForLocation:(CLLocation*)location withCompletionHandler:(CurrentLocationCompletionHandler*)completionHandler
//{
//    self.completionHandler = completionHandler;
//    
//    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
//    
//    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
//        if (error) {
//            NSLog(@"Error %@", error.localizedDescription);
//        } else {
//            CLPlacemark *placemark = [placemarks lastObject];
//            self.countryName = placemark.country;
//        }
//    }];
//}
# pragma mark CLLocationManager Delegate Methods
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    [self stopUpdatingLocation];
    
    CLLocation *newLocation = [locations lastObject];
    
    if (self.completionHandler)
    {
        self.completionHandler(TRUE, newLocation);
    }
    
    //[self fetchCountryNameForLocation:self.location];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Failed to update location with error: %@", error.localizedDescription);
    self.completionHandler(FALSE, nil);
    [self stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusDenied)
    {
        [self displayLocationServicesDisabledError];
        
        [self stopUpdatingLocation];
    }
    else if (status == kCLAuthorizationStatusNotDetermined)
    {
        // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
        if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
        {
            [self.locationManager requestWhenInUseAuthorization];
        }
    }
}
        
@end
