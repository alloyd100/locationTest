//
//  LocationManagerDelegate.m
//  LocationTest
//
//  Created by Andrew Lloyd on 23/01/2015.
//  Copyright (c) 2015 Andrew Lloyd. All rights reserved.
//

#import "LocationManagerDelegate.h"

@implementation LocationManagerDelegate

-(void)displayLocationServicesDisabledError
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Services Disabled"
                                                    message:@"To re-enable, please go to Settings and allow Location Services for this app."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
