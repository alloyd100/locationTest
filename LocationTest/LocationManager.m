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
@property NSString *isoCountryCode;
@property int locationGrabCount;

@property (nonatomic, copy) CurrentLocationCompletionHandler completionHandler;

@end

@implementation LocationManager

-(void)displayLocationServicesError:(NSString*)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Services Unavailable"
                                                    message:error
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)currentUserLocation:(CurrentLocationCompletionHandler)completionHandler
{
    self.completionHandler = completionHandler;
    self.countryName = nil;
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    self.locationGrabCount = 0;
    [self.locationManager startUpdatingLocation];
}


- (void)stopUpdatingLocation
{
    [self.locationManager stopUpdatingLocation];
    self.locationManager = nil;
}

-(NSString*)stringForLocationCountry
{
    return self.countryName;
}

-(NSString*)stringForISOCode
{
    return self.isoCountryCode.lowercaseString;
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
            self.isoCountryCode = placemark.ISOcountryCode;
            
            if (self.completionHandler)
            {
                self.completionHandler(TRUE);
            }
        }
    }];
}
# pragma mark CLLocationManager Delegate Methods
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    self.locationGrabCount++;
 
    //make 3 calls, to allow enough time to update location before stop updating the location
    if (self.locationGrabCount > 2)
    {
        [self stopUpdatingLocation];
        
        CLLocation *newLocation = [locations lastObject];
        
        self.location = newLocation;
        
        [self fetchCountryNameForLocation:self.location];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Failed to update location with error: %@", error.localizedDescription);
    //self.completionHandler(FALSE);
    [self stopUpdatingLocation];
    
    [self displayLocationServicesError:error.localizedDescription];
    
    if (self.completionHandler)
    {
        self.completionHandler(FALSE);
    }
}


@end
