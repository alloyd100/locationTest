//
//  LocationManager.h
//  LocationTest
//
//  Created by Andrew Lloyd on 23/01/2015.
//  Copyright (c) 2015 Andrew Lloyd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

typedef void (^CurrentLocationCompletionHandler)(BOOL success);

@interface LocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property CLLocation *location;

- (void)currentUserLocation:(CurrentLocationCompletionHandler)completionHandler;
- (NSString*)stringForLocationCountry;
- (NSString*)stringForISOCode;

@end
