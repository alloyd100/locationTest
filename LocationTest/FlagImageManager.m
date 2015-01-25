//
//  FlagImageManager.m
//  LocationTest
//
//  Created by Andrew Lloyd on 25/01/2015.
//  Copyright (c) 2015 Andrew Lloyd. All rights reserved.
//

#import "FlagImageManager.h"

@implementation FlagImageManager

+ (UIImage*)flagImageForCountryISOCode:(NSString*)isoCode
{
    return [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", isoCode]];
}

@end
