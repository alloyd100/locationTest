//
//  LocationManagerDelegate.h
//  LocationTest
//
//  Created by Andrew Lloyd on 23/01/2015.
//  Copyright (c) 2015 Andrew Lloyd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <Foundation/Foundation.h>

@interface LocationManagerDelegate : NSObject <CLLocationManagerDelegate>

@property (nonatomic) CLLocationManager *locationManager;

-(void)displayLocationServicesDisabledError;

@end
