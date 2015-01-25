//
//  FlagImageManager.h
//  LocationTest
//
//  Created by Andrew Lloyd on 25/01/2015.
//  Copyright (c) 2015 Andrew Lloyd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FlagImageManager : NSObject

+ (UIImage*)flagImageForCountryISOCode:(NSString*)isoCode;

@end
