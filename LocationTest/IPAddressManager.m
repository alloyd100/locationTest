//
//  IPAddressManager.m
//  LocationTest
//
//  Created by Andrew Lloyd on 25/01/2015.
//  Copyright (c) 2015 Andrew Lloyd. All rights reserved.
//

#import "IPAddressManager.h"


@implementation IPAddressManager


+(NSString*)countryForIPAddress
{
    NSURL *ipAddressApi = [NSURL URLWithString:@"http://www.telize.com/geoip"];
    
    NSData *dataResults = [NSData dataWithContentsOfURL:ipAddressApi];

    NSDictionary *locationDictionary = [NSJSONSerialization JSONObjectWithData:dataResults
                                                                    options:0
                                                                      error:NULL];
    
    NSString *countryString = [locationDictionary valueForKeyPath:@"country"];
    
    return countryString;
}

@end
